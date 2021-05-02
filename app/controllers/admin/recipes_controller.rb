class Admin::RecipesController < ApplicationController
  def index
    @recipes = PostRecipe.page(params[:page])
    @recipe_count = PostRecipe.count
  end

  def show
    @recipe = PostRecipe.find(params[:id])
  end
end
