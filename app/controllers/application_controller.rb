class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :email,
      :password, :password_confirmation, :phone, :address]
  end

  def after_sign_in_path_for current_user
    if current_user.is_admin?
      admin_users_path
    else
      root_path
    end
  end
end
