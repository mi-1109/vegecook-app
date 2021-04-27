class SavedRecipe < ApplicationRecord
  belongs_to :post_recipe_id
  belongs_to :user
end
