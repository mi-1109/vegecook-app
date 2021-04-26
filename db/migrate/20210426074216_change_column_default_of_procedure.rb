class ChangeColumnDefaultOfProcedure < ActiveRecord::Migration[5.2]
  def change
    change_column_null :procedures, :post_recipe_id, false
    change_column_null :procedures, :body, false
    change_column_null :procedures, :step_num, false
  end
end
