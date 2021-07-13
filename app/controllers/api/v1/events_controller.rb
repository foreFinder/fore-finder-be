class Api::V1::EventsController < ApplicationController
  def create
    # create a new event
    # add invitees to player_events table
    event = Event.create!(event_params)
    if event.save && params[:invitees]
      params[:invitees].each do |invitee|
      PlayerEvent.create!(player_id: invitee, event_id: event.id)
    end
    invitees = Event.invitees(params[:invitees])
  end

  private

  def event_params
    params.require(:event).permit(:host_id, :course_id, :date, :tee_time, :open_spots, :number_of_holes, :private)
  end

end

  private

  def event_params
    params.require(:event).permit(:host_id, :course_id, :date, :tee_time, :open_spots, :number_of_holes, :private)
  end
end
