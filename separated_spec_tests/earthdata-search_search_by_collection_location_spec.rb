# EDSC-27 As a user, I want to search for collections coinciding with the point
#         location of another collection so that I may limit my results to my
#         area of interest

require "spec_helper"

describe "Spatial search by collection location" do
  let(:location_link_text) { "Search using this collection's location" }

  before do
    load_page :search
    wait_for_xhr
    fill_in "keywords", with: 'C179003030-ORNL_DAAC'
    wait_for_xhr
  end

  context "for collections with point spatial" do
    it "displays a button to search using the collection's location" 


    context "when choosing to view the collection's location" do
      before do
        click_link location_link_text
        wait_for_xhr
      end

      it "places a point spatial constraint on the map" 


      it "highlights the collection's location link" 


      it "centers the map over the selected granule" 


      it "zooms the map to the selected granule" 

    end

    context "when removing a collection's location link" do
      before do
        click_link location_link_text
        expect(page).to have_css('#map .leaflet-marker-icon')
        click_link location_link_text
      end

      it "removes the spatial constraint from the map" 


      it "removes highlights from the collection's location link" 

    end
  end

  context "for collections without point spatial" do
    it "displays no button to search using the collection's location" 

  end
end

