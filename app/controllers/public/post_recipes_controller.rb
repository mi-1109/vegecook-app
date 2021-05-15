class Public::PostRecipesController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

  def index
    @latest_recipes = PostRecipe.all.where(is_draft: false).order(created_at: "DESC").page(params[:page]).per(15)
  end

  def new
    @post_recipe = PostRecipe.new
    @post_recipe.new_form_instance
  end

  def create
    @post_recipe = PostRecipe.new(post_recipe_params)
    # 投稿ボタンを押下した場合
    if params[:post]
      if @post_recipe.save(context: :publicize)
        redirect_to post_recipe_path(@post_recipe), notice: "レシピを投稿しました！"
      else
        @post_recipe.new_form_instance
        logger.debug(@post_recipe.errors.messages)
        render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # 下書きボタンを押下した場合
    else
      if @post_recipe.update(is_draft: true)
        redirect_to user_path(current_user), notice: "レシピを下書き保存しました！"
      else
        @post_recipe.new_form_instance
        render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end

  def show
    @post_recipe = PostRecipe.find(params[:id])
    @comment = Comment.new
    if user_signed_in?
      @post_recipe.browsing_history(current_user)
    end
  end

  def edit
    @post_recipe = PostRecipe.find(params[:id])
    @post_recipe.new_form_instance
  end

  def update
    @post_recipe = PostRecipe.find(params[:id])
    @post_recipe.procedures.destroy_all
    @post_recipe.ingredients.destroy_all

    # 下書きレシピを公開するボタンの場合
    if params[:publicize_draft]
      @post_recipe.attributes = post_recipe_params.merge(is_draft: false)
      if @post_recipe.save(context: :publicize)
        redirect_to post_recipe_path(@post_recipe.id), notice: "下書きのレシピを公開しました！"
      else
        @post_recipe.new_form_instance
        @post_recipe.is_draft = true
        render :edit, alert: "レシピを公開できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # 公開済みレシピの場合
    elsif params[:update_post]
      @post_recipe.attributes = post_recipe_params
      if @post_recipe.save(context: :publicize)
        redirect_to post_recipe_path(@post_recipe.id), notice: "レシピを更新しました！"
      else
        @post_recipe.new_form_instance
        render :edit, alert: "レシピを更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # 下書きの更新の場合
    else
      if @post_recipe.update(post_recipe_params)
        redirect_to post_recipe_path(@post_recipe.id), notice: "下書きレシピを更新しました！"
      else
        @post_recipe.new_form_instance
        render :edit, alert: "更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end

  def destroy
    @post_recipe = PostRecipe.find(params[:id])
    if @post_recipe.destroy
      redirect_to user_path(current_user), notice:"レシピを削除しました"
    else
      render :edit, alert: "削除できませんでした。お手数ですが、再度お試しください"
    end
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
