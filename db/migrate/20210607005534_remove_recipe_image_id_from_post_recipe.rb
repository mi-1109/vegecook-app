class RemoveRecipeImageIdFromPostRecipe < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_recipes, :recipe_image_id, :string
  end
end
