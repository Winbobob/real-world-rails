require 'rails_helper'

describe 'DELETE /organizations/:id' do
  before :all do
    create_service
  end

  before :each do
    @org = @location.organization
    delete api_organization_url(@org, subdomain: ENV['API_SUBDOMAIN']), {}
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  it 'deletes the organization' 


  it 'returns a 204 status' 


  it 'updates the search index' 

end

describe 'with an invalid token' do
  before :each do
    create_service
    @org = @location.organization
    delete(
      api_organization_url(@org, subdomain: ENV['API_SUBDOMAIN']),
      {},
      'HTTP_X_API_TOKEN' => 'foo'
    )
  end

  it "doesn't allow deleting a location without a valid token" 

end

