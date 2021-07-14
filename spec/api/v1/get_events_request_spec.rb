require 'rails_helper'

RSpec.describe "Get All Events Endpoint" do
  describe "happy path" do
    it 'returns all events with updated players and spots available' do
      player_1 = Player.create!(id: 1, name: 'Eric Rabun', phone: "999.999.1234", email: "test1@test.com")
      player_2 = Player.create!(id: 2, name: 'Tyson McNutt', phone: "999.999.1235" , email: "test2@test.com")
      player_3 = Player.create!(id: 3, name: 'Jon Schlandt', phone: "999.999.1236", email: "test3@test.com")
      player_4 = Player.create!(id: 4, name: 'Chris Anderson', phone: "999.999.1237", email: "test4@test.com")
      player_5 = Player.create!(id: 5, name: 'Jahara Clark', phone: "999.999.1238" , email: "test5@test.com")
      player_6 = Player.create!(id: 6, name: "Keegan O'Shea", phone: "999.999.1239" , email: "test6@test.com")

      course_1 = Course.create!(id: 1, name: 'Green Valley Ranch Golf Club', street: '4900 Himalaya Road', city: 'Denver', state: 'Colorado', zip_code: '80249', phone: '303.371.3131', cost: 80)
      course_2 = Course.create!(id: 2, name: 'City Park Golf Course', street: '3181 E. 23rd Avenue', city: 'Denver', state: 'Colorado', zip_code: '80205', phone: '720.865.3410', cost: 65)
      course_3 = Course.create!(id: 3, name: 'Riverdale Golf Club', street: '13300 Riverdale Road', city: 'Brighton', state: 'Colorado', zip_code: '80602', phone: '303.659.4700', cost: 74)

      event_1 = Event.create!(id: 1, course_id: 1, date: '08/01/2021', tee_time: '13:20', open_spots: '1', number_of_holes: "9", host_id: 1, private: true )
      event_2 = Event.create!(id: 2, course_id: 2, date: '08/05/2021', tee_time: '14:20', open_spots: '2', number_of_holes: "18", host_id: 2, private: true )
      event_3 = Event.create!(id: 3, course_id: 3, date: '08/10/2021', tee_time: '15:20', open_spots: '3', number_of_holes: "9", host_id: 3, private: false )

      # event 1 has 1 spot open
      PlayerEvent.create!(player_id: 2, event_id: 1, invite_accepted: nil)
      PlayerEvent.create!(player_id: 3, event_id: 1, invite_accepted: true)
      PlayerEvent.create!(player_id: 4, event_id: 1, invite_accepted: false)
      # event 2 has 2 spots open
      PlayerEvent.create!(player_id: 1, event_id: 2, invite_accepted: true)
      PlayerEvent.create!(player_id: 3, event_id: 2, invite_accepted: nil)
      PlayerEvent.create!(player_id: 6, event_id: 2, invite_accepted: nil)
      #event 3 has 3 spots open
      PlayerEvent.create!(player_id: 4, event_id: 3, invite_accepted: true)
      PlayerEvent.create!(player_id: 4, event_id: 3, invite_accepted: false)

      get '/api/v1/events'

      expect(response).to be_successful

      all_events = JSON.parse(response.body, symbolize_names: true)

      expect(all_events).to be_a(Hash)
      all_events[:data].each do |event|
        expect(event).to be_a(Hash)
        expect(event).to have_key(:data)
        expect(event[:data]).to be_a(Hash)

        expect(event[:data]).to have_key(:type)
        expect(event[:data][:type]).to be_a(String)

        expect(event[:data]).to have_key(:id)
        expect(event[:data][:id]).to be_a(String)

        expect(event[:data]).to have_key(:attributes)
        expect(event[:data][:attributes]).to be_a(Hash)

        expect(event[:data][:attributes]).to have_key(:course_id)
        expect(event[:data][:attributes][:course_id]).to be_a(Integer)

        expect(event[:data][:attributes]).to have_key(:date)
        expect(event[:data][:attributes][:date]).to be_a(String)

        expect(event[:data][:attributes]).to have_key(:tee_time)
        expect(event[:data][:attributes][:tee_time]).to be_a(String)

        expect(event[:data][:attributes]).to have_key(:open_spots)
        expect(event[:data][:attributes][:open_spots]).to be_a(Integer)

        expect(event[:data][:attributes]).to have_key(:number_of_holes)
        expect(event[:data][:attributes][:number_of_holes]).to be_a(String)

        expect(event[:data][:attributes]).to have_key(:private)
        expect(event[:data][:attributes][:private]).to be_in([true, false])

        expect(event[:data][:attributes]).to have_key(:host_id)
        expect(event[:data][:attributes][:host_id]).to be_a(Integer)

        expect(event[:data][:attributes]).to have_key(:invitees)
        expect(event[:data][:attributes][:invitees]).to be_a(Array)
      end
    end
  end

  describe "sad path" do
  end
end
