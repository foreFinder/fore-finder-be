Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get "/courses", to:"courses#index"
      get "/events", to: "events#index"
      post "/event", to: "events#create"
      get "/players", to: "players#index"
    end
  end
end
