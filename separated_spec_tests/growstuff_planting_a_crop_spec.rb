require "rails_helper"
require 'custom_matchers'

feature "Planting a crop", :js, :elasticsearch do
  let(:member) { create :member }
  let!(:maize) { create :maize }
  let(:garden) { create :garden, owner: member }
  let!(:planting) do
    create :planting, garden: garden, owner: member, planted_at: Date.parse("2013-3-10")
  end

  background do
    login_as member
    visit new_planting_path
    sync_elasticsearch [maize]
  end

  it_behaves_like "crop suggest", "planting"

  it "has the required fields help text" 


  it "displays required and optional fields properly" 


  scenario "Creating a new planting" do
    fill_autocomplete "crop", with: "mai"
    select_from_autocomplete "maize"
    within "form#new_planting" do
      fill_in "When", with: "2014-06-15"
      fill_in "How many?", with: 42
      select "cutting", from: "Planted from:"
      select "semi-shade", from: "Sun or shade?"
      fill_in "Tell us more about it", with: "It's rad."
      click_button "Save"
    end

    expect(page).to have_content "planting was successfully created"
    expect(page).to have_content "Progress: Not enough data"
  end

  scenario "Clicking link to owner's profile" do
    visit plantings_by_owner_path(member)
    click_link "View #{member}'s profile >>"
    expect(current_path).to eq member_path(member)
  end

  describe "Progress bar status on planting creation" do
    before do
      login_as member
      visit new_planting_path

      @a_past_date = 15.days.ago.strftime("%Y-%m-%d")
      @right_now = Time.zone.today.strftime("%Y-%m-%d")
      @a_future_date = 1.year.from_now.strftime("%Y-%m-%d")
    end

    it "should show that it is not planted yet" 


    it "should show that days before maturity is unknown" 


    it "should show that planting is in progress" 


    it "should show that planting is 100% complete (no date specified)" 


    it "should show that planting is 100% complete (date specified)" 

  end

  scenario "Planting from crop page" do
    visit crop_path(maize)
    click_link "Plant this"
    within "form#new_planting" do
      expect(page).to have_selector "input[value='maize']"
      click_button "Save"
    end

    expect(page).to have_content "planting was successfully created"
    expect(page).to have_content "maize"
  end

  scenario "Editing a planting to add details" do
    visit planting_path(planting)
    click_link "Edit"
    fill_in "Tell us more about it", with: "Some extra notes"
    click_button "Save"
    expect(page).to have_content "planting was successfully updated"
  end

  scenario "Editing a planting to fill in the finished date" do
    visit planting_path(planting)
    expect(page).to have_content "Progress: Not enough data"
    click_link "Edit"
    check "finished"
    fill_in "Finished date", with: "2015-06-25"
    click_button "Save"
    expect(page).to have_content "planting was successfully updated"
    expect(page).not_to have_content "Progress: Not enough data"
  end

  scenario "Marking a planting as finished" do
    fill_autocomplete "crop", with: "mai"
    select_from_autocomplete "maize"
    within "form#new_planting" do
      fill_in "When?", with: "2014-07-01"
      check "Mark as finished"
      fill_in "Finished date", with: "2014-08-30"

      # Trigger click instead of using Capybara"s uncheck
      # because a date selection widget is overlapping
      # the checkbox preventing interaction.
      find("#planting_finished").trigger 'click'
    end

    # Javascript removes the finished at date when the
    # planting is marked unfinished.
    expect(find("#planting_finished_at").value).to eq("")

    within "form#new_planting" do
      find("#planting_finished").trigger 'click'
    end

    # The finished at date was cached in Javascript in
    # case the user clicks unfinished accidentally.
    expect(find("#planting_finished_at").value).to eq("2014-08-30")

    within "form#new_planting" do
      click_button "Save"
    end
    expect(page).to have_content "planting was successfully created"
    expect(page).to have_content "Finished: August 30, 2014"

    # shouldn't be on the page
    visit plantings_path
    expect(page).not_to have_content "maize"

    # show all plantings to see this finished planting
    visit plantings_path(all: 1)
    expect(page).to have_content "August 30, 2014"
  end

  scenario "Marking a planting as finished without a date" do
    fill_autocomplete "crop", with: "mai"
    select_from_autocomplete "maize"
    within "form#new_planting" do
      check "Mark as finished"
      click_button "Save"
    end
    expect(page).to have_content "planting was successfully created"
    expect(page).to have_content "Finished: Yes (no date specified)"
    expect(page).to have_content "100%"
  end

  describe "Planting sunniness" do
    it "should show the a sunny image" 


    it "should show a sunniness not specified image" 

  end

  describe "Marking a planting as finished from the show page" do
    let(:path) { planting_path(planting) }
    let(:link_text) { "Mark as finished" }

    it_behaves_like "append date"
  end

  describe "Marking a planting as finished from the list page" do
    let(:path) { plantings_path }
    let(:link_text) { "Mark as finished" }

    it_behaves_like "append date"
  end
end

