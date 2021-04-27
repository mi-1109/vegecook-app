class PostRecipe < ApplicationRecord
  belongs_to :user
  has_many :histories, dependent: :destroy
  has_many :saved_recipes, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
