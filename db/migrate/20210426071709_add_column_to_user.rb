class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_image_id, :string
    add_column :users, :is_paid, :boolean
    add_column :users, :is_deleted, :boolean
    add_column :users, :is_admin, :boolean
    add_column :users, :veg_type, :integer
  end
end
