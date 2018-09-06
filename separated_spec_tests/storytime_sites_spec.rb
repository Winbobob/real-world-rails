require 'spec_helper'

describe "In the dashboard, Sites", type: :feature do

  it "creates a site" 


  context "as a logged in user" do
    before{ login_admin }

    it "updates a site", js: true do
      site = Storytime::Site.last

      visit storytime.dashboard_path
      click_link "utility-menu-toggle"
      click_link "site-settings-link"
      fill_in "site_title", with: "The Site's New Name"
      click_button "Save"

      expect(page).to have_content("Your changes were saved successfully")
      site.reload
      expect(site.title).to eq "The Site's New Name"
    end
  end
end

