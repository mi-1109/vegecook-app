class Public::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post_recipe, only: [:create, :destroy]

  def create
    like = current_user.likes.new(post_recipe_id: @post_recipe.id)
    like.save
  end

  def destroy
    like = current_user.likes.find_by(post_recipe_id: @post_recipe.id)
    like.destroy
  end

  private

  def set_post_recipe
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
  end
end
