class PlayersSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name
  attribute :friends, &:friends_list
  attribute :events, &:events_list

end
