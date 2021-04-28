class Public::RecipesController < ApplicationController

  def index
  end

  def new
    @post_recipe = PostRecipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
  end

  private

  def recipe_params
    params.require(:post_recipe).permit(
      :user_id,
      :title,
      :introduction,
      :recipe_image,
      :is_draft,
      procedures_attributes: [:body, :step_num],
      ingredients_attributes: [:name, :amount]
    )
  end
end
