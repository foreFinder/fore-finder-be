class PlayersSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :friends, :events
end
