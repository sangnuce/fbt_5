class NotificationsController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  def index
    @notifications = current_user.passive_notifications
      .order_created_desc.paginate page: params[:page],
      per_page: Settings.notifications.notifications_per_page
  end

  def update
    current_user.new_notifications.update_all is_new: false
    @notifications = current_user.passive_notifications
      .order_created_desc.paginate page: params[:page],
      per_page: Settings.notifications.notifications_per_page
    respond_to do |format|
      format.html {redirect_to notifications_path}
      format.js
    end
  end
end
