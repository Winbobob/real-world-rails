require 'rails_helper'

describe 'DELETE /locations/:location_id/contacts/:contact_id/phones/:id' do
  before(:all) do
    @loc = create(:location)
    @contact = @loc.contacts.create!(attributes_for(:contact))
    @phone = @contact.phones.create!(attributes_for(:phone))
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  it 'deletes the phone' 


  it 'returns a 204 status' 


  it "doesn't allow deleting a phone without a valid token" 

end

