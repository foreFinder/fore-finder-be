class Api::V1::SessionsController < ApplicationController
  def create
    user = Player.find_by_email!(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: PlayersSerializer.new(user), status: 200
    end
  end
end
