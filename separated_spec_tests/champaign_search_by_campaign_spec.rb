# frozen_string_literal: true
require 'rails_helper'
require_relative '../page_searcher_spec_data.rb'

describe 'Search ::' do
  describe 'PageSearcher' do
    context 'searches by single criterion,' do
      context 'by campaign' do
        include_context 'page_searcher_spec_data'
        let(:search_by_campaign) { Search::PageSearcher.new(campaign: [campaign.id]) }
        let!(:unused_campaign) { create(:campaign, name: 'unused campaign') }
        it 'searches for a page based on the campaign it belongs to' 


        describe 'returns all pages when searching' do
          it 'with an empty array' 

          it 'with nil' 


          it 'with an empty string' 

        end

        describe 'returns no pages when searching' do
          it 'with a non-existent campaign id' 

          it 'with an unused campaign id' 

        end

        describe 'returns one page when searching' do
          it 'with a campaign that only contains one page' 

        end

        describe 'returns some pages when searching' do
          it 'with a used campaign id and an unused campaign id' 

        end

        describe 'returns multiple pages when searching' do
          it 'with mutiple campaign ids that different pages belong to' 

          it 'with a campaign id that several pages belong to' 

        end
      end
    end
  end
end

