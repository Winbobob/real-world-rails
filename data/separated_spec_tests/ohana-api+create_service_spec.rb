require 'rails_helper'

describe 'POST /locations/:location_id/services' do
  before(:all) do
    @loc = create(:location)
  end

  before(:each) do
    @service_attributes = {
      name: 'test service',
      description: 'test description',
      status: 'active'
    }
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  it 'creates a service with valid attributes' 


  it "doesn't create a service with invalid attributes" 


  it "doesn't allow creating a service without a valid token" 

end

