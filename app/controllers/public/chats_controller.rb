class Public::ChatsController < ApplicationController

  def show
    user_chat_room = current_user.chat_room
    chat_room = nil
    if user_chat_room.nil?
      chat_room = ChatRoom.create(user_id: current_user.id)
    else
      chat_room = user_chat_room
    end
    @chats = chat_room.chats
    @chat = Chat.new(chat_room_id: chat_room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
    redirect_to chat_path(current_user.id)
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :chat_room_id)
  end

end
