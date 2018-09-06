require "spec_helper"

describe "CWIC-enabled data access", reset: false do
  extend Helpers::CollectionHelpers

  dataset_id = "EO-1 (Earth Observing-1) Advanced Land Imager (ALI) Instrument Level 1R, Level 1Gs, Level 1Gst Data"
  search_params = {
    focus: 'C1220566654-USGS_LTA',
    temporal: ['2016-01-21T00:00:00Z', '2016-01-21T23:59:59Z'],
    ac: true
  }

  context "When configuring data access for a CWIC-tagged collection" do
    before :all do
      Capybara.reset_sessions!
      AccessConfiguration.destroy_all
      load_page :search, search_params
      login
      wait_for_xhr
      view_granule_results(dataset_id)
      click_button 'Download'
      wait_for_xhr
    end

    it 'provides the "Download" option' 

  end

  context "When choosing to download data for a CWIC-tagged collection" do
    before :all do
      Capybara.reset_sessions!
      AccessConfiguration.destroy_all
      load_page :search, search_params
      login
      wait_for_xhr
      view_granule_results(dataset_id)
      click_button 'Download'
      wait_for_xhr
      choose 'Direct Download'
      click_on 'Submit'
      wait_for_xhr
    end

    it "provides a button to view download links" 


    it 'provides a button to download links in a file' 


    context "and clicking the view download links button" do
      before(:all) do
        click_on('View Download Links')
      end
      it 'presents a list of download links with associated link titles' 

    end
  end

  context "choosing to download data for single CWIC-tagged granule" do
    before :all do
      Capybara.reset_sessions!
      AccessConfiguration.destroy_all
      load_page :search, search_params
      login
      wait_for_xhr
      view_granule_results(dataset_id)
      within(first_granule_list_item) do
        click_link 'Configure and download single granule data'
      end
      wait_for_xhr
      choose 'Direct Download'
      click_on 'Submit'
      wait_for_xhr
      click_on('View Download Links')
    end

    it 'provides a list of download links for the single granule' 

  end
end

