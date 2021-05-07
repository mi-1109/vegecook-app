class Admin::ChatsController < ApplicationController

  def index
    @chats = Chat.all.order(created_at: "DESC").page(params[:page]).per(10)
  end

  def show
  end

end
