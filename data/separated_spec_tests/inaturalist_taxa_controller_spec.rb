require File.dirname(__FILE__) + '/../spec_helper'

describe TaxaController do
  describe "show" do
    before(:each) { enable_elastic_indexing([ Observation ]) }
    after(:each) { disable_elastic_indexing([ Observation ]) }
    it "should 404 for absurdly large ids" 


    # The following are all specs for the old taxon page and should be removed
    # once we've completely gotten rid of it
    
    # render_views
    # # not a pretty test. maybe it's time for view tests...?
    # it "should use a taxon name for the user's place instead of the default" do
    #   t = Taxon.make!
    #   tn1 = TaxonName.make!(:taxon => t, :name => "the default name")
    #   tn2 = TaxonName.make!(:taxon => t, :name => "the place name")
    #   p = Place.make!
    #   PlaceTaxonName.make!(:place => p, :taxon_name => tn2)
    #   user = User.make!(:place => p)
    #   sign_in user
    #   get :show, :id => t.id
    #   expect(response.body).to be =~ /<h2>.*?#{tn2.name}.*?<\/h2>/m
    # end

    # it "should use a taxon name for the requested place instead of the default" do
    #   t = Taxon.make!
    #   tn1 = TaxonName.make!(:taxon => t, :name => "the default name")
    #   tn2 = TaxonName.make!(:taxon => t, :name => "the place name")
    #   p = Place.make!
    #   PlaceTaxonName.make!(:place => p, :taxon_name => tn2)
    #   sign_in User.make!
    #   get :show, id: t.id, place_id: p.id
    #   expect(response.body).to be =~ /<h2>.*?#{tn2.name}.*?<\/h2>/m
    # end

    # describe "listed_taxon" do
    #   let( :taxon ) { Taxon.make! }
    #   let( :place ) { make_place_with_geom }
    #   let( :listed_taxon ) { ListedTaxon.make!( taxon: taxon, place: place, list: place.check_list ) }
    #   let( :user ) { User.make!( place: place ) }
    #   before do
    #     expect( listed_taxon.list.place ).to eq place
    #     expect( place.taxa ).to include taxon
    #     sign_in user
    #   end
    #   it "should be chosen if it exists" do
    #     get :show, id: taxon.id
    #     expect( assigns(:place) ).to eq place
    #     expect( assigns(:listed_taxon) ).to eq listed_taxon
    #   end
    #   it "should not be chosen if it does not exist" do
    #     user.update_attributes( place: Place.make! )
    #     get :show, id: taxon.id
    #     expect( assigns(:place) ).to eq user.place
    #     expect( assigns(:listed_taxon) ).to be_blank
    #   end
    #   it "should not be chosen if one exists but it's absent" do
    #     listed_taxon.update_attributes( occurrence_status_level: ListedTaxon::ABSENT )
    #     get :show, id: taxon.id
    #     expect( assigns(:place) ).to eq place
    #     expect( assigns(:listed_taxon) ).to be_blank
    #   end
    # end

  end

  describe "merge" do
    it "should redirect on succesfully merging" 


    it "should allow curators to merge taxa they created" 


    it "should not allow curators to merge taxa they didn't create" 


    it "should allow curators to merge synonyms" 


    it "should not allow curators to merge unsynonymous taxa" 


    it "should allow curators to merge taxa without observations" 


    it "should allow admins to merge anything" 


    describe "routes" do
      let(:taxon) { Taxon.make! }
      before do
        sign_in make_curator
      end
      it "should accept GET requests" 

      it "should accept POST requests" 

    end
  end

  describe "destroy" do
    it "should be possible if user did create the record" 


    it "should not be possible if user did not create the record" 


    it "should always be possible for admins" 


    it "should not be possible for taxa inolved in taxon changes" 

  end
  
  describe "update" do
    it "should allow curators to supercede locking" 

  end

  describe "autocomplete" do
    before(:each) { enable_elastic_indexing([ Taxon ]) }
    after(:each) { disable_elastic_indexing([ Taxon ]) }
    it "should choose exact matches" 

  end
  
  describe "search" do
    before(:each) { enable_elastic_indexing([ Taxon ]) }
    after(:each) { disable_elastic_indexing([ Taxon ]) }
    render_views
    it "should find a taxon by name" 

    it "should not raise an exception with an invalid per page value" 

  end

  describe "observation_photos" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    it "should include photos from observations" 


    it "should return photos of an exact taxon match even if there are lots of text matches" 

  end

  describe "graft" do
    it "should graft a taxon" 

  end

end

