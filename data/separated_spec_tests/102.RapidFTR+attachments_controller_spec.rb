require 'spec_helper'

describe AttachmentsController, :type => :controller do

  before do
    fake_login
    mock_user = double(:organisation => 'UNICEF')
    allow(User).to receive(:find_by_user_name).with(anything).and_return(mock_user)
    allow(controller).to receive(:set_locale)
  end

  it 'should have restful route for GET' 


  it 'should return correct response corresponding to created photo' 


  it 'should return correct photo content type that is older than the current one' 


  it 'should return correct photo size that is older than the current one' 

end

