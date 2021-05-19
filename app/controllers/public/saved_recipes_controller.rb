class Public::SavedRecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post_recipe

  def create
    saved_recipe = current_user.saved_recipes.new(post_recipe_id: @post_recipe.id)
    saved_recipe.save
  end

  def destroy
    saved_recipe = current_user.saved_recipes.find_by(post_recipe_id: @post_recipe.id)
    saved_recipe.destroy
  end


  private

  def set_post_recipe
    @post_recipe =PostRecipe.find(params[:post_recipe_id])
  end
end
