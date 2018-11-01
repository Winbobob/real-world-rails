require 'rails_helper'

describe 'POST /locations/:location_id/contacts' do
  before(:all) do
    @loc = create(:location)
  end

  before(:each) do
    @contact_attributes = { name: 'Moncef', title: 'Consultant' }
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  it 'creates a contact with valid attributes' 


  it "doesn't create a contact with invalid attributes" 


  it "doesn't allow creating a contact without a valid token" 


  it 'creates a second contact for the specified location' 

end

