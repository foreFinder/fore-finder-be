class PlayersSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :phone, :email, :username
  attribute :friends, &:friends_list
  attribute :events, &:events_list

end
