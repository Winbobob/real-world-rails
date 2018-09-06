# -*- encoding : utf-8 -*-
require 'spec_helper'

describe TypeaheadSearch do
  let(:options){ { :model => InfoRequestEvent } }

  describe "#initialize" do

    it 'assigns the query' 


    it 'assigns the model' 


    it 'assigns the page' 


    it 'defaults to page 1 if no page value is passed' 


    it 'assigns per_page' 


    it 'defaults to 25 per_page if no per_page value is passed' 


    it 'sets wildcard to true' 


    it 'sets run_search to true' 


  end

  describe '#options' do

    it 'sets the offset based on the page and per_page settings' 


    it 'sets collapse_by_prefix to "request_collapse" for InfoRequestEvent queries' 


    it 'sets collapse_by_prefix to nil for PublicBody queries' 


    it 'sets the limit to the per_page setting' 


    it 'sets the model' 


    it 'sets wildcard to true by default' 


    it 'sets sort_by_prefix to nil' 


    it 'sets sort_by_ascending to true' 


  end

  describe "#xapian_search" do

    before do
      get_fixtures_xapian_index
    end

    def search_info_requests(xapian_search)
      xapian_search.results.map{ |result| result[:model].info_request }
    end

    def search_bodies(xapian_search)
      xapian_search.results.map{ |result| result[:model] }
    end

    it "returns nil for the empty query string" 


    it "returns a search with results of the appropriate model type" 


    it "returns results matching the given keywords in any of their locales" 


    it "returns a search with results matching the given keyword" 


    it "returns a search with results matching any of the given keywords" 


    it "returns nil for short words" 


    it "returns a search with matches for complete words followed by a space" 



    it "returns a search with matches for the complete words in
        searches ending in short words" do
      search = TypeaheadSearch.new("chicken a", options).xapian_search
      expect(search_info_requests(search)).
        to match_array([info_requests(:naughty_chicken_request)])
    end


    it "returns a search with matches for the complete words and partial words in
        searches ending in longer words" do
      search = TypeaheadSearch.new("dog chick", options).xapian_search
      expect(search_info_requests(search)).
        to match_array([info_requests(:naughty_chicken_request),
                        info_requests(:fancy_dog_request)])
    end

    it "returns a search with partial matches for longer words" 


    it 'returns an "OR" search when query includes a standalone hyphen' 


    it 'returns an "OR" search when query includes an ampersand' 


    it 'returns an "OR" search when query includes a mismatched bracket' 


    it 'returns an "OR" search when query includes a standalone wildcard symbol' 


    it 'returns an "OR" search when query includes a standalone tilde symbol' 


    it "returns a search excluding results from a valid negation operator" 


    context 'when the exclude_tags option is used' do

      it "returns a search excluding results with those tags" 


    end
  end
end


