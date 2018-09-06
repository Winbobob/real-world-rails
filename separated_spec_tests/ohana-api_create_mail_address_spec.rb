require 'rails_helper'

describe 'POST /locations/:location_id/mail_address' do
  context 'when location does not already have an mail_address' do
    before(:all) do
      @loc = create(:nearby_loc)
    end

    before(:each) do
      @attrs = { address_1: 'foo', city: 'bar', state_province: 'CA',
                 postal_code: '90210', country: 'US' }
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'creates an mail_address with valid attributes' 


    it 'creates the mail_address for the right location' 


    it "doesn't create an mail_address with invalid attributes" 


    it "doesn't allow creating a mail_address without a valid token" 

  end

  context 'when location already has a mail_address' do
    before(:each) do
      @loc = create(:mail_address).location
      @attrs = { address_1: 'foo', city: 'bar', state_province: 'CA',
                 postal_code: '90210', country: 'US' }

      post(
        api_location_mail_address_index_url(@loc, subdomain: ENV['API_SUBDOMAIN']),
        @attrs
      )
    end

    it "doesn't create a new mail_address if one already exists" 


    it "doesn't change the location's current mail_address" 

  end
end

