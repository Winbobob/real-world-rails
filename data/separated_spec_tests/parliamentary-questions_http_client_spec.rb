require 'feature_helper'

describe HTTPClient do
  let(:default_settings) {[ 
      Settings.pq_rest_api.host,
      'username',
      'password',
      File.expand_path('resources/certs/wqa.parliament.uk.pem', __dir__)
  ]}

  let(:client)      { HTTPClient.new(*default_settings)                  }

  context 'issuing requests' do
    it 'should send a get request to the server' 


    it 'should create a put request' 


    it 'the put request can accept a request body as input' 

  end

  context 'authentication' do
    it 'should authenticate based on credentials provided' 


    it 'should not verify SSL certificate when handling HTTP' 

  end
end

