class ChangeColumnDefaultOfHistory < ActiveRecord::Migration[5.2]
  def change
    change_column_null :histories, :post_recipe_id, false
    change_column_null :histories, :user_id, false
  end
end
