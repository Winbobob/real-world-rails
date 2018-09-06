require 'rails_helper'

describe 'CORS Preflight Request via OPTIONS HTTP method' do
  context 'when ORIGIN is specified and resource is allowed' do
    before :each do
      process(
        :options,
        api_organizations_url(subdomain: ENV['API_SUBDOMAIN']),
        params: {},
        headers: {
          'HTTP_ORIGIN' => 'http://cors.example.com',
          'HTTP_ACCESS_CONTROL_REQUEST_HEADERS' => 'Content-Type',
          'HTTP_ACCESS_CONTROL_REQUEST_METHOD' => 'GET'
        }
      )
    end

    it 'returns a 200 status with no content' 


    it 'does not reflect the Origin header in the request' 


    it 'sets Access-Control-Allow-Methods to the whitelisted methods' 


    it 'returns the Access-Control-Max-Age header' 


    it 'does not return the Access-Control-Allow-Credentials header' 


    it 'returns the Access-Control-Allow-Headers header' 


    it 'only exposes the Etag, Last-Modified, Link and X-Total-Count headers' 


    it 'allows access to the locations endpoint' 


    it 'allows access to a specific location' 


    it 'allows access to a specific organization' 


    it 'allows access to the search endpoint' 


    it 'does not allow access to non-whitelisted endpoints' 

  end

  context 'when request is not a valid preflight request' do
    before(:each) do
      process(
        :options,
        api_organizations_url(subdomain: ENV['API_SUBDOMAIN']),
        params: {},
        headers: {
          'HTTP_ORIGIN' => 'http://cors.example.com'
        }
      )
    end

    it 'returns a 204 status with no content' 


    # Disabled temporarily until this bug is fixed in rack-cors:
    # https://github.com/cyu/rack-cors/issues/58
    xit 'does not include CORS headers' do
      expect(headers.keys).not_to include('Access-Control-Allow-Origin')
    end
  end
end

describe 'CORS REQUESTS - POST and GET' do
  context 'when ORIGIN is specified' do
    before :each do
      post api_organizations_url(subdomain: ENV['API_SUBDOMAIN']),
           { name: 'foo', description: 'test' },
           'HTTP_ACCEPT' => 'application/vnd.ohanapi+json; version=1',
           'HTTP_ORIGIN' => 'http://ohanapi.org', 'HTTP_USER_AGENT' => 'Rspec'
    end

    it 'returns a 201 status' 


    it 'does not reflect the Origin header in the request' 


    it 'sets Access-Control-Allow-Methods to the whitelisted methods' 


    it 'returns the Access-Control-Max-Age header' 


    it 'does not return the Access-Control-Allow-Credentials header' 


    it 'only exposes the Etag, Last-Modified, Link and X-Total-Count headers' 


    it "doesn't allow updating a location without a valid token" 

  end

  context 'when ORIGIN is not specified' do
    it 'does not include CORS headers when ORIGIN is not specified' 

  end

  context 'when ORIGIN is specified and path is invalid' do
    before :each do
      get api_location_url(123, subdomain: ENV['API_SUBDOMAIN']),
          {}, 'HTTP_ORIGIN' => 'http://ohanapi.org'
    end

    it 'returns a 404 status' 


    it 'does not reflect the Origin header in the request' 

  end
end

