require File.dirname(__FILE__) + '/../../../spec_helper'

describe EOL::Sparql::SearchQueryBuilder do
  before(:all) do
    load_foundation_cache
    @taxon_concept = build_taxon_concept(:comments => [], :bhl => [], :toc => [], :images => [], :sounds => [], :youtube => [], :flash => [])
  end

  describe '#initialize' do
    it 'should initialize from an array' 


    it 'should set default paging values' 

  end

  describe '#build_query' do
    it 'should assemble queries' 

  end

  describe '#prepare_search_query' do
    it 'creates a count query' 


    it 'selects the list of fields we want' 


    it 'searches with expected conditions' 


    it 'filters on taxon' 


    it 'counts occurrences of values' 


    it 'sorts ascending' 


    it 'sorts descending' 


    it 'filters on min value' 


    it 'filters on max value' 


    it 'filters on exact numeric values' 


    it 'filters on known uris' 


    it 'filters on units' 

  end

  # it '#prepare_search_query should filter by regex by default'
  # it 'should not search clades that are too large'

end

