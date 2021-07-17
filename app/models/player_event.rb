class PlayerEvent < ApplicationRecord
  belongs_to :event
  belongs_to :player

  enum invite_status: {
    pending: 0,
    accepted: 1,
    declined: 2,
    closed: 3
  }
end
