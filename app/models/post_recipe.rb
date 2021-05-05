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

  validates :title, length: {maximum: 25}
  validates :introduction, length: {maximum: 50}

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def saved_by?(user)
    saved_recipes.where(user_id: user.id).exists?
  end

  def self.create_recipe_ranks
    PostRecipe.find(Like.group(:post_recipe_id).order('count(post_recipe_id) desc').limit(20).pluck(:post_recipe_id))
  end
end
