require 'spec_helper'

describe 'AOTokenFilter' do

  before(:each) do
    @token_service = TokenService.new
  end

  describe '.validate_token' do
    it 'the filter should say no access if you dont have a valid token' 


    it 'the filter should pass if you have a valid token' 



    it 'the filter should fail if the token is expired' 


    it 'the filter should say no access if you provide empty token' 


    it 'the filter should say no access if you provide empty entity' 

      

    it 'the filter should say no access if you have a are in the wrong path' 

  end


  describe '.before' do

    let(:controller)      { double('controller') }
    let(:user)            { double(User) }
    let(:request)         { double('request') }

    it 'should not write an error log if valid' 



    it 'should write an error log if invalid' 


    it 'should write an error log if expired' 

  end

end


def set_logging_expectations
  allow(controller).to receive(:env).and_return( 
    { 
      'REQUEST_URI' => 'http://pq.com/uri',
      'REQUEST_PATH' => '/assignment/uin-999',
    } 
  )
  allow(controller).to receive(:current_user).and_return(user)
  expect(user).to receive(:name).and_return('Joe Blow')
  expect(controller).to receive(:request).and_return(request)
  expect(request).to receive(:referer).and_return('http://pq.com/referer')
end

