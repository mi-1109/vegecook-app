class Public::CommentsController < ApplicationController

  def create
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_recipe_id = @post_recipe.id
    @comment.save
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
