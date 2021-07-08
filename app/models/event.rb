class Event < ApplicationRecord
  belongs_to :course
  has_many :player_events
  has_many :players, through: :player_events

  validates :course_id, presence: true
  validates :date, presence: true
  validates :tee_time, presence: true
  validates :open_spots, presence: true
  validates :number_of_holes, presence: true
  validates :player_id, presence: true
  validates :private, presence: true
end
