class Admin::ChatsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @chats = Chat.all.includes(:user).group(:user_id).order(created_at: "DESC").page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    user_chat_room = @user.chat_room
    chat_room = nil
    if user_chat_room.nil?
      chat_room = ChatRoom.create(user_id: @user.id)
    else
      chat_room = user_chat_room
    end
    @chats = chat_room.chats.includes(:user)
    @chat = Chat.new(chat_room_id: chat_room.id)
  end

  def create
    @chat = current_admin.chats.create(chat_params)
    @chats = @chat.chat_room.chats
    @user = @chat.chat_room.user
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :chat_room_id)
  end
end
