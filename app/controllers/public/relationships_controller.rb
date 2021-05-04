class Public::RelationshipsController < ApplicationController

  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    @user = User.find(params[:id])
    @followings = @user.followings
    @followers = @user.followers
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    @user = User.find(params[:id])
    @followings = @user.followings
    @followers = @user.followers
  end
end
