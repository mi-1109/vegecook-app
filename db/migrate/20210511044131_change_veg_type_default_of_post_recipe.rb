class ChangeVegTypeDefaultOfPostRecipe < ActiveRecord::Migration[5.2]
  def change
    change_column_default :post_recipes, :veg_type, 4
    change_column_null :post_recipes, :veg_type, false
  end
end
