class Public::HomesController < ApplicationController

  def top
    heading_recipes = PostRecipe.where(is_draft: false).pluck(:id).sample(3)
    @heading_recipes = PostRecipe.find(heading_recipes)
    random_recipes = PostRecipe.where(is_draft: false).pluck(:id).sample(9)
    @random_recipes = PostRecipe.find(random_recipes)
    @latest_recipes = PostRecipe.where(is_draft: false).order(created_at: "DESC").limit(12)
  end

  def about
  end

  def premium
  end
end
