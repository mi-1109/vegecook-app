class RemoveVegTypeFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :veg_type, :integer
  end
end
