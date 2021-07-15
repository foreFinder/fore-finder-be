require 'rails_helper'

RSpec.describe "Update Player Event Response (Invitation) Endpoint" do
  describe "happy path" do
    it "should add the players response to an invitation" do
      player_1 = Player.create!(name: 'player 1', phone: "999.999.1234", email: "test1@test.com")
      player_2 = Player.create!(name: 'player 2', phone: "999.999.1235", email: "test2@test.com")
      player_3 = Player.create!(name: 'player 3', phone: "999.999.1236", email: "test3@test.com")
      course_1 = Course.create!(name: 'Green Valley Ranch Golf Club', street: '4900 Himalaya Road', city: 'Denver', state: 'Colorado', zip_code: '80249', phone: '303.371.3131', cost: 80)
      event_1 = Event.create!(course_id: course_1.id, date: '08-01-2021', tee_time: '13:20', open_spots: '1', number_of_holes: "9", host_id: player_2.id, private: true )
      invitation = PlayerEvent.create!(player_id: player_1.id, event_id: event_1.id, invite_status: "pending")

      player_event_params = {
        player_id: player_1.id,
        event_id: event_1.id,
        invite_status: "accepted"
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      expect(invitation.invite_status).to eq("accepted")

      patch '/api/v1/player-event', headers: headers, params:JSON.generate(player_event_params)

      player_event_data = JSON.parse(response.body, symbolize_names: true)

      expect(PlayerEvent.all.count).to eq(1)
      expect(PlayerEvent.last.player_id).to eq(player_1.id)
      expect(PlayerEvent.last.event_id).to eq(event_1.id)

      expect(response).to be_successful
      expect(player_event_data).to be_a(Hash)
      expect(player_event_data).to have_key(:data)
      expect(player_event_data[:data]).to be_a(Hash)

      expect(player_event_data[:data]).to have_key(:type)
      expect(player_event_data[:data][:type]).to be_a(String)

      expect(player_event_data[:data]).to have_key(:id)
      expect(player_event_data[:data][:id]).to be_a(String)

      expect(player_event_data[:data]).to have_key(:attributes)
      expect(player_event_data[:data][:attributes]).to be_a(Hash)

      expect(player_event_data[:data][:attributes]).to have_key(:user_id)
      expect(player_event_data[:data][:attributes][:user_id]).to be_a(Integer)

      expect(player_event_data[:data][:attributes]).to have_key(:event_id)
      expect(player_event_data[:data][:attributes][:event_id]).to be_a(String)
    end
  end

  describe "sad path" do
    it 'returns an error if missing a parameter in the request body' do
      player_1 = Player.create!(name: 'player 1', phone: "999.999.1234", email: "test1@test.com")
      player_2 = Player.create!(name: 'player 2', phone: "999.999.1235", email: "test2@test.com")
      player_3 = Player.create!(name: 'player 3', phone: "999.999.1236", email: "test3@test.com")
      course_1 = Course.create!(name: 'Green Valley Ranch Golf Club', street: '4900 Himalaya Road', city: 'Denver', state: 'Colorado', zip_code: '80249', phone: '303.371.3131', cost: 80)
      event_1 = Event.create!(course_id: course_1.id, date: '08-01-2021', tee_time: '13:20', open_spots: '1', number_of_holes: "9", host_id: player_2.id, private: true )
      invitation = PlayerEvent.create!(player_id: player_1.id, event_id: event_1.id, invite_status: "pending")

      player_event_params = {
        player_id: player_1.id,
        event_id: event_1.id,
        invite_status: "accepted"
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      patch '/api/v1/player-event', headers: headers, params:JSON.generate(player_event_params)

      player_event_data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(event_data).to have_key(:errors)
      expect(event_data[:errors][0][:message]).to be_a(String)
    end
  end
end
