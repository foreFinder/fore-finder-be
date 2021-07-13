class Api::V1::PlayersController < ApplicationController
  def index
    players = Player.all
    render json: PlayersSerializer.new(players)
  end
end
