require 'spec_helper'

describe 'Duplicate Service Options', reset: false do
  downloadable_collection_id = 'C179003030-ORNL_DAAC'
  downloadable_collection_title = '15 Minute Stream Flow Data: USGS (FIFE)'

  non_downloadable_collection_id = 'C179001887-SEDAC'
  non_downloadable_collection_title = '2000 Pilot Environmental Sustainability Index (ESI)'

  before :all do
    load_page :search, project: [downloadable_collection_id, non_downloadable_collection_id], view: :project
    login
    click_button "Download project data"
    wait_for_xhr
  end

  context "when setting options for downloadable collection" do
    after :all do
      reset_access_page
    end

    it "shows 'additional access method' button" 


    context "when clicking 'additional access method' button" do
      before :all do
        click_button 'Add access method'
      end

      it "adds an additional service option" 


      it "displays a 'remove access method' icon" 


      context "when clicking the 'remove access method' icon" do
        before :all do
          # click_on 'Remove access method'
          first('.remove-access-item').click
        end

        it "removes the access method" 


        it "does not display a remove access method icon for the last access method" 

      end
    end
  end

  context 'when setting options for a collection whose only option is "Download"' do
    before :all do
      wait_for_xhr
      choose 'Direct Download'
      click_button 'Continue'
    end

    after :all do
      reset_access_page
    end

    it "does not show 'additional access method' button" 

  end

  context "when submitting with multiple access options" do
    before :all do
      click_button 'Add access method'
      within '.access-item-selection:first-child' do
        choose 'Direct Download'
      end
      within '.access-item-selection:nth-child(4)' do
        choose 'Direct Download'
      end
      click_button 'Continue'
      click_button 'Submit'
    end

    after :all do
      wait_for_xhr
      AccessConfiguration.destroy_all if page.server.responsive?
      click_link 'Back to Data Access Options'
    end

    it "displays download links twice" 

  end
end

