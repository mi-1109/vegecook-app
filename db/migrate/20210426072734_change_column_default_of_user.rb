class ChangeColumnDefaultOfUser < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :is_paid, false
    change_column_default :users, :is_deleted, false
    change_column_default :users, :is_admin, false
    change_column_default :users, :veg_type, 4

    change_column_null :users, :is_paid, false
    change_column_null :users, :is_deleted, false
    change_column_null :users, :is_admin, false
    change_column_null :users, :veg_type, false
    change_column_null :users, :name, false
  end
end
