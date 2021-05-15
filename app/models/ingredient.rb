class Ingredient < ApplicationRecord
  belongs_to :post_recipe, optional: true

  with_options presence: true, on: :publicize do
    validates :name
    validates :amount
  end

end
