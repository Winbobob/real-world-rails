# coding: utf-8

require 'nkf'

RSpec.describe OAuth2::Client do
  subject do
    described_class.new('abc', 'def', :site => 'https://api.example.com') do |builder|
      builder.adapter :test do |stub|
        stub.get('/success')             { |env| [200, {'Content-Type' => 'text/awesome'}, 'yay'] }
        stub.get('/reflect')             { |env| [200, {}, env[:body]] }
        stub.post('/reflect')            { |env| [200, {}, env[:body]] }
        stub.get('/unauthorized')        { |env| [401, {'Content-Type' => 'application/json'}, MultiJson.encode(:error => error_value, :error_description => error_description_value)] }
        stub.get('/conflict')            { |env| [409, {'Content-Type' => 'text/plain'}, 'not authorized'] }
        stub.get('/redirect')            { |env| [302, {'Content-Type' => 'text/plain', 'location' => '/success'}, ''] }
        stub.post('/redirect')           { |env| [303, {'Content-Type' => 'text/plain', 'location' => '/reflect'}, ''] }
        stub.get('/error')               { |env| [500, {'Content-Type' => 'text/plain'}, 'unknown error'] }
        stub.get('/empty_get')           { |env| [204, {}, nil] }
        stub.get('/different_encoding')  { |env| [500, {'Content-Type' => 'application/json'}, NKF.nkf('-We', MultiJson.encode(:error => error_value, :error_description => '∞'))] }
        stub.get('/ascii_8bit_encoding') { |env| [500, {'Content-Type' => 'application/json'}, MultiJson.encode(:error => 'invalid_request', :error_description => 'é').force_encoding('ASCII-8BIT')] }
      end
    end
  end

  let!(:error_value) { 'invalid_token' }
  let!(:error_description_value) { 'bad bad token' }

  describe '#initialize' do
    it 'assigns id and secret' 


    it 'assigns site from the options hash' 


    it 'assigns Faraday::Connection#host' 


    it 'leaves Faraday::Connection#ssl unset' 


    it 'is able to pass a block to configure the connection' 


    it 'defaults raise_errors to true' 


    it 'allows true/false for raise_errors option' 


    it 'allows override of raise_errors option' 


    it 'allows get/post for access_token_method option' 


    it 'does not mutate the opts hash argument' 

  end

  %w[authorize token].each do |url_type|
    describe ":#{url_type}_url option" do
      it "defaults to a path of /oauth/#{url_type}" 


      it "is settable via the :#{url_type}_url option" 


      it 'allows a different host than the site' 

    end
  end

  describe ':redirect_uri option' do
    let(:auth_code_params) do
      {
        'client_id' => 'abc',
        'client_secret' => 'def',
        'code' => 'code',
        'grant_type' => 'authorization_code',
      }
    end

    context 'when blank' do
      it 'there is no redirect_uri param added to authorization URL' 


      it 'does not add the redirect_uri param to the auth_code token exchange request' 

    end

    context 'when set' do
      before { subject.options[:redirect_uri] = 'https://site.com/oauth/callback' }

      it 'adds the redirect_uri param to authorization URL' 


      it 'adds the redirect_uri param to the auth_code token exchange request' 

    end
  end

  describe '#connection' do
    context 'when debugging' do
      include_context 'with stubbed env'
      before do
        stub_env('OAUTH_DEBUG' => debug_value)
      end
      context 'when OAUTH_DEBUG=true' do
        let(:debug_value) { 'true' }

        it 'smoothly handles successive requests' 

        it 'prints both request and response bodies to STDOUT' 

      end
      context 'when OAUTH_DEBUG=false' do
        let(:debug_value) { 'false' }

        it 'smoothly handles successive requests' 

        it 'prints nothing to STDOUT' 

      end
    end
  end

  describe '#request' do
    it 'works with a null response body' 


    it 'returns on a successful response' 


    context 'when OAUTH_DEBUG=true' do
      around do |example|
        begin
          original = ENV['OAUTH_DEBUG']
          ENV['OAUTH_DEBUG'] = 'true'

          example.call
        ensure
          if original.nil?
            ENV.delete('OAUTH_DEBUG')
          else
            ENV['OAUTH_DEBUG'] = original
          end
        end
      end

      it 'outputs to $stdout when OAUTH_DEBUG=true' 

    end

    it 'posts a body' 


    it 'follows redirects properly' 


    it 'redirects using GET on a 303' 


    it 'obeys the :max_redirects option' 


    it 'returns if raise_errors is false' 


    %w[/unauthorized /conflict /error /different_encoding /ascii_8bit_encoding].each do |error_path|
      it "raises OAuth2::Error on error response to path #{error_path}" 

    end

    it 're-encodes response body in the error message' 


    it 'parses OAuth2 standard error response' 


    it 'provides the response in the Exception' 

  end

  describe '#get_token' do
    it 'returns a configured AccessToken' 


    it 'authenticates with request parameters' 


    it 'authenticates with Basic auth' 


    it 'sets the response object on the access token' 


    it 'forwards given token parameters' 


    def stubbed_client(params = {}, &stubs)
      params = {:site => 'https://api.example.com'}.merge(params)
      OAuth2::Client.new('abc', 'def', params) do |builder|
        builder.adapter :test, &stubs
      end
    end
  end

  it 'instantiates an AuthCode strategy with this client' 


  it 'instantiates an Implicit strategy with this client' 


  context 'with SSL options' do
    subject do
      cli = described_class.new('abc', 'def', :site => 'https://api.example.com', :ssl => {:ca_file => 'foo.pem'})
      cli.connection.build do |b|
        b.adapter :test
      end
      cli
    end

    it 'passes the SSL options along to Faraday::Connection#ssl' 

  end

  context 'without a connection-configuration block' do
    subject do
      described_class.new('abc', 'def', :site => 'https://api.example.com')
    end

    it 'applies default faraday middleware to the connection' 

  end
end

