require "spec_helper"

describe "Data download page", reset: false do
  downloadable_collection_id = 'C194001241-LPDAAC_ECS'
  downloadable_collection_title = 'MODIS/Terra Vegetation Indices 16-Day L3 Global 250m SIN Grid V006'

  non_downloadable_collection_id = 'C179001887-SEDAC'
  non_downloadable_collection_title = '2000 Pilot Environmental Sustainability Index (ESI)'

  orderable_collection_id = 'C203234523-LAADS'
  orderable_collection_title = 'MODIS/Aqua Calibrated Radiances 5-Min L1B Swath 1km V006'

  orderable_collection_id_with_no_browseable_granules = 'C1000001440-NSIDC_ECS'

  no_direct_download_collection_id = 'C179003030-ORNL_DAAC'

  non_orderable_collection_id = 'C179001887-SEDAC'
  non_orderable_collection_title = '2000 Pilot Environmental Sustainability Index (ESI)'

  no_resource_collection_id = 'C204690560-LAADS'
  no_resource_collection_title = 'MODIS/Aqua Aerosol 5-Min L2 Swath 3km V006'

  no_granules_collection_id = 'C1000000700-LARC_ASDC'
  no_granules_collection_title = 'ACRIMII_TSI_UARS_NAT'

  browseable_collection_id = 'C115003857-NSIDC_ECS'
  browseable_collection_title = 'MODIS/Aqua Sea Ice Extent Daily L3 Global 1km EASE-Grid Night V005'
  browseable_collection_params = {project: [browseable_collection_id],
                               temporal: ['2015-01-01T00:00:00Z', '2015-01-01T00:00:01Z']}



  before(:all) do
    AccessConfiguration.destroy_all
    load_page :search, overlay: false
    login
  end

  after(:all) do
    wait_for_xhr
    AccessConfiguration.destroy_all if page.server.responsive?
  end

  context "when some accessed collections have additional resource or documentation links" do
    before :all do
      load_page 'data/configure', project: [downloadable_collection_id]
      # wait_for_xhr

      choose 'Download'
      click_on 'Submit'
      wait_for_xhr
    end

    it "displays a section for additional resources and documentation", intermittent: 1 do
      expect(page).to have_content("Additional Resources and Documentation")
    end

    it "displays links for collections with additional resources and documentation" 


    it "displays titles for collections with additional resources and documentation" 

  end

  context "when no accessed collections have additional resource or documentation links" do
    before :all do
      load_page 'data/configure', project: [no_resource_collection_id]
      wait_for_xhr

      choose 'Download'
      click_on 'Submit'
      wait_for_xhr
    end

    it "displays no section for additional resources and documentation" 


    it "displays no information for collections without additional resources and documentation" 

  end

  context "selecting the direct download option for granules without browse imagery" do
    before :all do
      load_page 'data/configure', project: [no_direct_download_collection_id]
      wait_for_xhr

      choose 'Direct Download'
      click_on 'Submit'
      wait_for_xhr
    end

    it "does not display a link to view browse images" 

  end

  context "selecting the direct download option for granules with browse imagery" do
    before :all do
      load_page 'data/configure', browseable_collection_params
      wait_for_xhr

      choose 'Direct Download'
      click_on 'Submit'
      wait_for_xhr
    end

    # The intermittence might be caused by db not cleaned up.
    # Reproduceable locally only if the db is not clean. The spec will pass after a db:drop/setup.
    it "displays a link to view browse images", intermittent: 1 do
      expect(page).to have_link('View Browse Image Links')
    end

    context 'clicking on a "View Browse Image Links" button' do
      before :all do
        click_link "View Browse Image Links"
      end

      it "displays links to browse images" 

    end
  end

  context "selecting an asynchronous access option for granules with browse imagery" do
    before :all do
      load_page 'data/configure', browseable_collection_params
      wait_for_xhr

      choose 'Stage for Delivery'
      click_on 'Continue'

      # Confirm address
      click_on 'Submit'
      wait_for_xhr
    end

    # The intermittence might be caused by db not cleaned up.
    # Reproduceable locally only if the db is not clean. The spec will pass after a db:drop/setup.
    it "displays a link to view browse images", intermittent: 1 do
      expect(page).to have_link('View Browse Image Links')
    end

    context 'clicking on a "View Browse Image Links" button' do
      before :all do
        click_link "View Browse Image Links"
      end

      it "displays links to browse images" 

    end
  end

  context "selecting an asychronous access option for granules without browse imagery" do
    before :all do
      load_page 'data/configure', project: [orderable_collection_id_with_no_browseable_granules]
      wait_for_xhr

      choose 'Stage for Delivery'
      click_on 'Continue'

      # Confirm address
      click_on 'Submit'
      wait_for_xhr
    end

    it "does not display a link to view browse images" 

  end

  context "when a collection with more than 2000 granules has been selected for direct download" do
    before :all do
      load_page 'data/configure', project: 'C1000000561-NSIDC_ECS'
      wait_for_xhr
      choose 'Direct Download'
      click_on 'Submit'
      wait_for_xhr
    end
    context 'upon clicking a "View/Download Data Links" button' do
      before :all do
        click_link "View/Download Data Links"
        wait_for_xhr
      end

      it "displays a page containing direct download hyperlinks for the collection's granules in a new window" 


      it "does not display inherited collection-level download links" 

    end
  end
  context "when collections have been selected for direct download" do
    before :all do
      load_page 'data/configure', {project: [downloadable_collection_id], temporal: ['2014-07-10T00:00:00Z', '2014-07-10T03:59:59Z']}
      # wait_for_xhr

      choose 'Direct Download'
      click_on 'Submit'
      wait_for_xhr
    end

    it 'does not display a header instructing the user to standby for status' 


    it "displays a link to return to search results" 


    it "displays information on using direct download" 


    it "displays a link to access a page containing direct download urls for collections chosen for direct download" 


    it "displays a link to access a page containing direct download urls for collections chosen for direct download" 


    context 'upon clicking a "Download Access Script" button' do
      before :all do
        click_link "Download Access Script"
      end

      it "displays a page with a shell script on it which performs the user's query" 


      context 'and click "Download Script File" button' do
        before :all do
          within_last_window do
            synchronize do
              expect(page).to have_link('Download Script File')
            end
            click_link 'Download Script File'
          end
        end

        it 'downloads a shell script' 

      end
    end
  end

  context "when no collections have been selected for direct download" do
    before :all do
      load_page 'data/configure', project: [no_direct_download_collection_id]
      wait_for_xhr

      choose 'Stage for Delivery'
      click_on 'Continue'

      # Confirm address
      click_on 'Submit'
    end

    it "displays no information on direct downloads" 

  end

  context "when collections have been selected for asynchronous access" do
    before :all do
      load_page 'data/configure', project: [orderable_collection_id, non_orderable_collection_id], temporal: ['2016-01-21T00:00:00Z', '2016-01-21T00:00:01Z']
      wait_for_xhr

      choose 'Stage for Delivery'
      click_on 'Continue'
      # No actions available on the second, continue
      click_on 'Continue'

      # Confirm address
      click_on 'Submit'
      wait_for_xhr
    end

    it "displays a link to return to search results" 


    it "displays information on obtaining data asynchronously" 


    it "indicates current order status" 


    it "provides a link to cancel the order" 


    it "displays no tracking links for collections that were not chosen for asychronous access" 

  end

  context "when no collections have been selected for asynchronous access" do
    before :all do
      load_page 'data/configure', project: [downloadable_collection_id]
      wait_for_xhr

      choose 'Direct Download'
      click_on 'Submit'
    end

    it "displays no information on direct downloads" 

  end
end

