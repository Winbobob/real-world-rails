# -*- coding: utf-8 -*-
require 'spec_helper'

describe 'Collection details', reset: false do
  context 'when displaying the collection details' do
    before :all do
      load_page :search
      fill_in 'keywords', with: 'AST_L1AE'
      wait_for_xhr
      # expect(page).to have_content('ASTER Expedited L1A')
      first_collection_result.click_link('View collection details')
      wait_for_xhr
    end
    it 'those details provide the expected collection data' 


    context 'and when the metadata formats toggle is clicked' do
      before :all do
        click_link 'View More Metadata'
      end
      it 'provides the metadata formats links' 

    end

    context 'and when the API Endpoints toggle is clicked' do
      before :all do
        click_link 'API Endpoints'
        wait_for_xhr
      end
      it 'provides the API Endpoints links' 

    end
  end

  context 'when selecting a collection that is only viewable after logging in' do
    before :all do
      Capybara.reset_sessions!
      load_page :search, env: :uat
      login
      wait_for_xhr
      fill_in 'keywords', with: 'C1216393716-EDF_OPS'
      wait_for_xhr
      click_link('View collection details')
      wait_for_xhr
    end

    after :all do
      Capybara.reset_sessions!
    end

    it 'displays the collection details' 


    context 'and when the metadata formats toggle is clicked' do
      before :all do
        click_link 'View More Metadata'
      end
      it 'provides the metadata formats links' 

    end

    context 'and when the API Endpoints toggle is clicked' do
      before :all do
        click_link 'API Endpoints'
      end
      it 'provides the API Endpoints links' 

    end
  end

  context 'when selecting a collection without contacts in the xml' do
    before :all do
      load_page :search, q: 'Aqua_AMSR-E_L3_TB_23.8GHz-H', ac: true
      first_collection_result.click_link('View collection details')
    end

    it "displays the collection's detail page with no errors" 

  end

  context 'when selecting a collection with point spatial' do
    before :all do
      load_page :search, q: 'C179003030-ORNL_DAAC'
      first_collection_result.click_link('View collection details')
    end

    it 'dislpays the collection searched for in the results list' 


    it "does not display the collection's spatial bounds on the map" 

  end

  context 'when selecting a collection with bounding box spatial' do
    before :all do
      load_page :search
      fill_in 'keywords', with: 'C179002945-ORNL_DAAC'
      wait_for_xhr
      first_collection_result.click_link('View collection details')
    end

    it "does not display the collection's spatial bounds on the map" 

  end

  context 'when selecting a collection with polygon spatial' do
    before :all do
      load_page :search, ac: true
      fill_in 'keywords', with: 'C1386246913-NSIDCV0'
      wait_for_xhr
      first_collection_result.click_link('View collection details')
    end


    it "does not display the collection's spatial bounds on the map" 

  end

  # FIXME: This collection no longer has line spatial
  # context 'when selecting a collection with line spatial' do
  #   before :all do
  #     load_page :search
  #     fill_in 'keywords', with: 'NSIDC-0239'
  #     expect(page).to have_content('SMEX02 Atmospheric Aerosol Optical Properties Data')
  #     first_collection_result.click_link('View collection details')
  #   end
  #
  #   it "displays the collection's spatial bounds on the map" do
  #     expect(page).to have_css('#map .leaflet-overlay-pane svg.leaflet-zoom-animated path')
  #   end
  # end

  # TODO: RDA // This collection doesn't exist anymore, it needs to be replaced.
  context 'when selecting a collection with multiple temporal', pending_updates: true do
    before :all do
      load_page '/search/collection-details', env: :uat, focus: 'C1204482909-GCMDTEST'
    end

    xit 'displays the collection searched for in the results list' do
      expect(page).to have_content('CALIPSO Lidar Level 2 5km aerosol profile data V3-01')
    end

    xit 'displays all the temporal' do
      expect(page).to have_content('2006-06-13 to 2009-02-16')
      expect(page).to have_content('2009-03-17 to 2011-10-31')
    end
  end

  context 'when selecting a collection with multiple temporal fields but some of which have only BeginningDateTime' do
    before :all do
      load_page '/search/collection-details', focus: 'C1214560374-JAXA', ac: true
    end

    it 'displays the correct title' 


    it 'displays all the temporal' 

  end

  context 'when selecting a collection with multiple lines of description' do
    before :all do
      load_page '/search/collection-details', focus: 'C197265171-LPDAAC_ECS'
    end

    it 'displays carriage returns in the description' 

  end

  context 'when selecting a collection with a description with links' do
    before :all do
      load_page '/search/collection-details', focus: 'C1200230663-MMT_1', env: :sit, ac: true
    end

    it 'only displays one link total' 


    it 'displays the external link' 


    it 'does not display a link for relative paths' 

  end

  context 'when selecting a collection with multiple spatial values' do
    before :all do
      load_page '/search/collection-details', focus: 'C1214560151-JAXA', ac: true
      wait_for_xhr
    end

    it 'displays all spatial content' 

  end

  context 'when selecting a collection with multiple data centers' do
    before :all do
      load_page '/search/collection-details', focus: 'C179460405-LPDAAC_ECS'
    end

    it 'displays all data center content' 

  end

  context "when selecting a collection with temporal that doesn't have an end date or 'ends at present' flag" do
    before :all do
      load_page '/search/collection-details', focus: 'C203234517-LAADS'
    end

    it 'displays the temporal correctly' 

  end

  context 'when selecting a collection with related urls' do
    before do
      load_page '/search/collection-details', focus: 'C1200230663-MMT_1', env: :sit, ac: true
    end

    it 'displays highlighted urls' 


    context 'when clicking View All Related URLs' do
      before do
        # This 'execute' is causing this test to fail on Travis - and it still passes locally
        # with it removed.  So - suppressing for now!
        # page.execute_script "$('#collection-details .master-overlay-content')[0].scrollTop = 400"
        click_on 'View All Related URLs'
      end

      it 'displays all related urls grouped by URLContentType' 


      it 'displays types and subtypes of related urls' 


      it 'displays urls in alphabetical order' 


      it "doesn't display EDSC or Reverb URLs" 

    end
  end

  context 'when selecting a collection without related urls' do
    before do
      load_page '/search/collection-details', focus: 'C1297504182-LARC'
    end

    it 'does not display option to view all related urls' 

  end

  context 'when selecting a collection with polygon spatial' do
    before :all do
      load_page '/search/collection-details', focus: 'C1267337984-ASF'
    end

    it 'displays the spatial' 

  end

  context 'when selecting a collection with invalid DOI field' do
    before :all do
      load_page '/search/collection-details', focus: 'C1200235634-EDF_DEV06', env: :sit, ac: true
    end

    it 'displays the DOI and the Authority' 

  end
  
  context 'when selecting a collection with a DOI field which contains "http://"' do
    before :all do
      load_page '/search/collection-details', focus: 'C1200230663-MMT_1', env: :sit, ac: true
    end

    it 'updates the URL to contain "https://"" instead' 

  end

  
  context 'when selecting a collection with valid DOI field' do
    before :all do
      load_page '/search/collection-details', focus: 'C179003620-ORNL_DAAC'
    end

    it 'displays the DOI and the Authority' 

  end
end

