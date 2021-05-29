class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :follows]
  before_action :set_user, except: [:quit, :quit_confirm, :cancel_premium]
  before_action :set_current_user, only: [:quit, :quit_confirm, :cancel_premium]
  before_action :set_correct_user, only: [:edit, :update]

  def show
    if @user.is_deleted == true
      render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
    else
      @user_posts = PostRecipe.where(user_id: @user, is_draft: false).order(created_at: "DESC")
      @liked_posts = PostRecipe.includes(:user).joins(:likes).where(is_draft: false,'likes.user_id': @user.id).order('likes.created_at': "DESC")
      @saved_posts = PostRecipe.includes(:user).joins(:saved_recipes).where(is_draft: false,'saved_recipes.user_id': @user.id).order('saved_recipes.created_at': "DESC")
      @browsed_posts = PostRecipe.includes(:user).joins(:histories).where(is_draft: false,'histories.user_id': @user.id).order('histories.created_at': "DESC")
      @draft_posts = PostRecipe.where(user_id: @user, is_draft: true).order(created_at: "DESC")
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィールを更新しました！"
    else
      render :edit, alert: "プロフィールを更新できませんでした。"
    end
  end

  def cancel_premium
    if @user.update(is_paid: false)
      redirect_to user_path(@user.id), notice: "プレミアム・プランを解約しました。"
    else
      render :edit, alert: "プラン変更ができませんでした。お手数ですが、再度お試しください。"
    end
  end

  def quit_confirm
    if @user.id == 1
      redirect_to root_path, alert: "恐れ入りますが、ゲスト・アカウントでは退会できません。"
    else
      render :quit_confirm
    end
  end

  def quit
    @user.update(is_deleted: true)
    @user.post_recipes.update(is_draft: true)
    @user.comments.destroy_all
    @user.histories.destroy_all
    @user.likes.destroy_all
    @user.saved_recipes.destroy_all
    @user.active_relationships.destroy_all
    @user.passive_relationships.destroy_all
    reset_session
    redirect_to root_path
    flash[:notice] = "ご利用いただき、ありがとうございました。"
  end

  def follows
    @followings = @user.followings
    @followers = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :profile_image, :is_paid, :is_deleted, :introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    @user = current_user
  end

  def set_correct_user
    redirect_to root_path unless @user == current_user
  end
end
