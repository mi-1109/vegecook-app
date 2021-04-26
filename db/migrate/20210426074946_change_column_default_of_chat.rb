class ChangeColumnDefaultOfChat < ActiveRecord::Migration[5.2]
  def change
    change_column_null :chats, :user_id, false
    change_column_null :chats, :chat_room_id, false
    change_column_null :chats, :message, false
  end
end
