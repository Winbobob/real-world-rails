require 'spec_helper'

describe LookupGenes do
  describe '::find' do

    DummyWrapper = Struct.new(:search_terms, :matched_genes)

    def search_string
      'TURKEY'
    end

    def check_matched_gene_against_results(matched_gene)
      results = LookupGenes.find([search_string], :for_search, DummyWrapper)
      expect(results.size).to eq(1)
      expect(results.first.search_terms).to eq Array(search_string)
      expect(results.first.matched_genes.size).to eq(1)
      expect(results.first.matched_genes).to eq Array(matched_gene)
    end

    it 'should give gene name matches precedence' 


    it 'should check gene aliases last' 


    it 'should de-duplicate search terms that map to the same values' 


    it 'should wrap the results in the given class' 


    it 'should not allow an empty list of search terms' 


    it 'should handle no search terms being matched gracefully' 


    it 'should send the correct eager loading scope to the underlying model' 

  end
end

