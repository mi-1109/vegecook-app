class Admin::PostRecipesController < ApplicationController
  def index
    @post_recipes = PostRecipe.page(params[:page])
    @post_recipe_count = PostRecipe.count
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
  end

  def destroy
    @post_recipe = PostRecipe.find(params[:id])
    @post_recipe.destroy
    redirect_to admin_post_recipes_path
  end
end
