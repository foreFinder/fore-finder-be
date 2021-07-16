class Api::V1::PlayerEventsController < ApplicationController
  def update
    invite = PlayerEvent.find_by!(player_id: params[:player_id], event_id: params[:event_id])
    require "pry"; binding.pry
    updated_invite = PlayerEvent.update(invite.id, player_event_params)
    require "pry"; binding.pry
    render json: PlayerEventSerializer.new(updated_invite)
  end
  private

  def player_event_params
    params.require(:player_event).permit(:player_id, :event_id, :invite_status)
  end
end
