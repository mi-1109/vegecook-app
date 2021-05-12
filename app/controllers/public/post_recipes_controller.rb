class Public::PostRecipesController < ApplicationController

  def index
    @latest_recipes = PostRecipe.all.order(created_at: "DESC").page(params[:page]).per(15)
  end

  def new
    @post_recipe = PostRecipe.new
    for i in 1..3 do
      @post_recipe.ingredients.build
    end
    for i in 1..3 do
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
      flash[:alert] = "投稿できませんでした。お手数ですが、再度お試しください。"
      render :edit
    end
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
    @comment = Comment.new
    @post_recipe.browsing_history(current_user)
  end

  def edit
    @post_recipe = PostRecipe.find(params[:id])
  end

  def update
    @post_recipe = PostRecipe.find(params[:id])
    @post_recipe.procedures.destroy_all
    @post_recipe.ingredients.destroy_all
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
      :veg_type,
      procedures_attributes: [:body, :_destroy],
      ingredients_attributes: [:name, :amount, :_destroy]
    )
  end
end
