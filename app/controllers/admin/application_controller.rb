class Admin::ApplicationController < ActionController::Base
  layout "admin/application"
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t "flash.access_denied"
    redirect_to root_path
  end

  rescue_from ActiveRecord::RecordNotFound do
    flash[:danger] = t "flash.not_found"
    redirect_to admin_users_path
  end
end
