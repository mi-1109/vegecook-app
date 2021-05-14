class ChangeColumnToAllowNullOnIngredient < ActiveRecord::Migration[5.2]
  def up
    change_column :ingredients, :name, :string, null: true
    change_column :ingredients, :amount, :string, null: true
  end

  def down
    change_column :ingredients, :name, :string, null: false
    change_column :ingredients, :amount, :string, null: false
  end
end
