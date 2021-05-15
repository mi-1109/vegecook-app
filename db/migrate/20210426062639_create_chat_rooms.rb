class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.integer :user_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
