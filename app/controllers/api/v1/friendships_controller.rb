class Api::V1::FriendshipsController < ApplicationController
  def create
    follower = Player.find(params[:follower_id])
    followee = Player.find(params[:followee_id])
    friendship = Friendship.find_or_create_by!(follower_id: follower.id, followee_id: followee.id)
    render json: FriendshipSerializer.new(friendship)
  end
end
