class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    @user = User.find(params[:page_user_id])
    @followings = @user.followings
    @followers = @user.followers
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    @user = User.find(params[:page_user_id])
    @followings = @user.followings
    @followers = @user.followers
  end
end
