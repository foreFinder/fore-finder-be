require 'rails_helper'

RSpec.describe "Create a new player" do
  describe "happy path" do
    it "can create a new player" do
      player_params = ({
          "name": "first last",
          "phone": "999.867.5309",
          "email": "test@example.com",
          "password": "testpassword",
          "password_confirmation": "testpassword"
        })
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/players', headers: headers, params: JSON.generate(player: player_params)

      new_player_data = JSON.parse(response.body, symbolize_names: true)

      created_player = Player.last

      expect(created_user.email).to eq(user_params[:email])

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(registered_user_data).to be_a(Hash)
      expect(registered_user_data).to have_key(:data)
      expect(registered_user_data[:data]).to be_a(Hash)

      expect(registered_user_data[:data]).to have_key(:type)
      expect(registered_user_data[:data][:type]).to be_a(String)

      expect(registered_user_data[:data]).to have_key(:id)
      expect(registered_user_data[:data][:id]).to be_a(String)

      expect(registered_user_data[:data]).to have_key(:attributes)
      expect(registered_user_data[:data][:attributes]).to be_a(Hash)

      expect(registered_user_data[:data][:attributes]).to have_key(:name)
      expect(registered_user_data[:data][:attributes][:name]).to be_a(String)

      expect(registered_user_data[:data][:attributes]).to have_key(:phone)
      expect(registered_user_data[:data][:attributes][:phone]).to be_a(String)

      expect(registered_user_data[:data][:attributes]).to have_key(:email)
      expect(registered_user_data[:data][:attributes][:email]).to be_a(String)

      expect(registered_user_data[:data][:attributes]).to have_key(:username)
      expect(registered_user_data[:data][:attributes][:username]).to be_a(String)

      expect(registered_user_data[:data][:attributes]).to_not have_key(:password)
    end
  end
end
