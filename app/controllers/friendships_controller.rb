class FriendshipsController < ApplicationController

  before_action :require_user

  def index
  end

  def create
    # @parameters = Friendship.create(user_id: current_user, friend_id: friend)
    #user = params[:user]
    #friend = params[:friend]
    friendship = Friendship.check_friendship(params[:user], params[:friend])
    if !friendship
      @friendship = Friendship.create(user_id: params[:user], friend_id: params[:friend])
      redirect_to friendships_path, notice: "New friendship added."
    end
  end

  def destroy
    friend = User.find(params[:id])
    friendship = Friendship.where(user_id: current_user, friend_id: friend.id).first
    friendship.destroy
    redirect_to friendships_path, alert: "Friend eliminated."
  end

end
