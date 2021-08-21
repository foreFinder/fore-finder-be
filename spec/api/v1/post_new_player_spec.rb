require 'rails_helper'

RSpec.describe "Create a new player" do
  describe "happy path" do
    it "can create a new player" do
      player_params = ({
          "name": "first last",
          "phone": "999.867.5309",
          "email": "test@example.com",
          "username": "test1user",
          "password": "testpassword",
          "password_confirmation": "testpassword"
        })
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/players', headers: headers, params: JSON.generate(player: player_params)

      new_player_data = JSON.parse(response.body, symbolize_names: true)

      created_player = Player.last

      expect(created_player.email).to eq(player_params[:email])

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(new_player_data).to be_a(Hash)
      expect(new_player_data).to have_key(:data)
      expect(new_player_data[:data]).to be_a(Hash)

      expect(new_player_data[:data]).to have_key(:type)
      expect(new_player_data[:data][:type]).to be_a(String)

      expect(new_player_data[:data]).to have_key(:id)
      expect(new_player_data[:data][:id]).to be_a(String)

      expect(new_player_data[:data]).to have_key(:attributes)
      expect(new_player_data[:data][:attributes]).to be_a(Hash)

      expect(new_player_data[:data][:attributes]).to have_key(:name)
      expect(new_player_data[:data][:attributes][:name]).to be_a(String)

      expect(new_player_data[:data][:attributes]).to have_key(:phone)
      expect(new_player_data[:data][:attributes][:phone]).to be_a(String)

      expect(new_player_data[:data][:attributes]).to have_key(:email)
      expect(new_player_data[:data][:attributes][:email]).to be_a(String)

      expect(new_player_data[:data][:attributes]).to have_key(:username)
      expect(new_player_data[:data][:attributes][:username]).to be_a(String)

      expect(new_player_data[:data][:attributes]).to_not have_key(:password)
    end
  end
end
