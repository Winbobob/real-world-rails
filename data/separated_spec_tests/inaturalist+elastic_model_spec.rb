require "spec_helper"

describe ElasticModel do

  before(:all) do
    @taxon = Taxon.make!
    @place = Place.make!
  end

  it "has a hash of analyzers and filters" 


  describe "search_criteria" do
    it "returns empty array by default" 


    it "turns wheres into proper matches" 


    it "turns array of values into a terms match query" 


    it "accepts complicated wheres verbatim" 


  end

  describe "id_or_object" do
    it "returns an instance's ID" 


    it "returns everything else verbatim" 

  end

  describe "search_filters" do
    it "returns empty array by default" 


    it "returns non-special filters verbatim" 

  end

  describe "envelope_filter" do
    it "returns nil unless given an options has with some bounds" 


    it "returns a proper envelope filter" 


    it "splits envelopes that cross the dateline" 


    it "defaults bounds to their extreme" 


    it "allows users to search their own private coordinates" 

  end

  describe "valid_latlon?" do
    it "returns true when given two integers representing valid lat/lon" 

  end

  describe "point_geojson" do
    it "returns a valid geojson hash given lat/lon" 

  end

  describe "point_latlon" do
    it "returns a coordinates string lat/lon" 

  end

  describe "geom_geojson" do
    it "returns a multipolygon geojson given a multipolygon" 


    it "returns a point geojson given a point" 

  end

end

