require 'rails_helper'

describe 'DELETE /locations/:location/address/:id' do
  before(:all) do
    @loc = create(:location)
  end

  before(:each) do
    @loc.reload
    @address = @loc.address
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  it 'deletes the address when the location is virtual' 


  it 'returns a 204 status' 


  it "doesn't allow deleting an address without a valid token" 


  it "doesn't delete the address if the location is not virtual" 


  it "doesn't delete the address if the location & address IDs don't match" 

end

