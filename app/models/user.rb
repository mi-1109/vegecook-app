class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_recipes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :form_inquiries, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_one :chat_room, dependent: :destroy

  has_many :histories, dependent: :destroy
  has_many :browsed_posts, through: :histories, source: :post_recipe

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post_recipe

  has_many :saved_recipes, dependent: :destroy
  has_many :saved_posts, through: :saved_recipes, source: :post_recipe

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :followers, through: :passive_relationships, source: :following

  validates :introduction, length: {maximum: 40}
  with_options presence: true do
    validates :name
    validates :veg_type
    validates :email
    validates :introduction
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  attachment :profile_image

  # ======= 会員ステータスが有効の場合TRUEを返す =======
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  enum veg_type: {
    ペスコ・ベジタリアン: 0,
    ラクト・オボ・ベジタリアン: 1,
    ラクト・ベジタリアン:2,
    オボ・ベジタリアン:3,
    ヴィーガン:4
  }

  def is_paid_to_sring
    if is_paid == true
      "プレミアム（有料）"
    elsif is_paid == false
      "スタンダード（無料）"
    end
  end

  def is_deleted_to_sring
    if is_deleted == true
      "退会済"
    elsif is_deleted == false
      "有効"
    end
  end
end
