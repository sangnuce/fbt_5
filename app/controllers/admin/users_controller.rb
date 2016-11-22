class Admin::UsersController < Admin::ApplicationController
  load_and_authorize_resource

  def index
    @users = User.search(search_params).result.all_customer
      .paginate page: params[:page], per_page: Settings.users.order_per_page
  end

  private
  def  search_params
    params.permit :name_or_email_cont, :phone_cont
  end
end
