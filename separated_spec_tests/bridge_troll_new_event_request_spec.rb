require 'rails_helper'

describe "New Event", js: true do
  let(:fill_in_good_location_details) do
    find('#location_region_id').find(:xpath, 'option[2]').select_option
    fill_in "Name", with: "UChicago"
    fill_in "Address 1", with: "5801 South Ellis Avenue"
    fill_in "City", with: "Chicago"
    fill_in "State", with: "Illinois"
    fill_in "Zip", with: "60637"
  end

  before do
    create(:course)
    @user_organizer = create(:user, email: "organizer@mail.com", first_name: "Sam", last_name: "Spade")
    @chapter = create(:chapter)

    sign_in_as(@user_organizer)
  end

  it "pre-fills the event details textarea" 


  it "has a public organizer email field" 


  it "has the code of conduct checkbox unchecked" 


  it 'changes the code of conduct URL if the chapter-org has a custom one' 


  it "has appropriate locations available" 


  it "has a food options toggle" 


  it 'allows organizers to specify a whitelist of allowed OSes' 


  it 'allows organizer to choose when to send their announcement email' 


  describe "the location form modal" do
    it "shows errors if a location form is invalid" 


    it "accepts and adds a valid location" 

  end

  describe "autodetecting time zone based on location" do
    let!(:pacific_location) do
      create(
        :location,
        name: "Ferry Building",
        address_1: "Ferry Building",
        city: "San Francisco",
        state: "CA",
        zip: "94111",
        latitude: 37.7955458,
        longitude: -122.3934205
      )
    end
    let!(:eastern_location) do
      create(
        :location,
        name: "Statue of Liberty",
        address_1: "Statue of Liberty",
        city: "New York",
        state: "NY",
        zip: "10004",
        latitude: 40.6892494,
        longitude: -74.0445004
      )
    end

    it 'changes the time zone dropdown when the location is changed' 

  end

  context 'after clicking "Add another session"' do
    before do
      visit_new_events_form_and_expand_all_sections

      click_on 'Add another session'
    end

    it 'has two event session options, of which only the second can be removed' 

  end

  describe 'session location assignment' do
    let!(:event_location) { create(:location) }
    let!(:session_location) { create(:location) }

    it 'can set a different location for certain sessions' 

  end

  context 'submit form' do
    it 'requires code of conduct to be checked, and preserves checked-ness on error' 


    it 'allows a draft to be saved' 

  end
end

