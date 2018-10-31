require 'rails_helper'

describe 'PATCH Contact phone' do
  before(:all) do
    @location = create(:location)
    @contact = @location.contacts.create!(attributes_for(:contact))
    @phone = @contact.phones.create!(attributes_for(:phone))
  end

  before(:each) do
    @attrs = { number: '123-456-7890', number_type: 'fax' }
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  describe 'PATCH /locations/:location_id/contacts/:contact_id/phones/:id' do
    it 'returns 200 when validations pass' 


    it 'returns the updated phone when validations pass' 


    it "updates the contact's phone" 


    it "doesn't add a new phone" 


    it 'requires a valid phone id' 


    it 'returns 422 when attribute is invalid' 


    it "doesn't allow updating a phone without a valid token" 

  end
end

