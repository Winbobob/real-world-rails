require 'rails_helper'

describe 'Locations' do
  describe "displays a sortable list of locations" do #without user sign-in
    before do
      @my_location = create(:location)
    end

    it "with a location name, address, city, state and zip" 


    it "with the most recent event date" 

  end

  it "creates a new location" 


  context "as a region leader" do
    let(:location) { create(:location) }
    let(:region_leader) { create(:user) }

    before do
      location.region.region_leaderships.create(user: region_leader)

      sign_in_as(region_leader)
    end

    it "can edit additional fields" 


    it "can archive a location that is no longer available", js: true do
      visit edit_location_path(location)
      click_button "Archive Location"

      expect(page).to have_content "Location was successfully archived."
    end
  end

  it "does not create a new location if user is not signed in" 


  it "does not allow location editing if user is not signed in" 


  describe 'the location show page' do
    let(:event) { create(:event) }
    let(:session_location) { create(:location) }
    let!(:event_session) { create(:event_session, event: event, location: session_location) }

    it 'shows events for which the location was used as a session location' 

  end
end

