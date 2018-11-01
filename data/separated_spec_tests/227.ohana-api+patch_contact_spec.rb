require 'rails_helper'

describe 'PATCH contact' do
  before(:all) do
    @loc = create(:location)
    @contact = @loc.contacts.create!(attributes_for(:contact))
  end

  before(:each) do
    @attrs = { name: 'Moncef', title: 'Consultant', email: 'bar@foo.com' }
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  describe 'PATCH /locations/:location_id/contacts/:id' do
    it 'returns 200 when validations pass' 


    it 'returns the updated contact when validations pass' 


    it "updates the location's contact" 


    it "doesn't add a new contact" 


    it 'requires a valid contact id' 


    it 'returns 422 when attribute is invalid' 


    it "doesn't allow updating a contact without a valid token" 

  end
end

