class ChangeColumnDefaultOfFormInquiry < ActiveRecord::Migration[5.2]
  def change
    change_column_default :form_inquiries, :response_status, 0

    change_column_null :form_inquiries, :content, false
    change_column_null :form_inquiries, :user_id, false
    change_column_null :form_inquiries, :response_status, false
  end
end
