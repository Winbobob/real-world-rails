require 'rails_helper'

describe 'GET /locations/:location_id/services' do
  context 'when location has services' do
    before :each do
      create_service
      get api_location_services_url(@location, subdomain: ENV['API_SUBDOMAIN'])
    end

    it 'returns a 200 status' 


    it 'serializes all service attributes and associations' 

  end

  context "when location doesn't have services" do
    before :each do
      loc = create(:location)
      get api_location_services_url(loc, subdomain: ENV['API_SUBDOMAIN'])
    end

    it 'returns an empty array' 


    it 'returns a 200 status' 

  end
end

