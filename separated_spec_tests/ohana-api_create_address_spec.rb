require 'rails_helper'

describe 'POST /locations/:location_id/address' do
  context 'when location does not already have an address' do
    before(:all) do
      @loc = create(:no_address)
    end

    before(:each) do
      @attrs = { address_1: 'foo', city: 'bar', state_province: 'CA',
                 postal_code: '90210', country: 'US' }
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'creates an address with valid attributes' 


    it 'creates the address for the right location' 


    it "doesn't create an address with invalid attributes" 


    it "doesn't allow creating a address without a valid token" 

  end

  context 'when location already has an address' do
    before(:all) do
      @loc = create(:location)
    end

    before(:each) do
      @attrs = { address_1: 'foo', city: 'bar', state_province: 'CA',
                 postal_code: '90210', country: 'US' }
      post api_location_address_index_url(@loc, subdomain: ENV['API_SUBDOMAIN']), @attrs
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it "doesn't create a new address if one already exists" 


    it "does not change the location's current address" 

  end
end

