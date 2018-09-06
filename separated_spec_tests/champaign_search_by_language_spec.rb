# frozen_string_literal: true
require 'rails_helper'
require_relative '../page_searcher_spec_data.rb'

describe 'Search ::' do
  describe 'PageSearcher' do
    context 'searches by single criterion,' do
      context 'by language' do
        include_context 'page_searcher_spec_data'
        let(:language_searcher) { Search::PageSearcher.new(language: [language.id]) }
        it 'finds only the page that corresponds to the specified language' 

        describe 'returns all pages unfiltered when searching' do
          describe 'returns all pages when searching' do
            it 'with an empty array' 

            it 'with nil' 


            it 'with an empty string' 

          end
        end

        describe 'returns no pages when searching' do
          it 'with a non-existent language' 

          it 'with an unused language' 

        end

        describe 'returns one page when searching' do
          it 'with a language that only one page belongs to' 

        end

        describe 'returns some pages when searching' do
          it 'with a used language and an unused language' 

        end

        describe 'returns multiple pages when searching' do
          it 'with mutiple languages that different pages belong to' 

          it 'with a language that several pages belong to' 

        end
      end
    end
  end
end

