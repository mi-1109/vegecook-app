class ChangeColumnDefaultOfLike < ActiveRecord::Migration[5.2]
  def change
    change_column_null :likes, :post_recipe_id, false
    change_column_null :likes, :user_id, false
  end
end
