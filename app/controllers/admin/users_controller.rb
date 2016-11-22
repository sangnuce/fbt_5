class Admin::UsersController < Admin::ApplicationController
  load_and_authorize_resource

  def index
    @users = User.search(search_params).result.order_desc.all_customer
      .paginate page: params[:page], per_page: Settings.users.order_per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "flash.add_user_success"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "flash.update_user_success"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  private
  def  search_params
    params.permit :name_or_email_cont, :phone_cont
  end

  def user_params
    params.require(:user).permit :email, :name, :phone, :address, :password,
      :password_confirmation
  end
end
