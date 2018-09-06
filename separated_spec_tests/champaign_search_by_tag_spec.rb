# frozen_string_literal: true
require 'rails_helper'
require_relative '../page_searcher_spec_data.rb'

describe 'Search ::' do
  describe 'PageSearcher' do
    context 'searches by single criterion,' do
      context 'by tag' do
        include_context 'page_searcher_spec_data'
        let!(:has_many_tags) do
          create(:page,
                 title: 'a very taggy page',
                 tags: [alternative_tag, the_best_tag])
        end
        let!(:intersection_page_1) do
          create(:page,
                 title: 'has one same tag as intersection page 2',
                 slug:  'has-same-page-2',
                 tags:  [tag1, tag2, tag3, tag4])
        end

        let!(:intersection_page_2) do
          create(:page,
                 title: 'has one same tag as intersection page 1',
                 slug:  'has-same-page-1',
                 tags:  [tag3, tag4, tag5])
        end
        let(:tag_searcher) { Search::PageSearcher.new(tags: [tag.id]) }

        it 'searches for a page based on the tags on that page' 


        describe 'does not filter by tag when searching' do
          it 'with an empty tag array' 

          it 'with tag array set to nil' 

          it 'with an empty string' 

        end
        describe 'does not return any pages when searching' do
          it 'with a non-existent tag id' 

          it 'with an unused tag' 

          it 'with a used tag and an unused tag' 


          it 'with two used tags never used on the same page' 

        end

        describe 'returns one page when searching' do
          it "with a tag that's only assigned to that page" 


          it "with one of that page's several tags" 


          it "with multiple of that page's tags in any order" 


          it 'with a tag that matches two pages and a tag that matches one page' 

        end

        describe 'returns multiple pages when searching' do
          it 'with a tag as the only tag of both pages' 

          it 'with a tag used as one of several on both pages' 

          it 'with multiple tags used as one of several on both pages' 

        end
      end
    end
  end
end

