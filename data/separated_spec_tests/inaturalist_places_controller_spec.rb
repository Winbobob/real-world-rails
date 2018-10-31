require File.dirname(__FILE__) + '/../spec_helper'

describe PlacesController do
  describe "create" do
    it "should make a place with no default type" 


    it "creates places with geojson" 


    it "does not allow non admins to create huge places" 


    it "allows admins to create huge places" 

  end

  describe "update" do
    it "updates places with geojson" 


    it "does not allow non admins to create huge places" 


    it "allows admins to create huge places" 

  end

  describe "destroy" do
    let(:user) { User.make! }
    let(:place) { Place.make!(:user => user) }
    before do
      sign_in user
    end
    it "should delete the place" 

    it "should fail if projects are using the place" 

    it "should fail if projects are using the place in rules" 

  end

  describe "search" do
    let(:place) { Place.make!(:name => 'Panama') }
    let(:another_place) { Place.make!(:name => 'Norway') }
    it "should return results in HTML" 

    it "should redirect with only one result in HTML" 

    it "should not redirect with only one result in JSON" 

    it "should return results in JSON, with html" 

  end

  describe "merge" do
    let(:keeper) { make_place_with_geom(place_type: Place::STATE) }
    let(:reject) { make_place_with_geom(place_type: Place::COUNTRY) }
    before do
      sign_in make_curator
    end
    it "should delete the reject" 

    it "should allow you to keep the reject name" 

    it "should allow you to keep the reject place type" 

  end
end

describe PlacesController, "geometry" do
  before do
    @place = make_place_with_geom(:user => @user)
    @place_without_geom = Place.make!
  end

  it "should return geojson when places have a geometry" 


  it "should not fail when places have no geometry" 


# If you ever figure out how to test page caching...
#   # http://pivotallabs.com/tdd-action-caching-in-rails-3/
#   around do |example|
#     caching, ActionController::Base.perform_caching = ActionController::Base.perform_caching, true
#     store, ActionController::Base.cache_store = ActionController::Base.cache_store, :memory_store
#     silence_warnings { Object.const_set "RAILS_CACHE", ActionController::Base.cache_store }
#     example.run
#     silence_warnings { Object.const_set "RAILS_CACHE", store }
#     ActionController::Base.cache_store = store
#     ActionController::Base.perform_caching = caching
#   end

#   it "should page cache kml" do
#     puts "ActionController::Base.perform_caching: #{ActionController::Base.perform_caching}"
#     puts "PlacesController.perform_caching: #{PlacesController.perform_caching}"
#     puts "ActionController::Base.cache_store: #{ActionController::Base.cache_store}"
#     puts "PlacesController.cache_store: #{PlacesController.cache_store}"
#     get :geometry, :id => @place.id, :format => :kml
#     response.should be_page_cached
#     get :geometry, :id => @place.slug, :format => :kml
#     response.should be_page_cached
#   end
end

# describe PlacesController, "update" do
#   before do
#     @user = User.make!
#     sign_in @user
#     @place = make_place_with_geom(:user => @user)
#   end

#   # http://pivotallabs.com/tdd-action-caching-in-rails-3/
#   around do |example|
#     caching, ActionController::Base.perform_caching = ActionController::Base.perform_caching, true
#     store, ActionController::Base.cache_store = ActionController::Base.cache_store, :memory_store
#     silence_warnings { Object.const_set "RAILS_CACHE", ActionController::Base.cache_store }
#     example.run
#     silence_warnings { Object.const_set "RAILS_CACHE", store }
#     ActionController::Base.cache_store = store
#     ActionController::Base.perform_caching = caching
#   end

#   it "should expire geometry kml page cache if geom changed" do
#     get :geometry, :id => @place.id, :format => :kml
#     response.should be_page_cached
    
#     get :geometry, :id => @place.slug, :format => :kml
#     response.should be_page_cached

#     kml = <<-KML
#       <Polygon>
#         <outerBoundaryIs>
#           <LinearRing>
#             <coordinates>
#               -122.42399,37.716570000000004
#               -122.42261,37.71694
#               -122.42094000000002,37.71705
#               -122.42149,37.71838
#               -122.42247,37.717830000000006
#               -122.42324,37.71833
#               -122.42399,37.716570000000004
#             </coordinates>
#           </LinearRing>
#         </outerBoundaryIs>
#       </Polygon>
#     KML
#     without_delay do
#       put :update, :id => @place.id, :kml => kml
#     end
#     response.should be_redirect
#     get :geometry, :id => @place.id, :format => :kml
#     response.should_not be_page_cached
#     get :geometry, :id => @place.slug, :format => :kml
#     response.should_not be_page_cached
#   end
# end

def test_place_geojson(size = :default)
  coords = if size == :default
    [[ [0,0], [0,1], [1,1], [1,0], [0,0] ]]
  elsif size == :huge
    [[ [0,0], [0,60], [60,60], [60,0], [0,0] ]]
  end
  {
    type: "FeatureCollection",
    features: [{
      type: "Feature",
      properties: { },
      geometry: {
        type: "Polygon",
        coordinates: coords
      }
    }]
  }.to_json
end

