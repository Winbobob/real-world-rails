require 'rails_helper'

describe 'DELETE /locations/:location_id/mail_address/:id' do
  before(:each) do
    @mail_address = create(:mail_address)
    @loc = @mail_address.location
  end

  it 'deletes the mail_address' 


  it 'returns a 204 status' 


  it "doesn't allow deleting an mail_address without a valid token" 


  it "doesn't delete the mail_address if the location & mail_address IDs don't match" 

end

