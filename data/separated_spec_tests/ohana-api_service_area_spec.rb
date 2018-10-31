require 'rails_helper'

describe "GET 'search'" do
  context 'with service_area parameter' do
    before(:each) do
      create(:nearby_loc)
      create(:farmers_market_loc)
      create_service
      @service.service_areas = ['Atherton']
      @service.save
    end

    it 'only returns locations with matching service areas' 


    it 'does not return locations when no matching service areas exist' 


    it 'allows combining service_area with other parameters' 

  end

  context 'when location has multiple services' do
    it 'does not duplicate results when all services match service_area parameter' 

  end
end

