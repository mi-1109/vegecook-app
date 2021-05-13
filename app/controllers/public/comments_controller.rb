class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
    if user_signed_in?
      @comment = current_user.comments.new(comment_params)
      @comment.post_recipe_id = @post_recipe.id
      if @comment.save
        flash[:notice] = "コメントを投稿しました！"
      else
        render template: "public/post_recipes/show", alert: "無料会員登録もしくはログインの上、コメントを投稿ください"
      end
    end
  end

  def destroy
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
    Comment.find_by(id: params[:id], post_recipe_id: params[:post_recipe_id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
