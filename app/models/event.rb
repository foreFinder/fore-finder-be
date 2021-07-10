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
  validates :private, inclusion: [true, false]

  def self.invitees
    
  end
end
