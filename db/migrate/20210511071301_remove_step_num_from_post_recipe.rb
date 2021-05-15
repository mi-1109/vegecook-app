class RemoveStepNumFromPostRecipe < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_recipes, :step_num, :integer
  end
end
