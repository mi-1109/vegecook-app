class PostRecipe < ApplicationRecord
  belongs_to :user
  has_many :histories, dependent: :destroy
  has_many :saved_recipes, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :procedures, reject_if: :all_blank, allow_destroy: true, reject_if: :procedure_blank
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true, reject_if: :ingredient_blank

  def ingredient_blank(attributes)
    exists = attributes[:id].present?
    empty = attributes[:name].blank?
    attributes.merge!(_destroy:1)if exists && empty
    !exists && empty
  end

  def procedure_blank(attributes)
    exists = attributes[:id].present?
    empty = attributes[:body].blank?
    attributes.merge!(_destroy:1)if exists && empty
    !exists && empty
  end

  attachment :recipe_image
  validates :title, length: {maximum: 25}
  validates :introduction, length: {maximum: 50}

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def saved_by?(user)
    saved_recipes.where(user_id: user.id).exists?
  end

  def browsing_history(current_user)
    new_history = self.histories.new
    new_history.user_id = current_user.id
    if current_user.histories.exists?(post_recipe_id: self.id)
      visited_history = current_user.histories.find_by(post_recipe_id: self.id)
      visited_history.destroy
    end
    new_history.save

    histories_stock_limit = 20
    histories = current_user.histories.all
    if histories.count > histories_stock_limit
      histories[0].destroy
    end
  end

  def self.create_recipe_ranks
    PostRecipe.find(Like.group(:post_recipe_id).order('count(post_recipe_id) desc').limit(20).pluck(:post_recipe_id))
  end

end
