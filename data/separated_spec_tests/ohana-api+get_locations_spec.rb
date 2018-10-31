require 'rails_helper'

describe 'GET /locations' do
  it 'returns an empty array when no locations exist' 


  context 'when more than one location exists' do
    before(:all) do
      create(:location)
      create(:nearby_loc)
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'returns the correct number of existing locations' 


    it 'sorts results by creation date descending' 


    it 'responds to pagination parameters' 

  end

  describe 'serializations' do
    before(:all) do
      @location = create(:location)
    end

    before(:each) do
      get api_locations_url(subdomain: ENV['API_SUBDOMAIN'])
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'includes the location id' 


    it 'does not include the accessibility attribute' 


    it 'includes the alternate_name attribute' 


    it 'includes the coordinates attribute' 


    it 'includes the description attribute' 


    it 'includes the latitude attribute' 


    it 'includes the longitude attribute' 


    it 'includes the name attribute' 


    it 'includes the short_desc attribute' 


    it 'includes the slug attribute' 


    it 'includes the updated_at attribute' 


    it 'includes the admin_emails attribute' 


    it 'does not include the email attribute' 


    it 'does not include the hours attribute' 


    it 'does not include the languages attribute' 


    it 'does not include the transportation attribute' 


    it 'includes the website attribute' 


    it 'includes the address association' 


    it 'does not include the mail_address association' 


    it 'does not include the contacts association' 


    it 'does not include the services association' 


    it 'includes the phones association' 


    it 'includes a summarized organization association' 


    it 'does not include contacts within Organization' 


    it 'includes the correct url attribute' 

  end

  context 'with nil fields' do
    before(:all) do
      @loc = create(:loc_with_nil_fields)
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'returns nil fields within Location' 


    it 'returns nil fields within Phones' 


    it 'returns nil fields within Organization' 

  end

  context 'when location has no physical address' do
    it 'exposes the coordinates field' 

  end

  context 'when location has no active services' do
    it 'sets the active field to false' 

  end

  context 'when location has at least one active service' do
    it 'sets the active field to true' 

  end
end

