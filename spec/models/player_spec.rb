require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "relationships" do
    it { should have_many :followers }
    it { should have_many :followees }
  end
end
