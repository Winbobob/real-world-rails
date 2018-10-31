RSpec.describe OAuth2::Strategy::Implicit do
  subject { client.implicit }

  let(:client) { OAuth2::Client.new('abc', 'def', :site => 'http://api.example.com') }

  describe '#authorize_url' do
    it 'includes the client_id' 


    it 'includes the type' 


    it 'includes passed in options' 

  end

  describe '#get_token' do
    it 'raises NotImplementedError' 

  end
end

