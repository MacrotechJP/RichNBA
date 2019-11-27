class ItemController < ApplicationController

  # 検索時処理
  def search_detail
    # キーワードの検索条件
    if params[:keyword] == nil then
      @items_search = Item.all
    else
      @items_search = Item.where("name LIKE ?", "%"+params[:keyword]+"%")
    end
    # 価格範囲の検索条件
    if params[:min_price] == "" && params[:max_price] == "" || params[:min_price] == nil && params[:max_price] == nil then
      @items_price = @items_search
    elsif params[:min_price] != "" && params[:max_price] == "" then
      @items_price = @items_search.where("price >= ?", params[:min_price])
    elsif params[:min_price] == "" && params[:max_price] != "" then
      @items_price = @items_search.where("price <= ?", params[:max_price])
    elsif params[:min_price] != "" && params[:max_price] != "" then
      @items_price = @items_search.where(price: params[:min_price]..params[:max_price])
    end
    # ECサイトの検索条件
    if params[:ecsite] == "" || params[:ecsite] == nil then
      @items_ecsite = @items_price
    elsif params[:ecsite] != "" then
      @items_ecsite = @items_price.where("ecsite_id = ?",params[:ecsite])
    end
    # チームの検索条件
    if params[:team] == "" || params[:team] == nil then
      @items_team = @items_ecsite
    elsif params[:team] != "" then
      @items_team = @items_ecsite.where("team_id = ?",params[:team])
    end
    # 選手の検索条件
    if params[:player] == "" || params[:player] == nil then
      @items_player = @items_team
    elsif params[:player] != "" then
      @items_player = @items_team.where("player_id = ?",params[:player])
    end
  end

  # トップページ
  def index
    @items_popular = Item.all.order(click: "DESC").limit(10) #人気の商品
    @items_all = Item.all.page(params[:page])                #最新の商品
  end

  # 商品検索
  def search
    unless params[:q].present?
      params[:q] = { sorts: 'id desc' }
    end
    search_detail()
    @search = @items_player.ransack(params[:q])
    @items_count = @search.result.count
    @items = @search.result.page(params[:page])
    @keyword = params[:keyword]
    gon.sort = params[:q][:sorts]
    gon.keyword = params[:keyword]
    gon.min_price = params[:min_price]
    gon.max_price = params[:max_price]
    gon.ecsite = params[:ecsite]
    gon.team = params[:team]
    gon.player = params[:player]
  end

  # 非同期クリック処理
  def click
    @now_click = Item.find_by(siteurl:params[:url]).click + 1
    Item.find_by(siteurl:params[:url]).update(click:@now_click)
    # 今回はDB操作のみな為データは返さない
    # render json: @now_click
  end
  # 非同期スクロール商品読み込み
  def additem
    if params[:location_url]=="top_page" then
      @items_all = Item.all.page(params[:page]).page(params[:next_url])
    elsif params[:location_url]=="search_page" then
      search_detail()
      case params[:search_sort]
      when "id desc" then
        @order = "ID DESC"
      when "click desc" then
        @order = "CLICK DESC"
      when "price desc" then
        @order = "PRICE DESC"
      when "price asc" then
        @order = "ID DESC"
      end
      @items_all = @items_player.order(@order).page(params[:next_url])
    end
    if user_signed_in? then
      @checkitem = ItemUser.where(user_id:current_user.id).pluck(:item_id)
    else
      @checkitem = []
    end
    @ajax_items = [@items_all,@checkitem]
    render json: @ajax_items
  end
  # 非同期取り置きアイテムチェック処理
  def checkitem
    @item = Item.find_by(siteurl:params[:siteurl]).id
    if params[:check] == "true" then
      ItemUser.create(item_id:@item,user_id:current_user.id)
    else
      ItemUser.where(item_id:@item,user_id:current_user.id).destroy_all	
    end
  end

end
