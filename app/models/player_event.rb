class PlayerEvent < ApplicationRecord
  belongs_to :event
  belongs_to :player

  enum invite_status: {
    pending: 0,
    accepted: 1,
    declined: 2,
    closed: 3
  }

  def self.close_invitations(invite)
    event = Event.find(invite[:event_id])
    invitations = all.where(event_id: event)
    if event.calculate_remaining_spots == 0
      invitations.map do |invite|
        if invite.invite_status == "pending"
          invite.invite_status = "closed"
        end
      end
    end
  end
end
