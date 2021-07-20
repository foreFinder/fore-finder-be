require 'rails_helper'

RSpec.describe PlayerEvent, type: :model do
  describe "relationships" do
    it { should belong_to :player }
    it { should belong_to :event }
  end

  describe "class methods" do
    describe ":: close_invitations" do
      it "closes pending invitations when spots are full" do
        player_1 = Player.create!(name: 'player 1', phone: "999.999.1234", email: "test1@test.com")
        player_2 = Player.create!(name: 'player 2', phone: "999.999.1235" , email: "test2@test.com")
        player_3 = Player.create!(name: 'player 3', phone: "999.999.1236", email: "test3@test.com")
        player_4 = Player.create!(name: 'player 4', phone: "999.999.1237", email: "test4@test.com")
        player_5 = Player.create!(name: 'player 5', phone: "999.999.1238", email: "test5@test.com")
        Friendship.create!(follower_id: player_1.id, followee_id: player_2.id)
        Friendship.create!(follower_id: player_1.id, followee_id: player_3.id)
        Friendship.create!(follower_id: player_2.id, followee_id: player_1.id)
        course_1 = Course.create!(name: 'Green Valley Ranch Golf Club', street: '4900 Himalaya Road', city: 'Denver', state: 'Colorado', zip_code: '80249', phone: '303.371.3131', cost: 80)
        event_1 = Event.create!(course_id: course_1.id, date: '08/01/2021', tee_time: '13:20', open_spots: '3', number_of_holes: "9", host_id: player_1.id, private: true)
        pe_1 = PlayerEvent.create!(player_id: player_1.id, event_id: event_1.id , invite_status: "accepted")
        pe_2 = PlayerEvent.create!(player_id: player_2.id, event_id: event_1.id , invite_status: "pending")
        pe_3 = PlayerEvent.create!(player_id: player_3.id, event_id: event_1.id , invite_status: "accepted")
        pe_4 = PlayerEvent.create!(player_id: player_4.id, event_id: event_1.id , invite_status: "pending")
        pe_5 = PlayerEvent.create!(player_id: player_5.id, event_id: event_1.id , invite_status: "accepted")

        PlayerEvent.close_invitations(pe_3)
        expect(PlayerEvent.find_by!(player_id: player_3.id, event_id: event_1.id).invite_status).to eq("accepted")
        expect(PlayerEvent.find_by!(player_id: player_2.id, event_id: event_1.id).invite_status).to eq("closed")
        expect(PlayerEvent.find_by!(player_id: player_4.id, event_id: event_1.id).invite_status).to eq("closed")
        expect(PlayerEvent.find_by!(player_id: player_5.id, event_id: event_1.id).invite_status).to eq("accepted")
      end
    end
  end
end
