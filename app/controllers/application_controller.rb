class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :email,
      :password, :password_confirmation, :phone, :address]
    devise_parameter_sanitizer.permit :account_update, keys: [:name, :email,
      :password, :password_confirmation, :phone, :address, :current_password]
  end

  def after_update_path_for current_user
    user_path current_user
  end
end
