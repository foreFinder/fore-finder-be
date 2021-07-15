require 'rails_helper'

RSpec.describe "Create Player Event Response (Invitation) Endpoint" do
  describe "happy path" do
    it "should add the players response to an invitation" do
      player_1 = Player.create!(name: 'player 1', phone: "999.999.1234", email: "test1@test.com")
      player_2 = Player.create!(name: 'player 2', phone: "999.999.1235", email: "test2@test.com")
      player_3 = Player.create!(name: 'player 3', phone: "999.999.1236", email: "test3@test.com")
      course_1 = Course.create!(name: 'Green Valley Ranch Golf Club', street: '4900 Himalaya Road', city: 'Denver', state: 'Colorado', zip_code: '80249', phone: '303.371.3131', cost: 80)
      event_1 = Event.create!(course_id: course_1.id, date: '08-01-2021', tee_time: '13:20', open_spots: '1', number_of_holes: "9", host_id: player_2.id, private: true )

      player_event_params = {
        player_id: player_1.id,
        event_id: event_1.id,
        invite_accepted: "accepted"
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/player-event', headers: headers, params:JSON.generate(event_params)

      player_event_data = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
