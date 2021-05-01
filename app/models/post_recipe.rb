class PostRecipe < ApplicationRecord
  belongs_to :user
  has_many :histories, dependent: :destroy
  has_many :saved_recipes, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :procedures
  accepts_nested_attributes_for :ingredients

  attachment :recipe_image

  def favorited_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
