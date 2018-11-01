require 'rails_helper'

describe 'Create a location (POST /organizations/:organization_id/locations/)' do
  before(:all) do
    @org = create(:organization)
  end

  before(:each) do
    @location_attributes = {
      name: 'new location',
      description: 'description',
      address_attributes: {
        address_1: 'main', city: 'utopia', state_province: 'CA', postal_code: '12345',
        country: 'US'
      }
    }
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  it 'creates a location with valid attributes' 


  it 'returns a limited payload after creation' 


  it 'returns a Location header with the URL to the new location' 


  it "doesn't create a location with invalid attributes" 


  it "doesn't allow creating a location without a valid token" 

end

