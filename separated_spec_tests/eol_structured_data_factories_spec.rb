require "spec_helper"

describe 'Structured Data Factories' do

  before(:all) do
    load_foundation_cache
    drop_all_virtuoso_graphs
    @taxon_concept = TaxonConcept.gen
    @resource = Resource.gen
  end

  describe 'Measurements' do
    before(:all) do
      @default_options = { resource: @resource, subject: @taxon_concept }
    end

    it 'should create the instance' 


    it 'should create a turle form' 


    it 'should be able to interact with the triplestore' 

  end

  describe 'Associations' do
    before(:all) do
      @target_taxon_concept = TaxonConcept.gen
      @default_options = { resource: @resource, subject: @taxon_concept, object: @target_taxon_concept }
    end

    it 'should create the instance' 


    it 'should create a turtle form' 


    it 'should be able to interact with the triplestore' 

  end

end

