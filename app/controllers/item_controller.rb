class ItemController < ApplicationController

  def index

    @item_popular = Item.all.where("click > ?", 1)
    @items_all = Item.all.page(params[:page]).per(10)

  end

  # 非同期クリック処理
  def click
    @now_click = Item.find_by(siteurl:params[:url]).click + 1
    Item.find_by(siteurl:params[:url]).update(click:@now_click)
    # 今回はDB操作のみな為データは返さない
    # render json: @now_click
  end

end
