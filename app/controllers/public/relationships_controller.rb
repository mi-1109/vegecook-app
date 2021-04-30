class Public::RelationshipsController < ApplicationController

  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    @following = User.find(params[:user_id])
    @follower = User.find(params[:user_id])
    @user = current_user
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    @following = User.find(params[:user_id])
    @follower = User.find(params[:user_id])
    @user = current_user
  end
end
