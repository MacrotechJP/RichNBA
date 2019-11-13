class ItemController < ApplicationController

  # トップページ
  def index
    @items_popular = Item.all.order(click: "DESC").limit(10) #人気の商品
    @items_all = Item.all.page(params[:page])                #最新の商品
  end

  # 商品検索
  def search
    # binding.pry
    if params[:q].present?
      @search = Item.where("name LIKE ?", "%"+params[:keyword]+"%").page(params[:page]).ransack(params[:q])
      @items = @search.result
    else
      params[:q] = { sorts: 'id desc' }
      @search = Item.where("name LIKE ?", "%"+params[:keyword]+"%").page(params[:page]).ransack(params[:q])
      @items = @search.result
    end
    @keyword = params[:keyword]
    gon.keyword = params[:keyword]
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
      @checkitem = ItemUser.where(user_id:current_user.id).pluck(:item_id)
      @ajax_items = [@items_all,@checkitem]
      render json: @ajax_items
    elsif params[:location_url]=="search_page" then
      @items_all = Item.where("name LIKE ?", "%"+params[:search_keyword]+"%").page(params[:next_url])
      @checkitem = ItemUser.where(user_id:current_user.id).pluck(:item_id)
      @ajax_items = [@items_all,@checkitem]
      render json: @ajax_items
    end
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
