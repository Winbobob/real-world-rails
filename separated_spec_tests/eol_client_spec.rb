require File.dirname(__FILE__) + '/../../../spec_helper'

describe EOL::Sparql::Client do
  before(:all) do
    load_foundation_cache
    @taxon_concept = build_taxon_concept(:comments => [], :toc =>[], :bhl => [], :images => [], :sounds => [], :youtube => [], :flash => [])
    @client = EOL::Sparql::Client.new
  end

  describe "#cache_key" do
    it "uses underscores to cache names" 

  end

  describe "#clade_cache_key" do
    it "adds id to name" 

  end

  describe '#clear_uri_caches' do

    let(:caches) {
      { all_measurement_type_uris: "har",
        all_measurement_type_known_uris: "hee",
        cached_taxon_1: 100,
        cached_taxon_2: 200,
        cached_taxon_3: 300
      }
    }

    before do
      caches.each do |key, val|
        Rails.cache.write(
          EOL::Sparql::Client.cache_key(key), val)
      end
      Rails.cache.write(
        EOL::Sparql::Client.clade_cache_key(caches[:cached_taxon_1]), "foo")
      Rails.cache.write(
        EOL::Sparql::Client.clade_cache_key(caches[:cached_taxon_2]), "bar")
      Rails.cache.write(
        EOL::Sparql::Client.clade_cache_key(caches[:cached_taxon_3]), "baz")
    end

    it 'removes some data cached from Virtuoso' 

  end

  describe '#initialize' do
    it 'creates an instance' 

  end

  describe '#insert_data' do
    it 'requires insert_data to be implemented in a child class' 

  end

  describe '#delete_data' do
    it 'deletes data when there is a graph_name and data' 


    it 'does not delete data when there is no graph_name' 


    it 'does not delete data when there is no data' 

  end

end

