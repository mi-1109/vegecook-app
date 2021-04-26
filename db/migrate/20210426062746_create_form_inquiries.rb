class CreateFormInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :form_inquiries do |t|
      t.integer :user_id
      t.text :content
      t.integer :response_status
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
