require 'rails_helper'

describe 'DELETE /locations/:location_id/contacts/:id' do
  before(:all) do
    @loc = create(:location)
    @contact = @loc.contacts.create!(attributes_for(:contact))
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  it 'deletes the contact' 


  it 'returns a 204 status' 


  it "doesn't allow deleting a contact without a valid token" 

end

