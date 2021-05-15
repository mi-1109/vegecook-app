class ChangeColumnDefaultOfPostRecipe < ActiveRecord::Migration[5.2]
  def change
    change_column_default :post_recipes, :is_draft, false

    change_column_null :post_recipes, :user_id, false
    change_column_null :post_recipes, :title, false
    change_column_null :post_recipes, :introduction, false
    change_column_null :post_recipes, :recipe_image_id, false
    change_column_null :post_recipes, :is_draft, false
  end
end
