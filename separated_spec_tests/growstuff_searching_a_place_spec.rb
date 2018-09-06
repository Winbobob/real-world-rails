require "rails_helper"

feature "User searches" do
  let(:member) { create :member, location: "Philippines" }
  let!(:maize) { create :maize }
  let(:garden) { create :garden, owner: member }
  let!(:seed1) { create :seed, owner: member }
  let!(:planting) { create :planting, garden: garden, owner: member, planted_at: Date.parse("2013-3-10") }

  scenario "with a valid place" do
    visit places_path
    search_with "Philippines"
    expect(page).to have_content "community near Philippines"
    expect(page).to have_button "search_button"
    expect(page).to have_content "Nearby members"
    expect(page).not_to have_content "No results found"
  end

  scenario "with a blank search string" do
    visit places_path
    search_with ""
    expect(page).to have_content "Please enter a valid location"
    expect(page).to have_button "search_button"
  end

  describe "Nearby plantings, seed, and members" do
    before do
      login_as member
      visit places_path
      search_with "Philippines"
    end

    it "should show that there are nearby seeds, plantings, and members" 


    it "should go to members' index page" 


    it "should go to plantings' index page" 


    it "should go to seeds' index page" 

  end

  private

  def search_with(search_string)
    fill_in "new_place", with: search_string
    click_button "search_button"
  end
end
