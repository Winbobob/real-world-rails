require 'spec_helper'

describe 'Single Granule Data Access', reset: false do
  downloadable_collection_id = 'C179002914-ORNL_DAAC'

  context 'when the user is not logged in' do
    before(:each) do
      load_page :search, focus: downloadable_collection_id
      wait_for_xhr
      first_granule_list_item.click_link "Configure and download single granule data"
    end

    after :each do
      Capybara.reset_sessions!
    end

    it 'forces the user to login before showing data access page' 

  end

  context 'when the user is logged in' do
    before :all do
      load_page :search, focus: downloadable_collection_id
      login
      wait_for_xhr
      dismiss_banner
      first_granule_list_item.click_link "Configure and download single granule data"
      wait_for_xhr
    end

    after :all do
      Capybara.reset_sessions!
    end

    it 'only configures one granule' 


    it 'limits the data access to only the selected granule' 


    context 'when returning to the search results' do
      before :all do
        click_link 'Back to Search Session'
        wait_for_xhr
      end

      it 'displays all of the collections granules' 

    end
  end

  context 'within a saved project' do
    before :all do
      Capybara.reset_sessions!
      load_page :search, focus: downloadable_collection_id
      login
      wait_for_xhr
      dismiss_banner

      click_link "Save your project"
      fill_in "workspace-name", with: "Single Granule Project\t" #press tab to exit the input field
      click_save_project_name
      wait_for_xhr
      first_granule_list_item.click_link "Configure and download single granule data"
      wait_for_xhr
    end

    after :all do
      Capybara.reset_sessions!
    end

    it "only configures one granule" 

  end
end

