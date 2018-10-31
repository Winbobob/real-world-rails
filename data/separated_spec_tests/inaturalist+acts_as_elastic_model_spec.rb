require "spec_helper"

describe ActsAsElasticModel do

  before(:each) { enable_elastic_indexing([ Observation, Taxon, Identification ]) }
  after(:each) { disable_elastic_indexing([ Observation, Taxon, Identification ]) }

  describe "callbacks" do
    it "properly indexes the document on create" 


    it "properly deletes the document on destroy" 


    it "properly deletes the document on commit" 

  end

  describe "class methods" do
    describe "elastic_search" do
      it "searches for bool: { } as a wildcard query" 


      it "adds matches to the query" 


      it "adds terms matches to the query" 


      it "adds envelope filters" 


      it "adds sorts to the query" 


      it "allows certain fields to be specified" 


      it "adds aggregations to the query" 

    end

    describe "elastic_paginate" do
      it "returns a WillPaginate collection" 

    end

    describe "elastic_index!" do
      it "indexes instances of a class" 


      it "accepts a scope" 


      it "accepts an array of ids" 


      it "calls prepare_batch_for_index if it exists" 


      it "exceptions are caught silently" 


      it "sets last_index_at for Observations" 

    end

    describe "elastic_delete!" do
      it "deletes instances of a class from ES" 

    end

    describe "result_to_will_paginate_collection" do
      it "returns an empty WillPaginate Collection on errors" 

    end
  end

  describe "instance methods" do
    describe "elastic_index!" do
      it "indexes the instance" 


      it "exceptions are caught silently" 


      it "sets last_index_at for Observations" 

    end

  end

end

