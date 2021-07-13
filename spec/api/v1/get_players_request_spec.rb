require 'rails_helper'

RSpec.describe "Get All Players Endpoint" do
  describe "happy path" do
    player_1 = Player.create!(id: 1, name: 'Eric Rabun', phone: "999.999.1234", email: "test1@test.com")
    player_2 = Player.create!(id: 2, name: 'Tyson McNutt', phone: "999.999.1235" , email: "test2@test.com")
    player_3 = Player.create!(id: 3, name: 'Jon Schlandt', phone: "999.999.1236", email: "test3@test.com")
    Friendship.create!(follower_id: player1.id, followee_id: player2.id)
    Friendship.create!(follower_id: player1.id, followee_id: player3.id)
    Friendship.create!(follower_id: player2.id, followee_id: player1.id)
    event_1 = Event.create!(id: 1, course_id: 1, date: '08/01/2021', tee_time: '13:20', open_spots: '3', number_of_holes: "9", host_id: 1, private: true)
    PlayerEvent.create!(player_id: player2.id, event_id:event_1.id , invite_accepted: true)
    PlayerEvent.create!(player_id: player3.id, event_id:event_1.id , invite_accepted: false)

    get '/api/v1/players'

    expect(response).to be_successful

    all_players = JSON.parse(response.body, symbolize_names: true)
    expect(all_players[:data].first[:attributes][:name]).to eq(player1.name)
    expect(all_players[:data].first[:attributes][:friends]).to eq([player2.id, player3.id])
    expect(all_players[:data].first[:attributes][:events]).to eq([])

    expect(all_players[:data].second[:attributes][:name]).to eq(player2.name)
    expect(all_players[:data].second[:attributes][:friends]).to eq([player1.id])
    expect(all_players[:data].second[:attributes][:events]).to eq([event_1.id])

    expect(all_players).to be_a(Hash)
    all_players[:data].each do |player|
      expect(player).to have_key(:id)
      expect(player[:id]).to be_an(String)

      expect(player).to have_key(:type)
      expect(player[:type]).to be_an(String)

      expect(player).to have_key(:attributes)
      expect(player[:attributes]).to be_an(Hash)

      expect(player[:attributes]).to have_key(:name)
      expect(player[:attributes][:name]).to be_an(String)

      expect(player[:attributes]).to have_key(:friends)
      expect(player[:attributes][:friends]).to be_an(Array)

      expect(player[:attributes]).to have_key(:events)
      expect(player[:attributes][:events]).to be_an(Array)
    end
  end

  describe "sad path" do
  end
end
