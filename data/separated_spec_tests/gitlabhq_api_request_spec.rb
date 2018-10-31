describe QA::Runtime::API::Request do
  include Support::StubENV

  before do
    stub_env('PERSONAL_ACCESS_TOKEN', 'a_token')
  end

  let(:client)  { QA::Runtime::API::Client.new('http://example.com') }
  let(:request) { described_class.new(client, '/users') }

  describe '#url' do
    it 'returns the full api request url' 

  end

  describe '#request_path' do
    it 'prepends the api path' 


    it 'adds the personal access token' 


    it 'adds the oauth access token' 


    it 'respects query parameters' 


    it 'uses a different api version' 

  end
end

