require 'rails_helper'

RSpec.describe 'Create Event API Endpoint' do
  describe 'happy path' do
    xit 'can create a new event' do
      player_1 = Player.create!(id: 1, name: 'player 1', phone: "999.999.1234", email: "test1@test.com")
      player_2 = Player.create!(id: 2, name: 'player 2', phone: "999.999.1235", email: "test2@test.com")
      player_3 = Player.create!(id: 3, name: 'player 3', phone: "999.999.1236", email: "test3@test.com")
      course_1 = Course.create!(id: 1, name: 'Green Valley Ranch Golf Club', street: '4900 Himalaya Road', city: 'Denver', state: 'Colorado', zip_code: '80249', phone: '303.371.3131', cost: 80)

      event_params = {
        course_id: course_1.id,
        date: "08/01/2021",
        tee_time: "14:20",
        open_spots: "2",
        number_of_holes: "9",
        private: true,
        host_id: player_1.id,
        invitees: [ 2 , 3 ]
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/event', headers: headers, params:JSON.generate(event_params)

      event_data = JSON.parse(response.body, symbolize_names: true)

      created_event = Event.last

      expect(created_event.host_id).to eq(player_1.id)

      expect(response).to be_successful
      expect(event_data).to be_a(Hash)
      expect(event_data).to have_key(:data)
      expect(event_data[:data]).to be_a(Hash)

      expect(event_data[:data]).to have_key(:type)
      expect(event_data[:data][:type]).to be_a(String)

      expect(event_data[:data]).to have_key(:id)
      expect(event_data[:data][:id]).to be_a(String)

      expect(event_data[:data]).to have_key(:attributes)
      expect(event_data[:data][:attributes]).to be_a(Hash)

      expect(event_data[:data][:attributes]).to have_key(:course_id)
      expect(event_data[:data][:attributes][:course_id]).to be_a(Integer)

      expect(event_data[:data][:attributes]).to have_key(:date)
      expect(event_data[:data][:attributes][:date]).to be_a(String)

      expect(event_data[:data][:attributes]).to have_key(:tee_time)
      expect(event_data[:data][:attributes][:tee_time]).to be_a(String)

      expect(event_data[:data][:attributes]).to have_key(:open_spots)
      expect(event_data[:data][:attributes][:open_spots]).to be_a(Integer)

      expect(event_data[:data][:attributes]).to have_key(:number_of_holes)
      expect(event_data[:data][:attributes][:number_of_holes]).to be_a(String)

      expect(event_data[:data][:attributes]).to have_key(:private)
      expect(event_data[:data][:attributes][:private]).to be_a(Boolean)

      expect(event_data[:data][:attributes]).to have_key(:host_id)
      expect(event_data[:data][:attributes][:host_id]).to be_a(Integer)

      expect(event_data[:data][:attributes]).to have_key(:invitees)
      expect(event_data[:data][:attributes][:invitees]).to be_a(Array)
    end
  end

  describe "sad path" do
    xit 'returns an error if missing a parameter' do
      player_1 = Player.create!(id: 1, name: 'player 1', phone: "999.999.1234", email: "test1@test.com")
      player_2 = Player.create!(id: 2, name: 'player 2', phone: "999.999.1235", email: "test2@test.com")
      player_3 = Player.create!(id: 3, name: 'player 3', phone: "999.999.1236", email: "test3@test.com")
      course_1 = Course.create!(id: 1, name: 'Green Valley Ranch Golf Club', street: '4900 Himalaya Road', city: 'Denver', state: 'Colorado', zip_code: '80249', phone: '303.371.3131', cost: 80)

      event_params = {
        course_id: course_1.id,
        date: "08/01/2021",
        tee_time: "14:20",
        open_spots: "2",
        private: true,
        host_id: player_1.id,
        invitees: [ 2 , 3 ]
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v1/event', headers: headers, params:JSON.generate(event_params)

      event_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to eq(400)
      expect(event_data).to have_key(:errors)
      expect(event_data[:errors][0][:detail]).to be_a(String)
    end
  end
end
