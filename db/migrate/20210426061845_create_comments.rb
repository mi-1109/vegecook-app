class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :post_recipe_id
      t.integer :user_id
      t.text :comment
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
