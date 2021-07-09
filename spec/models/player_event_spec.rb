require 'rails_helper'

RSpec.describe PlayerEvent, type: :model do
  describe "relationships" do
    it { should belong_to :player }
    it { should belong_to :event }
  end
end
