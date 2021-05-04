class RemoveIsAdminFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :is_admin, :boolean
  end
end
