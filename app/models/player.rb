class Player < ApplicationRecord
  has_many :followed_players, foreign_key: :follower_id, class_name: "Friendship"
  has_many :followees, through: :followed_players
  has_many :following_players, foreign_key: :followee_id, class_name: "Friendship"
  has_many :followers, through: :following_players
end
