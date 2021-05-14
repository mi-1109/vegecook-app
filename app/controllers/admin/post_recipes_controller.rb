class Admin::PostRecipesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post_recipes = PostRecipe.page(params[:page])
    @post_recipe_count = PostRecipe.count
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
  end

  def destroy
    @post_recipe = PostRecipe.find(params[:id])
    if @post_recipe.destroy
      redirect_to admin_post_recipes_path, notice: "レシピを削除しました"
    else
      render :show, alert: "レシピを削除できませんでした"
    end
  end

end
