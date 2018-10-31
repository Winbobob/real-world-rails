require 'rails_helper'

describe 'GET /organizations/:organization_id/locations' do
  context 'when organization has locations' do
    before :all do
      @org = create(:organization)
      attrs = {
        accessibility: %w[restroom],
        admin_emails: %w[foo@bar.com],
        description: 'testing 1 2 3',
        email: 'foo@bar.com',
        languages: %w[french arabic],
        latitude: 37.583939,
        longitude: -122.3715745,
        name: 'new location',
        short_desc: 'short_desc',
        transportation: 'BART stops 1 block away',
        website: 'http://monfresh.com',
        address_attributes: attributes_for(:address)
      }
      @location = @org.locations.create!(attrs)
      @location.contacts.create!(attributes_for(:contact))
      @location.phones.create!(attributes_for(:phone))
      @location.contacts.create!(attributes_for(:contact))
      @location.services.create!(attributes_for(:service))
      @location.create_mail_address!(attributes_for(:mail_address))

      get api_org_locations_url(@org, subdomain: ENV['API_SUBDOMAIN'])
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'returns a 200 status' 


    it 'includes the location id attribute in the serialization' 


    it 'includes the location name attribute in the serialization' 


    it 'includes the location description attribute in the serialization' 


    it 'includes the location short_desc attribute in the serialization' 


    it 'includes the location latitude attribute in the serialization' 


    it 'includes the location longitude attribute in the serialization' 


    it 'includes the location slug attribute in the serialization' 


    it 'includes the location address attribute in the serialization' 


    it 'includes the location updated_at attribute in the serialization' 


    it 'includes the location organization attribute in the serialization' 


    it 'includes the location url attribute in the serialization' 


    it "doesn't include the location accessibility attribute" 


    it 'includes the location admin_emails attribute' 


    it 'includes the location coordinates attribute' 


    it "doesn't include the location email attribute" 


    it "doesn't include the location hours attribute" 


    it "doesn't include the location languages attribute" 


    it "doesn't include the location mail_address attribute" 


    it "doesn't include the location transportation attribute" 


    it 'includes the location website attribute' 


    it "doesn't include the location contacts attribute" 


    it 'includes the location phones attribute' 


    it "doesn't include the location services attribute" 

  end

  context "when organization doesn't have locations" do
    before :each do
      org = create(:organization)
      get api_org_locations_url(org, subdomain: ENV['API_SUBDOMAIN'])
    end

    it 'returns an empty array' 


    it 'returns a 200 status' 

  end
end

