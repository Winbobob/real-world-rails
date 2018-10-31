RSpec.describe OAuth2::Strategy::Password do
  subject { client.password }

  let(:client) do
    cli = OAuth2::Client.new('abc', 'def', :site => 'http://api.example.com')
    cli.connection.build do |b|
      b.adapter :test do |stub|
        stub.post('/oauth/token') do |env|
          case @mode
          when 'formencoded'
            [200, {'Content-Type' => 'application/x-www-form-urlencoded'}, 'expires_in=600&access_token=salmon&refresh_token=trout']
          when 'json'
            [200, {'Content-Type' => 'application/json'}, '{"expires_in":600,"access_token":"salmon","refresh_token":"trout"}']
          end
        end
      end
    end
    cli
  end

  describe '#authorize_url' do
    it 'raises NotImplementedError' 

  end

  %w[json formencoded].each do |mode|
    describe "#get_token (#{mode})" do
      before do
        @mode = mode
        @access = subject.get_token('username', 'password')
      end

      it 'returns AccessToken with same Client' 


      it 'returns AccessToken with #token' 


      it 'returns AccessToken with #refresh_token' 


      it 'returns AccessToken with #expires_in' 


      it 'returns AccessToken with #expires_at' 

    end
  end
end

