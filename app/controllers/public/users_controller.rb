class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィールを更新しました！"
    else
      render action: :edit
    end
  end

  def quit_confirm
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :profile_image, :is_paid, :is_deleted, :veg_type, :introduction)
  end
end
