class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  belongs_to :chat
end
