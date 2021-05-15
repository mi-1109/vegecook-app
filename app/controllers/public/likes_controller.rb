class Public::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_recipe =PostRecipe.find(params[:post_recipe_id])
    like = current_user.likes.new(post_recipe_id: @post_recipe.id)
    like.save
  end

  def destroy
    @post_recipe =PostRecipe.find(params[:post_recipe_id])
    like = current_user.likes.find_by(post_recipe_id: @post_recipe.id)
    like.destroy
  end
end
