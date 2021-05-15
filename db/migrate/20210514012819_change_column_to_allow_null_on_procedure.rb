class ChangeColumnToAllowNullOnProcedure < ActiveRecord::Migration[5.2]
  def up
    change_column :procedures, :body, :text, null: true
  end

  def down
    change_column :procedures, :body, :text, null: false
  end
end
