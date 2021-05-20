class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post_recipe

  validates :comment, presence: true, length: { maximum: 35 }
end
