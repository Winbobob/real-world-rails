# EDSC-86 As a user, I want to view polygon spatial extents on a map so that I
#         may understand the location and shape of my results
# EDSC-88 As a user, I want to view point spatial extents on a map so that I may
#         understand the location and shape of my results
# EDSC-90 As a user, I want to view rectangular spatial extents on a map so that
#         I may understand the location and shape of my results

require "spec_helper"

describe "Granule footprint visualizations", reset: false, wait: 60 do
  extend Helpers::CollectionHelpers

  before :all do
    load_page :search
  end

  context "for point collections" do
    use_collection 'C179003030-ORNL_DAAC', '15 Minute Stream Flow Data'

    context "visualizing a collection's granules" do
      hook_granule_results

      it "draws a single point on the map representing all of the collection's granules" 


      context "and mousing over a visualized granule" do
        before :all do
          map_mousemove('#map', 39.1, -96.6)
        end

        after :all do
          map_mouseout()
        end

        it "draws the granule's footprint" 

      end

      context "and mousing off of a visualized granule" do
        before :all do
          map_mousemove('#map', 39.1, -96.6)
          map_mouseout()
        end

        it "hides the granule's footprint" 

      end
    end

    context "removing a visualized collection" do
      hook_granule_results_back

      it "hides the collection's visualizations" 

    end
  end

  context "for polygon collections" do
    use_collection 'C1219248591-LANCEMODIS', 'MODIS/Terra Near Real Time (NRT) Land Surface Temperature/Emissivity 5-Min L2 Swath 1km'

    before :all do
      manually_create_bounding_box(0, 0, 10, 15)
      wait_for_xhr
    end

    context "visualizing a collection's granules" do
      hook_granule_results('MODIS/Terra Near Real Time (NRT) Land Surface Temperature/Emissivity 5-Min L2 Swath 1km')

      it "draws polygons on the map for granule spatial areas" 


      context "and mousing over a visualized granule" do
        before :all do
          map_mousemove()
        end

        after :all do
          map_mouseout()
        end

        it "draws the granule's footprint" 

      end

      context "and mousing off of a visualized granule" do
        before :all do
          map_mousemove()
          map_mouseout()
        end

        it "hides the granule's footprint" 

      end
    end

    context "removing a visualized collection" do
      hook_granule_results_back('MODIS/Terra Near Real Time (NRT) Land Surface Temperature/Emissivity 5-Min L2 Swath 1km')

      it "hides the collection's visualizations" 

    end
  end

  context "for bounding box collections" do
    use_collection 'C1236224151-GES_DISC', 'AIRS-CloudSat cloud mask and radar reflectivities collocation indexes V4.0 (AIRS_CPR_IND) at GES_DISC'

    before :all do
      manually_create_bounding_box(0, 0, 15, 15)
      wait_for_xhr
    end

    context "visualizing a collection's granules" do
      hook_granule_results('AIRS-CloudSat cloud mask and radar reflectivities collocation indexes V4.0 (AIRS_CPR_IND) at GES_DISC')

      it "draws polygons on the map for granule spatial areas" 


      context "and mousing over a visualized granule" do
        before :all do
          map_mousemove()
        end

        after :all do
          map_mouseout()
        end

        it "draws the granule's footprint" 

      end

      context "and mousing off of a visualized granule" do
        before :all do
          map_mousemove()
          map_mouseout()
        end

        it "hides the granule's footprint" 

      end
    end

    context "removing a visualized collection" do
      hook_granule_results_back('AIRS-CloudSat cloud mask and radar reflectivities collocation indexes V4.0 (AIRS_CPR_IND) at GES_DISC')

      it "hides the collection's visualizations" 

    end
  end
end

