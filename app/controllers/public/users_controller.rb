class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except:[:show, :follows]
  before_action :deny_quitted_user, only:[:show]
  before_action :prohibit_guest_quit, only:[:quit]

  def show
    @user = User.find(params[:id])
    @user_posts = PostRecipe.where(user_id: @user, is_draft: false)
    @liked_posts = @user.liked_posts.where(is_draft: false)
    @saved_posts = @user.saved_posts.includes(:user).where(is_draft: false)
    @browsed_posts = @user.browsed_posts.includes(:user).where(is_draft: false)
    @draft_posts = PostRecipe.where(user_id: @user, is_draft: true)
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
    @user = current_user
  end

  def quit
    @user = current_user
    @user.update(is_deleted: true)
    @user.post_recipes.destroy_all
    @user.comments.destroy_all
    @user.form_inquiries.destroy_all
    @user.chats.destroy_all
    @user.chat_room.destroy
    @user.histories.destroy_all
    @user.likes.destroy_all
    @user.saved_recipes.destroy_all
    @user.active_relationships.destroy_all
    @user.passive_relationships.destroy_all
    reset_session
    flash[:notice] = "ご利用いただき、ありがとうございました。"
    redirect_to root_path
  end

  def follows
    @user = User.find(params[:id]) #page_user_idと同じuserのidを取得
    @followings = @user.followings
    @followers = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :profile_image, :is_paid, :is_deleted, :introduction)
  end

  def prohibit_guest_quit
    @user = User.find(params[:id])
    if @user.email == 'guest@example.com'
      redirect_to root_path, alert: "恐れ入りますが、ゲストユーザーは退会できません。"
    end
  end

  def deny_quitted_user
    user = User.find(params[:id])
    if user.is_deleted == true
      render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
    end
  end

end
