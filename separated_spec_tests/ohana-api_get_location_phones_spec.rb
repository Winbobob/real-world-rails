require 'rails_helper'

describe 'GET /locations/:location_id/phones' do
  context 'when location has phones' do
    before :all do
      @loc = create(:location)
      @first_phone = @loc.phones.create!(attributes_for(:phone))
    end

    before :each do
      get api_location_phones_url(@loc, subdomain: ENV['API_SUBDOMAIN'])
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'returns a 200 status' 


    it 'includes the id attribute in the serialization' 


    it 'includes the number attribute in the serialization' 


    it 'includes the department attribute in the serialization' 


    it 'includes the extension attribute in the serialization' 


    it 'includes the number_type attribute in the serialization' 


    it 'includes the vanity_number attribute in the serialization' 

  end

  context "when location doesn't have phones" do
    before :all do
      @loc = create(:location)
    end

    before :each do
      get api_location_phones_url(@loc, subdomain: ENV['API_SUBDOMAIN'])
    end

    after(:all) do
      Organization.find_each(&:destroy)
    end

    it 'returns an empty array' 


    it 'returns a 200 status' 

  end
end

