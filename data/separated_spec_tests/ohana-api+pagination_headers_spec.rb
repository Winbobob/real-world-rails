require 'rails_helper'

describe 'Pagination Headers' do
  before(:each) do
    @prefix = api_search_index_url(subdomain: ENV['API_SUBDOMAIN'])
  end

  context 'when on page 1 of 2' do
    before(:all) do
      create(:location)
      create(:nearby_loc)
    end

    before(:each) do
      get api_search_index_url(
        keyword: 'jobs', per_page: 1, subdomain: ENV['API_SUBDOMAIN']
      )
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'returns a 200 status' 


    it 'returns a Link header' 


    it 'returns an X-Total-Count header' 

  end

  context 'when on page 2 of 2' do
    before(:all) do
      create(:location)
      create(:nearby_loc)
    end

    before(:each) do
      get api_search_index_url(
        keyword: 'jobs', page: 2, per_page: 1, subdomain: ENV['API_SUBDOMAIN']
      )
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'returns a Link header' 

  end

  context 'when on page 2 of 3' do
    before(:all) do
      create(:location)
      create(:nearby_loc)
      create(:farmers_market_loc)
    end

    before(:each) do
      get api_search_index_url(
        keyword: 'jobs', page: 2, per_page: 1, subdomain: ENV['API_SUBDOMAIN']
      )
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'returns a Link header' 

  end

  context 'when on page higher than max' do
    before(:all) do
      create(:location)
      create(:nearby_loc)
      create(:far_loc)
    end

    before(:each) do
      get api_search_index_url(
        keyword: 'vrs', page: 3, subdomain: ENV['API_SUBDOMAIN']
      )
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'sets previous page to last page with results' 

  end

  context 'when there is only one page of search results' do
    it 'does not return a Link header' 

  end

  context 'when there are no search results' do
    it 'returns one rel=last link with page=0' 

  end

  context 'when visiting a location' do
    it 'does not return a Link header' 

  end

  context 'when there is only one location' do
    it 'does not return a Link header' 

  end
end

