require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "relationships" do
    it { should have_many :followers }
    it { should have_many :followees }
  end

  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :phone }
    it { should validate_presence_of :email }
  end
end
