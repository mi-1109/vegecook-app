class Chat < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :chat_room
  belongs_to :admin, optional: true

  validates :message, presence: true, length: {maximum: 60}
end
