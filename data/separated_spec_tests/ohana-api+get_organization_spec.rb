require 'rails_helper'

describe 'GET /organizations/:id' do
  context 'with valid id' do
    before :all do
      @org = create(:location).organization
    end

    before :each do
      get api_organization_url(@org, subdomain: ENV['API_SUBDOMAIN'])
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'includes the organization id' 


    it 'includes the name attribute' 


    it 'includes the slug attribute' 


    it 'includes the correct url attribute' 


    it 'includes the correct locations_url attribute' 


    it 'is json' 


    it 'returns a successful status code' 


    it 'includes the full representation' 

  end

  context 'with invalid id' do
    before :each do
      get api_organization_url(1, subdomain: ENV['API_SUBDOMAIN'])
    end

    it 'returns a status key equal to 404' 


    it 'returns a helpful message' 


    it 'returns a 404 status code' 


    it 'is json' 

  end

  context 'with nil fields' do
    before(:each) do
      @org = create(:organization)
    end

    it 'returns nil fields when visiting one organization' 

  end
end

