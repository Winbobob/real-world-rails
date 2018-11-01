require 'rails_helper'

describe 'PATCH mail_address' do
  before(:each) do
    @mail_address = create(:mail_address)
    @loc = @mail_address.location
    @attrs = {
      attention: 'Jane Doe',
      address_1: 'foo',
      address_2: 'apt 101',
      city: 'bar',
      state_province: 'CA',
      postal_code: '90210',
      country: 'US'
    }
  end

  describe 'PATCH /locations/:location/mail_address' do
    it 'returns 200 when validations pass' 


    it "updates the location's mail_address" 


    it "doesn't add a new mail_address" 


    it 'requires a valid mail_address id' 


    it 'returns 422 when attribute is invalid' 


    it "doesn't allow updating a mail_address without a valid token" 

  end
end

