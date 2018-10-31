describe QA::Runtime::API::Request do
  let(:client)  { QA::Runtime::API::Client.new('http://example.com') }
  let(:request) { described_class.new(client, '/users') }

  before do
    allow(client).to receive(:personal_access_token).and_return('a_token')
  end

  describe '#url' do
    it 'returns the full API request url' 


    context 'when oauth_access_token is passed in the query string' do
      let(:request) { described_class.new(client, '/users', { oauth_access_token: 'foo' }) }

      it 'does not adds a private_token query string' 

    end
  end

  describe '#request_path' do
    it 'prepends the api path' 


    it 'adds the personal access token' 


    it 'adds the oauth access token' 


    it 'respects query parameters' 


    it 'uses a different api version' 

  end
end

