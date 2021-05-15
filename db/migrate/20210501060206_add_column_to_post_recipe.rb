class AddColumnToPostRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :post_recipes, :serving, :string
  end
end
