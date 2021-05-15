class ChangeColumnDefaultOfComment < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comments, :post_recipe_id, false
    change_column_null :comments, :user_id, false
    change_column_null :comments, :comment, false
  end
end
