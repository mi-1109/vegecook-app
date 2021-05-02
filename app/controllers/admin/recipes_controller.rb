class Admin::RecipesController < ApplicationController
  def index
    @recipes = PostRecipe.page(params[:page])
    @recipe_count = PostRecipe.count
  end

  def show
  end
end
