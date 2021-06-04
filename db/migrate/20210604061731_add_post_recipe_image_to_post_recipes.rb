class AddPostRecipeImageToPostRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :post_recipes, :post_recipe_image, :string
  end
end
