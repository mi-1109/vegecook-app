class ChangeColumnDefaultOfChatRoom < ActiveRecord::Migration[5.2]
  def change
    change_column_null :chat_rooms, :user_id, false
  end
end
