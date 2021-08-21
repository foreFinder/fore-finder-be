class Api::V1::PlayersController < ApplicationController
  def index
    players = Player.all
    render json: PlayersSerializer.new(players)
  end

  def create
    player = Player.new(player_params)
    if player.save
      render json:PlayersSerializer.new(player), status: 201
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :phone, :email, :username, :password, :password_confirmation)
  end
end
