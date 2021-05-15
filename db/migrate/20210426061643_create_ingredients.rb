class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.integer :post_recipe_id
      t.string :name
      t.string :amount
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
