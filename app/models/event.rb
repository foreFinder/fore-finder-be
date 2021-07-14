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

  def invitees
    players.map do |player|
      player.id
    end
  end

  def players_accepting_invitation
    players = player_events.where("invite_accepted = ?", true)
    players.map do |player|
      player.player_id
    end
  end

  def calculate_open_spots
    # open_spots - players
  end
end
