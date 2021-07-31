require 'rails_helper'

RSpec.describe CourseService do
  describe "courses" do
    it "returns a list of course information", :vcr do
      response = CourseService.get_all_courses

      expect(response).to be_a(Array)
      expect(response[0]).to be_a(Hash)
      expect(response[0]).to have_key(:ClubID)
      expect(response[0][:ClubID]).to be_a(Integer)

      expect(response[0]).to have_key(:ClubName)
      expect(response[0][:ClubName]).to be_a(String)

      expect(response[0]).to have_key(:ClubAddress)
      expect(response[0][:ClubAddress]).to be_a(String)

      expect(response[0]).to have_key(:ClubCity)
      expect(response[0][:ClubCity]).to be_a(String)

      expect(response[0]).to have_key(:ClubPostalCode)
      expect(response[0][:ClubPostalCode]).to be_a(String)

      expect(response[0]).to have_key(:ClubPhone)
      expect(response[0][:ClubPhone]).to be_a(String)

      expect(response[0]).to have_key(:ClubWeb)
      expect(response[0][:ClubWeb]).to be_a(String)

      expect(response[0]).to have_key(:IsActive)
      expect(response[0][:IsActive]).to be_in([true, false])

      expect(response[0]).to have_key(:Country)
      expect(response[0][:Country]).to be_a(Hash)

      expect(response[0][:Province]).to have_key(:StateProvAbrev)
      expect(response[0][:Province][:StateProvAbrev]).to be_a(String)
    end
  end
end
