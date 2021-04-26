class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :post_recipe_id
      t.integer :user_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
