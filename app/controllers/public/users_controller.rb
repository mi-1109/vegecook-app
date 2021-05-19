class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except:[:show, :follows]
  before_action :set_user, except:[:quit, :quit_confirm]
  before_action :set_current_user, only:[:quit, :quit_confirm]
  before_action :prohibit_guest_quit, only:[:quit_confirm]
  before_action :deny_quitted_user_signin, only:[:show]

  def show
    @user_posts = PostRecipe.where(user_id: @user, is_draft: false).order(created_at: "DESC")
    @liked_posts = @user.liked_posts.where(is_draft: false).order(created_at: "DESC")
    @saved_posts = @user.saved_posts.includes(:user).where(is_draft: false).order(created_at: "DESC")
    @browsed_posts = @user.browsed_posts.includes(:user).where(is_draft: false)
    @draft_posts = PostRecipe.where(user_id: @user, is_draft: true)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィールを更新しました！"
    else
      render action: :edit, alert: "プロフィールを更新できませんでした。"
    end
  end

  def quit_confirm
  end

  def quit
    @user.update(is_deleted: true)
    @user.post_recipes.destroy_all
    @user.comments.destroy_all
    @user.form_inquiries.destroy_all
    @user.chats.destroy_all
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

  def deny_quitted_user_signin
    user = User.find(params[:id])
    if user.is_deleted == true
      render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
    end
  end

  def prohibit_guest_quit
    @user = current_user
    if @user.email == 'guest@example.com'
      redirect_to root_path, alert: "恐れ入りますが、ゲスト・アカウントでは会員の変更・退会できません。"
    end
  end

end
