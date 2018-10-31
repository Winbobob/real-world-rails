require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "a TaxaController" do
  describe "index" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    it "should filter by place_id" 


    it "should show iconic taxa if no search params" 


    it "should filter by names" 

  end

  describe "search" do
    before(:each) { enable_elastic_indexing( Observation, Taxon, Place ) }
    after(:each) { disable_elastic_indexing( Observation, Taxon, Place ) }

    it "should filter by place_id" 


    it "returns results in the configured place" 


    it "returns all results when there are none in the configured place" 


    it "filters by is_active=true" 


    it "filters by is_active=false" 


    it "returns all taxa when is_active=any" 


    it "should place an exact match first" 


    it "should not return exact results of inactive taxa" 


    # unfortunately i don't really know how to test this b/c it's not clear
    # how elasticsearch sorts its results
    it "should place an exact match first even if it's not on the first page of results"
  end

  describe "autocomplete" do
    before(:each) { enable_elastic_indexing([ Observation, Taxon, Place ]) }
    after(:each) { disable_elastic_indexing([ Observation, Taxon, Place ]) }

    it "filters by is_active=true" 


    it "filters by is_active=false" 


    it "returns all taxa when is_active=any" 

  end

  describe "show" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    it "should include range kml url" 


    describe "with default photo" do
      let(:photo) { 
        Photo.make!(
          "id" => 1576,
          "large_url" => "http://staticdev.inaturalist.org/photos/1576/large.jpg?1369951594",
          "license" => 4,
          "medium_url" => "http://staticdev.inaturalist.org/photos/1576/medium.jpg?1369951594",
          "native_page_url" => "http://localhost:3000/photos/1576",
          "native_photo_id" => "1576",
          "native_username" => "kueda",
          "original_url" => "http://staticdev.inaturalist.org/photos/1576/original.jpg?1369951594",
          "small_url" => "http://staticdev.inaturalist.org/photos/1576/small.jpg?1369951594",
          "square_url" => "http://staticdev.inaturalist.org/photos/1576/square.jpg?1369951594",
          "thumb_url" => "http://staticdev.inaturalist.org/photos/1576/thumb.jpg?1369951594"
        ) 
      }
      let(:taxon_photo) { TaxonPhoto.make!(:photo => photo) }
      let(:taxon) { taxon_photo.taxon }

      it "should include all image url sizes" 


      it "should include license url" 

    end

    it "should return names specific to the user's place" 

  end

  describe "children" do
    it "should only show active taxa by default" 

    it "should show all taxa if requested" 

  end
end

describe TaxaController, "oauth authentication" do
  let(:user) { User.make! }
  let(:token) { double :acceptable? => true, :accessible? => true, :resource_owner_id => user.id }
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    allow(controller).to receive(:doorkeeper_token) { token }
  end
  it_behaves_like "a TaxaController"
end

describe TaxaController, "devise authentication" do
  let(:user) { User.make! }
  before do
    http_login(user)
  end
  it_behaves_like "a TaxaController"
end

