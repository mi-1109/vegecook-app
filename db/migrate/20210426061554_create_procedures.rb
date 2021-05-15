class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.integer :post_recipe_id
      t.text :body
      t.integer :step_num
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
