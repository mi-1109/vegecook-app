class Public::RankingsController < ApplicationController
  def index
    @recipe_ranks = PostRecipe.includes(:user).create_recipe_ranks
  end
end
