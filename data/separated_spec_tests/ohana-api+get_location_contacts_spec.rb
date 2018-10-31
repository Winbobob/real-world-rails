require 'rails_helper'

describe 'GET /locations/:location_id/contacts' do
  context 'when location has contacts' do
    before :all do
      @loc = create(:location)
      @first_contact = @loc.contacts.
                       create!(attributes_for(:contact_with_extra_whitespace))
    end

    before :each do
      get api_location_contacts_url(@loc, subdomain: ENV['API_SUBDOMAIN'])
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'returns a 200 status' 


    it 'includes the id attribute in the serialization' 


    it 'includes the name attribute in the serialization' 


    it 'includes the title attribute in the serialization' 


    it 'includes the email attribute in the serialization' 


    it 'includes the department attribute in the serialization' 


    it 'includes the phones attribute in the serialization' 

  end

  context "when location doesn't have contacts" do
    before :all do
      @loc = create(:location)
    end

    before :each do
      get api_location_contacts_url(@loc, subdomain: ENV['API_SUBDOMAIN'])
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'returns an empty array' 


    it 'returns a 200 status' 

  end
end

