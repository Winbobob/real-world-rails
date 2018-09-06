# EDSC-25: As a user, I want to search for collections by ESRI shapefile so that I
#          may limit my results to my area of interest

require "spec_helper"

describe "Shapefile search", reset: false, wait: 30 do
  before :all do
    load_page :search
  end

  context "when uploading a file which format is not supported" do
    before :all do
      upload_shapefile('doc/example-data/shapefiles/invalid_format.mp4')
    end

    after :all do
      clear_shapefile
    end

    it "displays an error icon and an error message" 

  end

  context "when uploading a single .shp file as ESRI Shapefile" do
    before :all do
      upload_shapefile('doc/example-data/shapefiles/single_shp.shp')
    end

    after :all do
      clear_shapefile
    end

    it "displays an error icon and a custom error message" 

  end

  context "when uploading a shapefile containing multiple features" do
    before :all do
      upload_shapefile('doc/example-data/shapefiles/complex.geojson')
    end

    after :all do
      clear_shapefile
    end

    it "displays the shapefile's features" 


    context "when clicking on a feature" do
      before :all do
        page.execute_script("$('.geojson-svg').first().mapClick()")
      end

      after :all do
        clear_spatial
      end

      it "sets the feature as the current search constraint" 


      it "hides the help message prompting the user to select a feature" 

    end
  end

  context "when uploading a simple shapefile which points can be simplified" do
    before :all do
      upload_shapefile('doc/example-data/shapefiles/shape_with_redundancies.zip')
      # TODO This sleep is here because specs for centering and zooming
      # would not give consistent results without the sleep
      sleep 1
    end

    after :all do
      clear_shapefile
      clear_spatial
    end

    it "doesn't display a help message explaining the point reduction" 

  end

  context "when uploading a shapefile containing a single feature" do
    before :all do
      upload_shapefile('doc/example-data/shapefiles/simple.geojson')
      # TODO This sleep is here because specs for centering and zooming
      # would not give consistent results without the sleep
      sleep 1
    end

    after :all do
      clear_shapefile
      clear_spatial
    end

    context "removing the file and uploading another one" do
      before :all do
        click_link "Remove file"
        upload_shapefile('doc/example-data/shapefiles/shape_with_redundancies.zip')
        # TODO This sleep is here because specs for centering and zooming
        # would not give consistent results without the sleep
        sleep 1
      end

      after :all do
        clear_shapefile
        clear_spatial

        upload_shapefile('doc/example-data/shapefiles/simple.geojson')
        # TODO This sleep is here because specs for centering and zooming
        # would not give consistent results without the sleep
        sleep 1
      end

      it "keeps the latest shape file on map" 

    end

    it "sets the feature as the current search constraint" 


    it "displays no help message prompting the user to select a feature" 


    it "centers the map over the spatial constraint" 


    it "zooms the map to the spatial constraint" 

  end

  context "when selecting a shapefile feature containing a large number of points" do
    before :all do
      clear_spatial
      clear_shapefile
      expect(page).to have_no_css('.geojson-svg')
      upload_shapefile('doc/example-data/shapefiles/large.geojson')
      expect(page).to have_css('.geojson-svg')
    end

    after :all do
      clear_shapefile
      clear_spatial
    end

    it "sets a search constraint containing a reduced number of points" 


  end

  context "when removing an uploaded shapefile" do
    before :all do
      upload_shapefile('doc/example-data/shapefiles/simple.geojson')
      expect(page).to have_spatial_constraint('polygon:100,0:101,0:101,1:100,1')
      click_link "Remove file"
    end

    after :all do
      clear_spatial
    end

    it "hides the shapefile's display" 


    it "keeps search constraints" 

  end

  context "when switching spatial search tools" do
    before :all do
      upload_shapefile('doc/example-data/shapefiles/simple.geojson')
      expect(page).to have_css('.geojson-svg')
      choose_tool_from_map_toolbar('Coordinate')
    end

    after :all do
      within '#map' do
        click_link "Cancel"
      end
      clear_shapefile
      clear_spatial
    end

    it "hides the shapefile's display" 


    it "hides shapefile search constraints" 


    context "upon canceling the spatial selection" do
      before :all do
        within '#map' do
          click_link "Cancel"
        end
      end

      after :all do
        choose_tool_from_map_toolbar('Coordinate')
      end

      it "restores the shapefile's display" 


      it "restores shapefile search constraints" 

    end

    context "upon creating a new constraint" do
      before :all do
        create_point
      end

      after :all do
        upload_shapefile('doc/example-data/shapefiles/simple.geojson')
        wait_for_xhr
        choose_tool_from_map_toolbar('Coordinate')
      end

      it "keeps the shapefile's display hidden" 


      it "keeps the shapefile's search constraints hidden" 

    end

  end
end

