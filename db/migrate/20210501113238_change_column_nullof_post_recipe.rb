class ChangeColumnNullofPostRecipe < ActiveRecord::Migration[5.2]
  def change
    change_column_null :post_recipes, :serving, false
  end
end
