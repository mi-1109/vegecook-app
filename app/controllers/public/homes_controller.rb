class Public::HomesController < ApplicationController

  def top
    @heading_recipes = PostRecipe.order("RANDOM()").limit(3)
    @random_recipes = PostRecipe.order("RANDOM()").limit(9)
    @latest_recipes = PostRecipe.all.order(created_at: "DESC").limit(12)
  end

  def about
  end

  def premium
  end
end
