require 'spec_helper'

describe 'Collection API Endpoints', reset: false do
  context 'when viewing the collection details for a collection with granules' do
    before :all do
      load_page '/search', env: :sit
      # wait_for_xhr
      click_link "Temporal"
      fill_in "Start", with: "1985-12-01 00:00:00\t\t"
      js_click_apply ".temporal-dropdown"
      wait_for_xhr

      fill_in 'keywords', with: 'C1000000257-DEV07'
      wait_for_xhr
      click_link "View collection details"
      wait_for_xhr
      click_link 'API Endpoints'
    end

    it 'provides a link to the CMR API for the collections granules' 

  end

  context 'when viewing the collection details for a collection with GIBS' do
    before :all do
      load_page :search, env: :sit
      fill_in 'keywords', with: 'C24936-LAADS'
      wait_for_xhr
      click_link "View collection details"
      wait_for_xhr
      click_link 'API Endpoints'
    end

    it 'provides the path to the GIBS endpoint' 


    it 'provides the GIBS layers that are available to view' 

  end

  context 'when viewing the collection details for a collection with OPeNDAP' do
    before :all do
      load_page '/search/collection-details', focus: 'C1214305813-AU_AADC', ac: true
      click_on 'View All Related URLs'
    end

    it 'provides a link to the OPeNDAP endpoint' 

  end

  context 'when viewing the collection details for a collection with MODAPS WCS' do
    before :all do
      load_page :search, ac: true
      fill_in 'keywords', with: 'C1219032686-LANCEMODIS'
      wait_for_xhr
      click_link "View collection details"
      wait_for_xhr
      click_link 'API Endpoints'
    end

    it 'provides the path to the MODAPS WCS endpoint' 

  end

  context 'when viewing the collection details for a collection without granules, GIBS, or OPeNDAP' do
    before :all do
      load_page :search
      fill_in 'keywords', with: 'C179001887-SEDAC'
      wait_for_xhr
      click_link "View collection details"
      wait_for_xhr
    end

    it 'does not provide a link to the CMR API for granules' 


    it 'does not provide a link to the GIBS endpoint' 


    it 'does not provide a link to the OPeNDAP endpoint' 


    it 'does not provide a link to the MODAPS WCS endpoint' 

  end
end

