class MypageController < ApplicationController

  before_action :require_login

  # ユーザー情報アップデート
  def profile_update
    @user = User.find(current_user.id)
    if params[:user][:password] == "" then
      @user.update_attributes(email:params[:user][:email],team_id:params[:user][:team_id],player_id:params[:user][:player_id])
      redirect_to mypage_path, notice: 'ユーザー情報が更新されました'
    else
      @user.update_attributes(email:params[:user][:email],password:params[:user][:password],team_id:params[:user][:team_id],player_id:params[:user][:player_id])
      redirect_to root_path, notice: 'パスワードが更新されました。ログインし直して下さい！'
    end
  end

  # 取り置きグッズ
  def checkitem
    if params[:q].present?
      @q = @item_checkitem
      @search = @q.ransack(params[:q])
      @item_checkitem = @search.result
    else
      params[:q] = { sorts: 'id desc' }
      @q = @item_checkitem
      @search = @q.ransack(params[:q])
      @item_checkitem = @search.result
    end
    @ecsite = Ecsite.pluck(:imageurl)
  end

  private
  # ユーザーサインイン状況確認
  def require_login
    unless user_signed_in?
      flash[:error] = 'ログインしていません。ログインして下さい！'
      redirect_to new_user_session_path 
    end
  end

end
