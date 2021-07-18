class Api::V1::EventsController < ApplicationController

  def index
    events = Event.all
    if params[:player_id]
      player = Player.find(params[:player_id])
      render json: EventSerializer.new(player.events)
    else
      render json: EventSerializer.new(events)
    end
  end

  def show
    event = Event.find(params[:id])
    render json: EventSerializer.new(event)
  end

  def create
    event = Event.create!(event_params)
    if params[:private] == false && event.save
      invite_list = Player.where.not(id: params[:host_id])
      invite_list.each do |invitee|
        PlayerEvent.create!(player_id: invitee.id, event_id: event.id)
      end
    elsif params[:private] == true && event.save
      params[:invitees].each do |invitee|
        PlayerEvent.create!(player_id: invitee, event_id: event.id)
      end
    end
    PlayerEvent.create!(player_id: params[:host_id], event_id: event.id, invite_status: :accepted)
    render json: EventSerializer.new(event)
  end

  def destroy
    Event.find(params[:id]).destroy
  end

  private

  def event_params
    params.require(:event).permit(:host_id, :course_id, :date, :tee_time, :open_spots, :number_of_holes, :private)
  end
end
