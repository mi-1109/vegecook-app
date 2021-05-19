class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only:[:show, :edit, :update]

  def index
    @users = User.page(params[:page])
    @user_count = User.count
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "会員ステータスを更新しました"
    else
      render :edit, alert: "会員ステータスを更新できませんでした"
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :is_paid, :is_deleted)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
