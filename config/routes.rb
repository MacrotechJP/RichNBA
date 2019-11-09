Rails.application.routes.draw do
  devise_for :users

  root "item#index"
  get "/search" ,to:"item#search"
  get "/info" ,to:"infomation#index"
  get "/mypage" ,to:"mypage#index"
  get "/mypage/checkitem" ,to:"mypage#checkitem"
  
  # ユーザー情報アップデート
  post "mypage/profile_update",to:"mypage#profile_update"
  patch "mypage/profile_update",to:"mypage#profile_update"
  # 商品クリック時非同期DB操作
  get "item/click" ,to:"item#click"
  get "item/additem" ,to:"item#additem"
  get "item/checkitem" ,to:"item#checkitem"
end
