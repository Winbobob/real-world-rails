# frozen_string_literal: true
require 'rails_helper'
require_relative '../page_searcher_spec_data.rb'

describe 'Search ::' do
  describe 'PageSearcher' do
    context 'searches by single criterion,' do
      context 'ordering' do
        include_context 'page_searcher_spec_data'
        let(:page_searcher) { Search::PageSearcher }

        it 'orders searches based on creation date' 

        it 'orders searches based on update date' 


        it 'orders searches based on title' 


        it 'orders searches based on featured' 


        it 'orders searches based on publish_status' 


        it 'ignores invalid order_by_queries' 

      end
    end
  end
end

