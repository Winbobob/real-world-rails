require "spec_helper"

describe Observation do
  describe "site_search_params" do
    it "filters by site unless specified" 


    it "filters by site place unless specified" 


    it "filters by site boundary unless specified" 


    it "doesn't add site filters to project queries" 

  end

  describe "get_search_params" do
    it "applies site-specific options" 


    it "doesn't apply site-specific options for certain queries" 

  end

  describe "elastic_taxon_leaf_ids" do
    before(:each) do
      enable_elastic_indexing( Observation )
      Taxon.destroy_all
      @family = Taxon.make!(name: "Hominidae", rank: "family")
      @genus = Taxon.make!(name: "Homo", rank: "genus", parent: @family)
      @sapiens = Taxon.make!(name: "Homo sapiens", rank: "species", parent: @genus)
      @habilis = Taxon.make!(name: "Homo habilis", rank: "species", parent: @genus)
      AncestryDenormalizer.truncate
      AncestryDenormalizer.denormalize
    end
    after(:each) { disable_elastic_indexing( Observation ) }

    it "returns the leaf taxon id" 

  end
end

