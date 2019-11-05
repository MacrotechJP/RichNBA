class MypageController < ApplicationController

  # ユーザー情報アップデート
  def profile_update
    
    @user = User.find(current_user.id)
    if params[:user][:password] == "" then
      @user.update_attributes(email:params[:user][:email],team_id:params[:user][:team_id],player_id:params[:user][:player_id])
      redirect_to mypage_path
    else
      @user.update_attributes(email:params[:user][:email],password:params[:user][:password],team_id:params[:user][:team_id],player_id:params[:user][:player_id])
      redirect_to root_path
    end
    
  end

end
