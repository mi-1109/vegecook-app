class Public::SavedRecipesController < ApplicationController

  def create
    @post_recipe =PostRecipe.find(params[:post_recipe_id])
    saved_recipe = current_user.saved_recipes.new(post_recipe_id: @post_recipe.id)
    saved_recipe.save
  end

  def destroy
    @post_recipe =PostRecipe.find(params[:post_recipe_id])
    saved_recipe = current_user.saved_recipes.find_by(post_recipe_id: @post_recipe.id)
    saved_recipe.destroy
  end
end
