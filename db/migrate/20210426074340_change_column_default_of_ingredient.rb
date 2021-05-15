class ChangeColumnDefaultOfIngredient < ActiveRecord::Migration[5.2]
  def change
    change_column_null :ingredients, :post_recipe_id, false
    change_column_null :ingredients, :name, false
    change_column_null :ingredients, :amount, false
  end
end
