class Public::RankingsController < ApplicationController

  def index
     @recipe_ranks = PostRecipe.create_recipe_ranks
  end
end
