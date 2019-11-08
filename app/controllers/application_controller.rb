class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :header_itemcheck

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :password, :password_confirmation,:team_id,:player_id]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  def header_itemcheck
    @item_check = ItemUser.where(["user_id = ? ", current_user.id]).select(:id)      #取り置き商品
    @item_checkitem = Item.where("id IN (?) " ,@item_check)
  end

end
