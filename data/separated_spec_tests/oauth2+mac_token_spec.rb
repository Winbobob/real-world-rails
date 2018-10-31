RSpec.describe MACToken do
  subject { described_class.new(client, token, 'abc123') }

  let(:token) { 'monkey' }
  let(:client) do
    Client.new('abc', 'def', :site => 'https://api.example.com') do |builder|
      builder.request :url_encoded
      builder.adapter :test do |stub|
        VERBS.each do |verb|
          stub.send(verb, '/token/header') { |env| [200, {}, env[:request_headers]['Authorization']] }
        end
      end
    end
  end

  describe '#initialize' do
    it 'assigns client and token' 


    it 'assigns secret' 


    it 'defaults algorithm to hmac-sha-256' 


    it 'handles hmac-sha-256' 


    it 'handles hmac-sha-1' 


    it 'raises on improper algorithm' 

  end

  describe '#request' do
    VERBS.each do |verb|
      it "sends the token in the Authorization header for a #{verb.to_s.upcase} request" 

    end
  end

  describe '#header' do
    it 'does not generate the same header twice' 


    it 'generates the proper format' 


    it 'passes ArgumentError with an invalid url' 


    it 'passes URI::InvalidURIError through' 

  end

  describe '#signature' do
    it 'generates properly' 

  end

  describe '#headers' do
    it 'is an empty hash' 

  end

  describe '.from_access_token' do
    subject { described_class.from_access_token(access_token, 'hello') }

    let(:access_token) do
      AccessToken.new(
        client, token,
        :expires_at => 1,
        :expires_in => 1,
        :refresh_token => 'abc',
        :random => 1
      )
    end

    it 'initializes client, token, and secret properly' 


    it 'initializes configuration options' 


    it 'initializes params' 

  end
end

