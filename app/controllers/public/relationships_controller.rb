class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_follow_user

  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
  end

  private

  def set_follow_user
    @user = User.find(params[:page_user_id])
    @followings = @user.followings
    @followers = @user.followers
  end
end
