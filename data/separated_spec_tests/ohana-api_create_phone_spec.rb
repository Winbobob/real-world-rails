require 'rails_helper'

describe 'POST /locations/:location_id/contacts/:contact_id/phones' do
  before(:all) do
    @loc = create(:location)
    @contact = @loc.contacts.create!(attributes_for(:contact))
  end

  before(:each) do
    @phone_attributes = { number: '123-456-7890', number_type: 'voice' }
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  it 'creates a phone with valid attributes' 


  it 'only creates a phone for the contact, not the location' 


  it "doesn't create a phone with invalid attributes" 


  it "doesn't allow creating a phone without a valid token" 


  it 'creates a second phone for the specified contact' 

end

