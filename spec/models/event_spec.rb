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
end
