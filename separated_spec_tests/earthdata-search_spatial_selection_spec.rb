# EDSC-20 As a user, I want to search for collections by spatial point so that I
#         may limit my results to my point of interest

require "spec_helper"

describe "Spatial tool", reset: false do
  before :all do
    load_page :search

    # JS: Move the panel out of the way
    click_link 'Minimize'
  end

  let(:spatial_dropdown) do
    page.find('#main-toolbar .spatial-dropdown-button')
  end

  let(:point_button)     { page.find('#map .leaflet-draw-draw-marker') }
  let(:rectangle_button) { page.find('#map .leaflet-draw-draw-rectangle') }
  let(:polygon_button)   { page.find('#map .leaflet-draw-draw-polygon') }

  context "selection" do
    context "when no tool is currently selected" do
      context "choosing the point selection tool from the site toolbar" do
        before(:each) { choose_tool_from_site_toolbar('Point') }

        it "selects the point selection tool in both toolbars" 

      end

      context "choosing the point selection tool from the map toolbar" do
        before(:each) { choose_tool_from_map_toolbar('Coordinate') }

        it "selects the point selection tool in both toolbars" 

      end
    end
    context "when another tool is currently selected" do
      before(:each) { choose_tool_from_map_toolbar('Rectangle') }

      context "choosing the point selection tool in the site toolbar" do
        before(:each) { choose_tool_from_site_toolbar('Point') }

        it "selects the point selection tool in both toolbars" 

      end

      context "choosing the point selection tool in the map toolbar" do
        before(:each) { choose_tool_from_map_toolbar('Coordinate') }

        it "selects the point selection tool in both toolbars" 

      end
    end

    context "choosing a tool when a point is already selected" do
      before(:each) do
        create_point
        choose_tool_from_map_toolbar('Rectangle')
      end

      it "removes the point from the map" 


      context 'and clicking "Cancel"' do
        before(:each) do
          within "#map" do
            click_link "Cancel"
          end
        end

        it "adds the removed point back to the map" 

      end
    end

    context "canceling the point selection in the toolbar" do
      before(:each) do
        choose_tool_from_map_toolbar('Coordinate')
        within "#map" do
          click_link "Cancel"
        end
      end

      it "deselects the point selection tool in the site toolbar" 

    end
  end
end

describe "Spatial" do
  before :each do
    load_page :search
  end

  context "point selection" do
    it "displays point coordinates in the manual entry text box" 


    context "changing the point selection" do
      before(:each) do
        create_point(0, 0)
        wait_for_xhr

        expect(page).to have_field('manual-coord-entry-point', with: '0,0')
        create_point(-75, 40)
        wait_for_xhr
      end

      it "updates the coordinates in the manual entry box" 


      it "pans map to the point" 

    end

    context "removing the point selection" do
      before(:each) do
        create_point(0, 0)
        wait_for_xhr
        clear_spatial
        wait_for_xhr
      end

      it "removes the spatial point in the manual entry box" 


      # TODO: RDA // Setting a point at 0,0 does not go to 0,0 (inspecting `m`)
      # it "pans map to the point" do
      #   expect(page).to have_map_center(0, 0, 2)
      # end
    end
  end

  context "bounding box selection" do
    it "filters collections using the selected bounding box" 


    it "displays bounding box points in the manual entry text boxes" 


    context "changing the bounding box selection" do
      before(:each) do
        create_bounding_box(0, 0, 10, 10)
        wait_for_xhr
        create_bounding_box(69, -174, 72, -171)
        wait_for_xhr
      end

      it "updates the coordinates in the manual entry text boxes" 


      it "updates the collection filters using the new bounding box selection" 

    end

    context "removing the bounding box selection" do
      before(:each) do
        create_bounding_box(0, 0, 10, 10)
        wait_for_xhr
        clear_spatial
        wait_for_xhr
      end

      it "removes the spatial point in the manual entry text boxes" 


      it "removes the spatial bounding box collection filter" 

    end

    context 'clearing filters' do
      before :each do
        create_bounding_box(0, 0, 10, 10)
        wait_for_xhr
        click_on 'Clear Filters'
        wait_for_xhr
      end

      it 'removes the spatial point in the manual entry text boxes' 


      context 'using the manual entry text boxes to enter a new SW point' do
        before :each do

          # JS: Get panel out of the way
          click_link 'Minimize'

          click_on 'Search by spatial rectangle'
          fill_in 'manual-coord-entry-swpoint', with: "0,0\t"
        end

        it 'does not display the old NE point values' 

      end
    end

    context "loading a bounding box selection over the antimeridian" do
      before :each do
        visit '/search?m=-29.25!-199.40625!0!1&sb=160%2C20%2C-170%2C40'
        wait_for_xhr
      end

      it "shows the bounding box crossing the antimeridian" 

    end

    it "filters collections using north polar bounding boxes in the north polar projection" 


    it "filters collections using south polar bounding boxes in the south polar projection" 

  end

  context "polygon selection" do

    it "doesn't show manual input text box" 


    it "filters collections using the selected polygon", intermittent: 1 do
      create_polygon([10, 10], [10, -10], [-10, -10], [-10, 10])
      wait_for_xhr
      expect(page).to have_no_content("15 Minute Stream Flow Data: USGS")
      expect(page).to have_content("MODIS/Aqua Aerosol 5-Min L2 Swath 3km V006")
    end

    it "displays errors for invalid polygons", intermittent: 1 do
      create_polygon([10, 10], [-10, -10], [10, -10], [-10, 10])
      wait_for_xhr
      expect(page).to have_content("The polygon boundary intersected itself at the following points:")
    end

    context "changing the polygon selection" do
      before(:each) do
        create_polygon([10, 10], [10, -10], [-10, -10], [-10, 10])
        wait_for_xhr
        # expect(page).to have_content("MODIS/Aqua Aerosol 5-Min L2 Swath 3km V006")
        create_polygon([77, -165], [72, -173], [67, -168], [69, -159])
        wait_for_xhr
      end

      it "updates the collection filters using the new bounding box selection" 

    end

    context "removing the bounding box selection" do
      before(:each) do
        create_polygon([10, 10], [10, -10], [-10, -10], [-10, 10])
        wait_for_xhr

        clear_spatial
        wait_for_xhr
      end

      it "removes the spatial bounding box collection filter" 

    end
  end
end

