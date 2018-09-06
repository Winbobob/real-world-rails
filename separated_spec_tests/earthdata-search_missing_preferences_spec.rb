require 'spec_helper'

describe "User missing ordering preferences", reset: false do
  collection_id = 'C203234523-LAADS'
  collection_title = 'MODIS/Aqua Calibrated Radiances 5-Min L1B Swath 1km V006'

  context "when configuring a data access request" do
    before :all do
      load_page :search, project: [collection_id], view: :project
      wait_for_xhr

      login 'edscbasic'

      click_button "Download project data"
      wait_for_xhr

      choose "Stage for Delivery"
      wait_for_xhr
      select 'FtpPull', from: 'Distribution Options'
      click_button "Continue"
    end

    it "does not show an error message", intermittent: 1 do
      expect(page).to have_no_content('Contact information could not be loaded, please try again later')
    end
  end

  context "when accessing downloadable data" do
    before :all do
      load_page :search, project: [collection_id], view: :project
      wait_for_xhr

      login 'edscbasic'

      click_button "Download project data"
      wait_for_xhr

      choose 'Direct Download'

      click_button 'Submit'
    end

    it "shows the data retrieval page" 

  end
end

