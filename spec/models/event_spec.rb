require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "relationships" do
    it { should belong_to :course}
    it { should belong_to(:host).class_name("Player")}
    it { should have_many :player_events}
    it { should have_many(:players).through(:player_events) }
  end

  describe "validations" do
    it { should validate_presence_of :course_id }
    it { should validate_presence_of :date }
    it { should validate_presence_of :tee_time }
    it { should validate_presence_of :open_spots }
    it { should validate_presence_of :number_of_holes }
    it { should validate_presence_of :host_id }
    it { should validate_presence_of :private }
  end

  describe "instance methods" do
    before :each do
      @player_1 = Player.create!(name: 'Eric Rabun', phone: "999.999.1234", email: "test1@test.com")
      @player_2 = Player.create!(name: 'Tyson McNutt', phone: "999.999.1235" , email: "test2@test.com")
      @player_3 = Player.create!(name: 'Jon Schlandt', phone: "999.999.1236", email: "test3@test.com")
      @course_1 = Course.create!(name: 'Green Valley Ranch Golf Club', street: '4900 Himalaya Road', city: 'Denver', state: 'Colorado', zip_code: '80249', phone: '303.371.3131', cost: 80)
      @event_1 = Event.create!(course_id: @course_1.id, date: '08/01/2021', tee_time: '13:20', open_spots: '3', number_of_holes: "9", host_id: @player_1.id, private: true)
      @event_2 = Event.create!(course_id: @course_1.id, date: '09/01/2021', tee_time: '14:20', open_spots: '2', number_of_holes: "18", host_id: @player_2.id, private: true)
      PlayerEvent.create!(player_id: @player_2.id, event_id: @event_1.id , invite_accepted: true)
      PlayerEvent.create!(player_id: @player_2.id, event_id: @event_2.id , invite_accepted: true)
      PlayerEvent.create!(player_id: @player_3.id, event_id: @event_1.id , invite_accepted: false)
    end

    describe "#invitees" do
      it "returns an array of players that have been inviteed to the event" do

        expect(@event_1.invitees).to eq([@player_2.id, @player_3.id])
        expect(@event_2.invitees).to eq([@player_2.id])
      end
    end

    describe "#players_accepting_invitation" do
      it "retruns an array of players that have accepted the event invitation" do

        expect(@event_1.players_accepting_invitation).to eq([@player_2.id])
        expect(@event_2.players_accepting_invitation).to eq([@player_2.id])
      end
    end
  end
end
