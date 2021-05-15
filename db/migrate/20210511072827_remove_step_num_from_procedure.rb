class RemoveStepNumFromProcedure < ActiveRecord::Migration[5.2]
  def change
    remove_column :procedures, :step_num, :integer
  end
end
