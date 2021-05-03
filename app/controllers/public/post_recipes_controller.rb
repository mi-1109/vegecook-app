class Public::PostRecipesController < ApplicationController

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
    @post_recipe = PostRecipe.new(post_recipe_params)
    if params[:post]
      @post_recipe.save
      flash[:notice] = "レシピを投稿しました！"
      redirect_to user_path(current_user)
    elsif params[:update]
      @post_recipe.update(is_draft: true)
      flash[:notice] = "レシピを下書きに保存しました！"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "お手数ですが、再度お試しください。"
      render :edit
    end
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
  end

  def edit
    @post_recipe = PostRecipe.find(params[:id])
  end

  def update
    @post_recipe = PostRecipe.find(params[:id])
    if @post_recipe.update(post_recipe_params)
      redirect_to post_recipe_path(@post_recipe.id), notice: "レシピを更新しました！"
    else
      render action: :edit, notice: "レシピを更新できませんでした。お手数ですが、再度お試しください。"
    end
  end

  def destroy
    @post_recipe = PostRecipe.find(params[:id])
    @post_recipe.destroy
    redirect_to root_path
  end

  private

  def post_recipe_params
    params.require(:post_recipe).permit(
      :user_id,
      :title,
      :introduction,
      :recipe_image,
      :is_draft,
      :serving,
      procedures_attributes: [:body, :step_num, :id],
      ingredients_attributes: [:name, :amount, :id]
    )
  end
end
