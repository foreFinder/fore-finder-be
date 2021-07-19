class Player < ApplicationRecord
  has_many :followed_players, foreign_key: :follower_id, class_name: "Friendship"
  has_many :followees, through: :followed_players
  has_many :following_players, foreign_key: :followee_id, class_name: "Friendship"
  has_many :followers, through: :following_players
  has_many :player_events, dependent: :destroy
  has_many :events, through: :player_events

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true

  def friends_list
    followees.map do |followee|
      followee.id
    end
  end

  def events_list
    events = player_events.where(invite_status: :accepted)
    events.map do |event|
      event.event_id
    end
  end
end
