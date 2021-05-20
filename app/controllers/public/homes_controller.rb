class Public::HomesController < ApplicationController
  def top
    @heading_recipes = PostRecipe.where(is_draft: false).sample(3)
    @random_recipes = PostRecipe.includes(:user).where(is_draft: false).sample(9)
    @latest_recipes = PostRecipe.where(is_draft: false).order(created_at: "DESC").limit(12)
  end

  def about
  end

  def premium
  end
end
