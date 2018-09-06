require 'rails_helper'

describe 'GET /organizations' do
  it 'returns an empty array when no organizations exist' 


  context 'when more than one location exists' do
    before(:all) do
      create(:organization)
      create(:food_pantry)
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'returns the correct number of existing organizations' 


    it 'sorts results by id descending' 


    it 'responds to pagination parameters' 

  end

  describe 'serializations' do
    before(:all) do
      location = create(:location)
      @org = location.organization
    end

    before(:each) do
      @org.reload
      get api_organizations_url(subdomain: ENV['API_SUBDOMAIN'])
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'returns the org id' 


    it 'returns the org name' 


    it 'returns the org slug' 


    it 'includes the correct url attribute' 


    it 'includes the correct locations_url attribute' 


    context 'with nil fields' do
      before(:each) do
        @loc = create(:loc_with_nil_fields)
      end

      it 'returns nil fields within Organization' 

    end
  end
end

