class Api::V1::EventsController < ApplicationController

def index
end

  def create
    event = Event.create!(event_params)
    if event.save && params[:invitees]
      params[:invitees].each do |invitee|
        PlayerEvent.create!(player_id: invitee, event_id: event.id)
      end
      render json: EventSerializer.new(event)
    end
  end

  private

  def event_params
    params.require(:event).permit(:host_id, :course_id, :date, :tee_time, :open_spots, :number_of_holes, :private)
  end
end
