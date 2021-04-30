class Admin::UsersController < ApplicationController

  def index
    @users = User.page(params[:page])
    @user_count = User.count
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :is_paid, :is_deleted)
  end

end
