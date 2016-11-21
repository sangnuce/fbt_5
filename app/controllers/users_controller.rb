class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  before_action :correct_user

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

  def correct_user
    redirect_to root_path unless @user.current_user? current_user
  end
end
