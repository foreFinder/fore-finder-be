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
<<<<<<< HEAD
    it { should validate_presence_of :private }
=======
    it { should validate_inclusion_of(:private).in_array([true, false])}
>>>>>>> d8284c62af6076b725c790724222ff3c394a6814
  end
end
