Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get "/courses", to:"courses#index"
      get "/events", to: "events#index"
      get "/event/:id", to: "events#show"
      post "/event", to: "events#create"
      delete "/event/:id", to: "events#destroy"
      get "/players", to: "players#index"
      patch "/player-event", to: "player_events#update"
      get "/players/:player_id/events", to: "events#index"
      post "/friendship", to: "friendships#create"
      delete "/friendship", to: "friendships#destroy"
    end
  end
end
