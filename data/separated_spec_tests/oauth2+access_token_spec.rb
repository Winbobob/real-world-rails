RSpec.describe AccessToken do
  subject { described_class.new(client, token) }

  let(:token) { 'monkey' }
  let(:refresh_body) { MultiJson.encode(:access_token => 'refreshed_foo', :expires_in => 600, :refresh_token => 'refresh_bar') }
  let(:client) do
    Client.new('abc', 'def', :site => 'https://api.example.com') do |builder|
      builder.request :url_encoded
      builder.adapter :test do |stub|
        VERBS.each do |verb|
          stub.send(verb, '/token/header') { |env| [200, {}, env[:request_headers]['Authorization']] }
          stub.send(verb, "/token/query?access_token=#{token}") { |env| [200, {}, Addressable::URI.parse(env[:url]).query_values['access_token']] }
          stub.send(verb, '/token/body') { |env| [200, {}, env[:body]] }
        end
        stub.post('/oauth/token') { |env| [200, {'Content-Type' => 'application/json'}, refresh_body] }
      end
    end
  end

  describe '#initialize' do
    it 'assigns client and token' 


    it 'assigns extra params' 


    def assert_initialized_token(target) # rubocop:disable Metrics/AbcSize
      expect(target.token).to eq(token)
      expect(target).to be_expires
      expect(target.params.keys).to include('foo')
      expect(target.params['foo']).to eq('bar')
    end

    it 'initializes with a Hash' 


    it 'from_hash does not modify hash' 


    it 'initalizes with a form-urlencoded key/value string' 


    it 'sets options' 


    it 'does not modify opts hash' 


    it 'initializes with a string expires_at' 


    describe 'expires_latency' do
      let(:expires_at) { 1_530_000_000 }
      let(:expires_in) { 100 }
      let(:expires_latency) { 10 }
      let(:hash) do
        {
          :access_token => token,
          :expires_latency => expires_latency,
          :expires_in => expires_in,
        }
      end

      it 'sets it via options' 


      it 'sets it nil by default' 


      it 'reduces expires_at by the given amount' 


      it 'reduces expires_at by the given amount if expires_at is provided as option' 

    end
  end

  describe '#request' do
    context 'with :mode => :header' do
      before do
        subject.options[:mode] = :header
      end

      VERBS.each do |verb|
        it "sends the token in the Authorization header for a #{verb.to_s.upcase} request" 

      end
    end

    context 'with :mode => :query' do
      before do
        subject.options[:mode] = :query
      end

      VERBS.each do |verb|
        it "sends the token in the Authorization header for a #{verb.to_s.upcase} request" 

      end
    end

    context 'with :mode => :body' do
      before do
        subject.options[:mode] = :body
      end

      VERBS.each do |verb|
        it "sends the token in the Authorization header for a #{verb.to_s.upcase} request" 

      end
    end
  end

  describe '#expires?' do
    it 'is false if there is no expires_at' 


    it 'is true if there is an expires_in' 


    it 'is true if there is an expires_at' 

  end

  describe '#expired?' do
    it 'is false if there is no expires_in or expires_at' 


    it 'is false if expires_in is in the future' 


    it 'is true if expires_at is in the past' 


    it 'is true if expires_at is now' 

  end

  describe '#refresh' do
    let(:access) do
      described_class.new(client, token, :refresh_token => 'abaca',
                                         :expires_in     => 600,
                                         :param_name     => 'o_param')
    end
    let(:new_access) do
      NewAccessToken = Class.new(described_class)
      NewAccessToken.new(client, token, :refresh_token => 'abaca')
    end

    it 'returns a refresh token with appropriate values carried over' 


    it 'returns a refresh token of the same access token class' 


    context 'with a nil refresh_token in the response' do
      let(:refresh_body) { MultiJson.encode(:access_token => 'refreshed_foo', :expires_in => 600, :refresh_token => nil) }

      it 'copies the refresh_token from the original token' 

    end
  end

  describe '#to_hash' do
    it 'return a hash equals to the hash used to initialize access token' 

  end
end

