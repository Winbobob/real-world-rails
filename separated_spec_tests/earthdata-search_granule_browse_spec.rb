# EDSC-71: As a user, I want to view browse imagery for capable granules so that
#          I may see a preview of the data they contain

require "spec_helper"

describe "Granule browse display", reset: false do
  extend Helpers::CollectionHelpers

  before :all do
    Capybara.reset_sessions!
    login
    load_page :search
  end

  context "for granules with browse" do
    use_collection 'C14758250-LPDAAC_ECS', 'AST_L1A'

    context "viewing the granule list" do
      hook_granule_results('ASTER L1A Reconstructed Unprocessed Instrument Data V003')

      it "displays browse thumbnails for each granule which link to the original browse image" 


      context "clicking on a granule result" do
        before :all do
          find("#granule-list-item-0").click
        end

        it "displays a larger browse thumbnail on the map which links to the original browse image" 


        context "and returning to the search page with granule browse visible on the map" do
          before :all do
            leave_granule_results
          end
          it "hides the granule browse" 

        end
      end
    end
  end

  context "for granules with no browse" do
    use_collection 'C179003030-ORNL_DAAC', '15 Minute Stream Flow Data: USGS (FIFE)'

    context "viewing the granule list" do
      hook_granule_results

      it "displays no browse imagery or placeholders" 


      context "clicking on a granule result" do
        it "displays no browse thumbnail for that result" 

      end
    end
  end
end

