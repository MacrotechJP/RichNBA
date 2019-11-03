Rails.application.routes.draw do
  devise_for :users

  root "item#index"
  get "/search" ,to:"item#search"
  get "/info" ,to:"infomation#index"
  get "/mypage" ,to:"mypage#index"
  get "/mypage/checkitem" ,to:"mypage#checkitem"

  # 商品クリック時非同期DB操作
  get "item/click" ,to:"item#click"
end
