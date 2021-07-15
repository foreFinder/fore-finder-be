class Event < ApplicationRecord
  belongs_to :course
  belongs_to :host, class_name: "Player", foreign_key: :host_id
  has_many :player_events
  has_many :players, through: :player_events

  validates :course_id, presence: true
  validates :date, presence: true
  validates :tee_time, presence: true
  validates :open_spots, presence: true
  validates :number_of_holes, presence: true
  validates :host_id, presence: true
  validates_inclusion_of :private, in: [true, false]

  def players_accepting_invitation
    list = [host.id]
    accepted_players = player_events.where(invite_status: :accepted)
    accepted_players.map do |accepted_players|
      list << accepted_players.player_id
    end
    list
  end

  def players_declining_invitation
    players = player_events.where(invite_status: :declined)
    players.map do |player|
      player.player_id
    end
  end

  def players_pending_invitation
    players = player_events.where(invite_status: :pending)
    players.map do |player|
      player.player_id
    end
  end

  def calculate_remaining_spots
    open_spots - (players_accepting_invitation.length)
  end

  def host_name
    host.name
  end
end
