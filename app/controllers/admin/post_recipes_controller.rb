class Admin::PostRecipesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_post_recipe, only: [:show, :destroy]

  def index
    @post_recipes = PostRecipe.page(params[:page]).per(16)
    @post_recipe_count = PostRecipe.count
  end

  def show
  end

  def destroy
    if @post_recipe.destroy
      redirect_to admin_post_recipes_path, notice: "レシピを削除しました"
    else
      render :show, alert: "レシピを削除できませんでした"
    end
  end

  private

  def set_post_recipe
    @post_recipe = PostRecipe.find(params[:id])
  end
end
