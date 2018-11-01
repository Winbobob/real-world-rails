require 'rails_helper'

describe 'DELETE /locations/:location_id/phones/:id' do
  before(:all) do
    @loc = create(:location)
    @phone = @loc.phones.create!(attributes_for(:phone))
  end

  after(:all) do
    Organization.find_each(&:destroy)
  end

  it 'deletes the phone' 


  it 'returns a 204 status' 


  it "doesn't allow deleting a phone without a valid token" 

end

