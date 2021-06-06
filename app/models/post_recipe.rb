class PostRecipe < ApplicationRecord
  belongs_to :user
  has_many :histories, dependent: :destroy
  has_many :saved_recipes, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :procedures, allow_destroy: true, reject_if: lambda { |attributes| attributes[:body].blank? }
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: lambda { |attributes| attributes[:name].blank? && attributes[:amount].blank? }

  with_options presence: true, on: :publicize do
    validates :serving
    validates :veg_type
    validates :title
    validates :introduction
    validates :ingredients
    validates :procedures
    validates :post_recipe_image
  end
  validates :title, length: { maximum: 14 }, on: :publicize
  validates :introduction, length: { maximum: 80 }, on: :publicize

  attachment :recipe_image
  mount_uploader :post_recipe_image, PostRecipeUploader

  enum veg_type: {
    pesco: 0,
    lacto_ovo: 1,
    lacto: 2,
    ovo: 3,
    vegan: 4,
  }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def saved_by?(user)
    saved_recipes.where(user_id: user.id).exists?
  end

  def browsing_history(current_user)
    new_history = histories.new
    new_history.user_id = current_user.id
    if current_user.histories.exists?(post_recipe_id: id)
      visited_history = current_user.histories.find_by(post_recipe_id: id)
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

  def new_form_instance()
    # 入力済みの材料・手順入力欄の数をカウント
    ingredient_filled_in_count = ingredients.length
    procedure_filled_in_count = procedures.length
    # 入力欄がゼロになるのを防ぐため、入力済みの材料・手順入力欄が3つより少なければ、3つになるように空のインスタンスを作成する
    if ingredient_filled_in_count < 3
      add_ingredient_form_count = 3 - ingredient_filled_in_count
      for i in 1..add_ingredient_form_count do
        ingredients.build
      end
    end
    if procedure_filled_in_count < 3
      add_procedure_form_count = 3 - procedure_filled_in_count
      for i in 1..add_procedure_form_count do
        procedures.build
      end
    end
  end
end
