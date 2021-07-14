class EventSerializer
  include FastJsonapi::ObjectSerializer

  attributes :course_id, :date, :tee_time, :open_spots, :number_of_holes, :private, :host_id, :invitees
  attribute :players, &:players_accepting_invitation
end
