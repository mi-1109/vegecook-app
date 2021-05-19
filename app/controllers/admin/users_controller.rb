class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only:[:show, :edit, :update]
  before_action :prohibit_guest_quit, only:[:update]

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
      #会員を退会にする場合
      if @user.is_deleted == true
        @user.post_recipes.update(is_draft: true)
        @user.comments.destroy_all
        @user.histories.destroy_all
        @user.likes.destroy_all
        @user.saved_recipes.destroy_all
        @user.active_relationships.destroy_all
        @user.passive_relationships.destroy_all
      #会員を有効にする場合
      else
        @user.post_recipes.update(is_draft: false)
      end
      redirect_to admin_user_path(@user), notice: "会員ステータスを更新しました"
    else
      render :edit, alert: "会員ステータスを更新できませんでした"
    end
  end


  private

  def user_params
    params.require(:user).permit(:is_deleted)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def prohibit_guest_quit
    if @user.id == 1
      redirect_to admin_users_path, alert: "ゲスト会員は退会できません。"
    end
  end
end
