class Public::RecipesController < ApplicationController

  def index
  end

  def new
    @post_recipe = PostRecipe.new

    for i in 1..4 do
      @post_recipe.ingredients.build
    end

    for i in 1..6 do
      @post_recipe.procedures.build
    end
  end

  def create
    @recipe = PostRecipe.new(recipe_params)
    if params[:post]
      @recipe.save
      flash[:notice] = "レシピを投稿しました！"
      redirect_to user_path(current_user)
    elsif params[:update]
      @recipe.update(is_draft: true)
      flash[:notice] = "レシピを下書きに保存しました！"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "お手数ですが、再度お試しください。"
      render :edit
    end
  end

  def show
    @recipe = PostRecipe.find(params[:id])
    @user = User.find(params[:id])
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
