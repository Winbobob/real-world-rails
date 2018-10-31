require 'rails_helper'

describe 'DELETE /locations/:location_id/services/:id' do
  before :all do
    create_service
  end

  before :each do
    delete api_location_service_url(@location, @service, subdomain: ENV['API_SUBDOMAIN']), {}
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  it 'returns a 204 status' 


  it 'deletes the service' 


  it 'updates the search index' 

end

describe 'with an invalid token' do
  before :each do
    create_service
    delete(
      api_location_service_url(@location, @service, subdomain: ENV['API_SUBDOMAIN']),
      {},
      'HTTP_X_API_TOKEN' => 'foo'
    )
  end

  it "doesn't allow deleting a location without a valid token" 

end

