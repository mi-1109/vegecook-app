class AddVegTypeToPostRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :post_recipes, :veg_type, :integer
  end
end
