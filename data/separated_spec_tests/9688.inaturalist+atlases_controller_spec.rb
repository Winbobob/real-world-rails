require File.dirname(__FILE__) + '/../spec_helper'

describe AtlasesController do
  describe "create" do
    it "should make an atlas belonging to the user" 

  end
  
  describe "alter_atlas_presence" do
    let(:user) { make_curator }
    let(:genus) { Taxon.make!( rank: Taxon::GENUS ) }
    let(:taxon) { Taxon.make!( rank: Taxon::SPECIES, parent: genus ) }
    let(:place) { Place.make!( admin_level: 1 ) }
    let(:atlas) { Atlas.make!( taxon: taxon, user: user ) }
    it "should create a listing if one doesn't exist" 

    
    it "should destroy a listing if one does exist" 


    it "should create a listing if there's a comprehensive list that isn't the place's default list" 


    it "should create a listing on the default list if there's a comprehensive list" 


    it "should destroy a listing from a comprehensive list when destroying a default listing" 


    it "should create a listing if there's a comprehensive list for the place's parent" 

  end
end

