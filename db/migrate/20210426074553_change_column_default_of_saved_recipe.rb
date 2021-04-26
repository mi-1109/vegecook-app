class ChangeColumnDefaultOfSavedRecipe < ActiveRecord::Migration[5.2]
  def change
    change_column_null :saved_recipes, :post_recipe_id, false
    change_column_null :saved_recipes, :user_id, false
  end
end
