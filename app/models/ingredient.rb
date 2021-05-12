class Ingredient < ApplicationRecord
  belongs_to :post_recipe, optional: true
  validates :name, presence: true
  validates :amount, presence: true
end
