class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_recipes, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :saved_recipes, dependent: :destroy
  has_many :form_inquiries, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_one :chat_room, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :followers, through: :passive_relationships, source: :following

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
      "プレミアム(有料)"
    else is_paid == false
      "スタンダード（無料)"
    end
  end

  def is_deleted_to_sring
    if is_deleted == true
      "有効"
    else is_deleted == false
      "退会済"
    end
  end
end
