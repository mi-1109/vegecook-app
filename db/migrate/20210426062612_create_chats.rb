class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :chat_room_id
      t.integer :user_id
      t.text :message
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
