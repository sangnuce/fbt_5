class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  load_and_authorize_resource

  def show
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "flash.users.user_not_found"
      redirect_to root_path
    end
  end
end
