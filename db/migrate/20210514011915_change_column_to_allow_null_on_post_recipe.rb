class ChangeColumnToAllowNullOnPostRecipe < ActiveRecord::Migration[5.2]
  def up
    change_column :post_recipes, :title, :string, null: true
    change_column :post_recipes, :introduction, :text, null: true
    change_column :post_recipes, :recipe_image_id, :string, null: true
    change_column :post_recipes, :serving, :string, null: true
    change_column :post_recipes, :veg_type, :integer, null: true
  end
  
  def down
    change_column :post_recipes, :title, :string, null: false
    change_column :post_recipes, :introduction, :text, null: false
    change_column :post_recipes, :recipe_image_id, :string, null: false
    change_column :post_recipes, :serving, :string, null: false
    change_column :post_recipes, :veg_type, :integer, null: false
  end
end
