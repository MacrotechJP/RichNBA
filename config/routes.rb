Rails.application.routes.draw do
  devise_for :users

  root "item#index"
  post "/search" ,to:"item#search"
  get "/info" ,to:"infomation#index"
  get "/mypage" ,to:"mypage#index"
  get "/mypage/checkitem" ,to:"mypage#checkitem"

end
