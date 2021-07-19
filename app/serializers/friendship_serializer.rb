class FriendshipSerializer
  include FastJsonapi::ObjectSerializer

  attributes :follower, :followee
end
