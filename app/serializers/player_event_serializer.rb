class PlayerEventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :player_id, :event_id, :invite_status
end
