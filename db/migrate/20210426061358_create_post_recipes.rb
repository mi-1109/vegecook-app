class CreatePostRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_recipes do |t|
      t.integer :user_id
      t.string :title
      t.text :introduction
      t.string :recipe_image_id
      t.boolean :is_draft
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
