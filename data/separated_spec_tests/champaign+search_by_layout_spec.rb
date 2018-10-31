# frozen_string_literal: true
require 'rails_helper'
require_relative '../page_searcher_spec_data.rb'

describe 'Search ::' do
  describe 'PageSearcher' do
    context 'searches by single criterion,' do
      context 'by layout' do
        include_context 'page_searcher_spec_data'
        let(:layout_searcher) { Search::PageSearcher.new(layout: [layout.id]) }

        it 'finds a page that contains the specified liquid layout' 


        describe 'returns all pages unfiltered when searching' do
          describe 'returns all pages when searching' do
            it 'with an empty array' 

            it 'with nil' 


            it 'with an empty string' 

          end
        end

        describe 'returns no pages when searching' do
          it 'with a non-existent layout' 

          it 'with an unused layout' 

        end

        describe 'returns one page when searching' do
          it 'with a layout that only one page belongs to' 

        end

        describe 'returns some pages when searching' do
          it 'with a used layout and an unused layout' 

        end

        describe 'returns multiple pages when searching' do
          it 'with mutiple layouts that different pages belong to' 

          it 'with a layout that several pages belong to' 

        end
      end
    end
  end
end

