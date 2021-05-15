class PostRecipe < ApplicationRecord
  belongs_to :user
  has_many :histories, dependent: :destroy
  has_many :saved_recipes, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :procedures, allow_destroy: true, reject_if: lambda {|attributes| attributes[:body].blank?}
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: lambda {|attributes| attributes[:name].blank? && attributes[:amount].blank?}

  with_options presence: true, on: :publicize do
    validates :recipe_image
    validates :serving
    validates :veg_type
    validates :title
    validates :introduction
    validates :ingredients
    validates :procedures
  end

  validates :title, length: {maximum: 25}, on: :publicize
  validates :introduction, length: {maximum: 80}, on: :publicize

  attachment :recipe_image

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

  def new_form_instance()
    # 入力済みの材料の数
    ingredient_filled_in_count = self.ingredients.length
    # 入力済みの手順の数
    procedure_filled_in_count = self.procedures.length
    # 3つより少なければ3つになるように空のインスタンスを作成する
    if ingredient_filled_in_count < 3
      # 作成するインスタンスの数
      add_ingredient_form_count = 3 - ingredient_filled_in_count
      for i in 1..add_ingredient_form_count do
        self.ingredients.build
      end
    end
    # 3つより少なければ3つになるように空のインスタンスを作成する
    if procedure_filled_in_count < 3
      # 作成するインスタンスの数
      add_procedure_form_count = 3 - procedure_filled_in_count
      for i in 1..add_procedure_form_count do
        self.procedures.build
      end
    end
  end
end
