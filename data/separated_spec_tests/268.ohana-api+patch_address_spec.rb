require 'rails_helper'

describe 'PATCH address' do
  before(:each) do
    @loc = create(:location)
    @address = @loc.address
    @attrs = { address_1: '1236 Broadway', address_2: 'Apt 101',
               city: 'Burlingame', state_province: 'CA', postal_code: '94010',
               country: 'US' }
  end

  describe 'PATCH /locations/:location_id/address/:id' do
    it 'returns 200 when validations pass' 


    it "updates the location's address" 


    it "updates the location's coordinates when the address has changed" 


    it "doesn't update location's coordinates when address hasn't changed" 


    it "doesn't add a new address" 


    it 'requires a valid address id' 


    it 'returns 422 when attribute is invalid' 


    it "doesn't allow updating a address without a valid token" 

  end
end

