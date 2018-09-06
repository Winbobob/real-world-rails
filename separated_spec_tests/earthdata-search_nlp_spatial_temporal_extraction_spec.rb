require "spec_helper"

describe "Spatial and temporal extraction", reset: false do

  context "extracted spatial information" do
    before :all do
      load_page :search
      fill_in 'keywords', with: 'Texas'
      wait_for_xhr
    end

    after :all do
      load_page :search
    end

    xit "filters collection results" do
      expect(page).to have_content('8013 Matching Collections')
    end

    it "is set in the query" 


    it "is set on the map" 

  end

  context "extracted temporal information" do
    before :all do
      load_page :search

      @all_collections_count = collection_results_header_value.text.to_i
      fill_in 'keywords', with: 'last winter'
      wait_for_xhr
      @last_winter_collections_count = collection_results_header_value.text.to_i
    end

    after :all do
      load_page :search
    end

    it 'filters collection results' 


    it 'is set in the query' 

  end

  context "extracted spatial and temporal information" do
    before :all do
      load_page :search
      fill_in 'keywords', with: 'snow cover in Boston last winter'
      wait_for_xhr
    end

    after :all do
      load_page :search
    end

    xit 'filters collection results' do
      expect(page).to have_content('316 Matching Collections')
    end

    it "doesn't overwrite the search text" 


    it 'is set in the query and adds q= and ok= query params to the url' 


    it 'is set on the map' 

  end

  context "keyword only search" do
    before :all do
      load_page :search
      fill_in 'keywords', with: 'C179003030-ORNL_DAAC'
      wait_for_xhr
    end

    after :all do
      load_page :search
    end

    it "doesn't apply spatial or temporal filters" 

  end
end

