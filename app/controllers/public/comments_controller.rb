class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post_recipe, only:[:create, :destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_recipe_id = @post_recipe.id
    @comment.save
  end

  def destroy
    Comment.find_by(id: params[:id], post_recipe_id: params[:post_recipe_id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_post_recipe
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
  end
end
