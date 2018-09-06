require "spec_helper"

describe "CWIC Granule list", reset: false do
  extend Helpers::CollectionHelpers

  before :all do
    load_page :search, q: 'C1220566654-USGS_LTA', ac: true
  end

  context "for all collections with granules" do
    use_collection 'C1220566654-USGS_LTA', 'EO-1 (Earth Observing-1) Advanced Land Imager (ALI) Instrument Level 1R, Level 1Gs, Level 1Gst Data'
    hook_granule_results("EO-1 (Earth Observing-1) Advanced Land Imager (ALI) Instrument Level 1R, Level 1Gs, Level 1Gst Data")

    it "provides a button to get collection details", acceptance: true do
      expect(granule_list).to have_link('View collection details')
    end

    it "provides a button to download the collection", acceptance: true do
      expect(granule_list).to have_button('Download')
    end

    it "provides a button to edit granule filters", acceptance: true do
      expect(granule_list).to have_link('Filter granules')
    end

    context "clicking on the collection details button" do
      before :all do
        wait_for_xhr
        granule_list.click_link('View collection details')
        wait_for_xhr
      end

      after :all do
        collection_details.click_link('Back to Granules')
      end

      it "displays the collection details", acceptance: true do
        expect(page).to have_visible_collection_details
        expect(page).to have_content('DOI/USGS/EROSARCHIVER DISTRIBUTOR')
      end

      it "displays back navigation with the appropriate text", acceptance: true do
        expect(collection_details).to have_link('Back to Granules')
      end
    end
  end

  context "for collections with many granule results" do
    use_collection 'C1220566654-USGS_LTA', 'EO-1 (Earth Observing-1) Advanced Land Imager (ALI) Instrument Level 1R, Level 1Gs, Level 1Gst Data'

    context "clicking on a collection result" do
      hook_granule_results("EO-1 (Earth Observing-1) Advanced Land Imager (ALI) Instrument Level 1R, Level 1Gs, Level 1Gst Data")

      it "displays the first granule results in a list that pages by 20" 

    end
  end

  context "for collections that have granules with temporal fields" do
    use_collection 'C1220566654-USGS_LTA', 'EO-1 (Earth Observing-1) Advanced Land Imager (ALI) Instrument Level 1R, Level 1Gs, Level 1Gst Data'

    context "clicking on a collection result" do
      hook_granule_results('EO-1 (Earth Observing-1) Advanced Land Imager (ALI) Instrument Level 1R, Level 1Gs, Level 1Gst Data')

      it "displays temporal information on the granule list" 

    end
  end

  context "for CWIC tagged collections" do
    use_collection 'C1220566654-USGS_LTA', 'EO-1 (Earth Observing-1) Advanced Land Imager (ALI) Instrument Level 1R, Level 1Gs, Level 1Gst Data'
    hook_granule_results('EO-1 (Earth Observing-1) Advanced Land Imager (ALI) Instrument Level 1R, Level 1Gs, Level 1Gst Data')

    it "displays a help button to find out more information about CWIC collections", acceptance: true do
      expect(page).to have_link("More details")
    end

    context "clicking on the CWIC help button" do
      before :all do
        click_on "More details"
      end

      it "displays additional details about CWIC collections", acceptance: true do
        expect(page).to have_content "CWIC is short for CEOS WGISS Integrated Catalog"
      end

      context "and closing the help dialog" do
        before :all do
          # For some reason, capybara-webkit doesn't like to click this properly. Javascript works.
          page.execute_script("$('#whats-cwic-modal button').click()")
        end

        it "hides the additional details about CWIC collections" 

      end
    end
  end

  context "for non-CWIC collections" do
    use_collection 'C179003030-ORNL_DAAC', '15 Minute Stream Flow Data: USGS (FIFE)'
    hook_granule_results

    it "does not display a help button to find out more information about CWIC collections", acceptance: true do
      expect(page).not_to have_link("More details")
    end
  end
end

