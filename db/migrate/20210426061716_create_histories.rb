class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :post_recipe_id
      t.integer :user_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
