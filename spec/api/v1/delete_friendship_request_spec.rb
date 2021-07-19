require 'rails_helper'

RSpec.describe "Create friendship API Endpoint" do
  describe "happy path" do
    it "deletes a friendship" do
      player_1 = Player.create!(name: 'player 1', phone: "999.999.1234", email: "test1@test.com")
      player_2 = Player.create!(name: 'player 2', phone: "999.999.1235", email: "test2@test.com")
      Friendship.create!(follower_id:player_1.id, followee_id:player_2.id)

      friendship_params = {
        follower_id: player_1.id,
        followee_id: player_2.id
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }
      expect(Friendship.all.count).to eq(1)

      delete '/api/v1/friendship', headers: headers, params:JSON.generate(friendship_params)

      expect(response).to be_successful
      expect(Friendship.all.count).to eq(0)
    end
  end
end
