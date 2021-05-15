class SavedRecipe < ApplicationRecord
  belongs_to :post_recipe
  belongs_to :user
end
