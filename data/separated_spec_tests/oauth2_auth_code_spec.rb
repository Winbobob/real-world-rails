# encoding: utf-8

RSpec.describe OAuth2::Strategy::AuthCode do
  subject { client.auth_code }

  let(:code) { 'sushi' }
  let(:kvform_token) { 'expires_in=600&access_token=salmon&refresh_token=trout&extra_param=steve' }
  let(:facebook_token) { kvform_token.gsub('_in', '') }
  let(:json_token) { MultiJson.encode(:expires_in => 600, :access_token => 'salmon', :refresh_token => 'trout', :extra_param => 'steve') }

  let(:client) do
    OAuth2::Client.new('abc', 'def', :site => 'http://api.example.com') do |builder|
      builder.adapter :test do |stub|
        stub.get("/oauth/token?client_id=abc&client_secret=def&code=#{code}&grant_type=authorization_code") do |env|
          case @mode
          when 'formencoded'
            [200, {'Content-Type' => 'application/x-www-form-urlencoded'}, kvform_token]
          when 'json'
            [200, {'Content-Type' => 'application/json'}, json_token]
          when 'from_facebook'
            [200, {'Content-Type' => 'application/x-www-form-urlencoded'}, facebook_token]
          end
        end
        stub.post('/oauth/token', 'client_id' => 'abc', 'client_secret' => 'def', 'code' => 'sushi', 'grant_type' => 'authorization_code') do |env|
          case @mode
          when 'formencoded'
            [200, {'Content-Type' => 'application/x-www-form-urlencoded'}, kvform_token]
          when 'json'
            [200, {'Content-Type' => 'application/json'}, json_token]
          when 'from_facebook'
            [200, {'Content-Type' => 'application/x-www-form-urlencoded'}, facebook_token]
          end
        end
      end
    end
  end

  describe '#authorize_url' do
    it 'includes the client_id' 


    it 'includes the type' 


    it 'includes passed in options' 

  end

  describe '#get_token (handling utf-8 data)' do
    let(:json_token) { MultiJson.encode(:expires_in => 600, :access_token => 'salmon', :refresh_token => 'trout', :extra_param => 'André') }

    before do
      @mode = 'json'
      client.options[:token_method] = :post
      client.options[:auth_scheme] = :request_body
    end

    it 'does not raise an error' 


    it 'does not create an error instance' 

  end

  %w[json formencoded from_facebook].each do |mode|
    [:get, :post].each do |verb|
      describe "#get_token (#{mode}, access_token_method=#{verb}" do
        before do
          @mode = mode
          client.options[:token_method] = verb
          client.options[:auth_scheme] = :request_body
          @access = subject.get_token(code)
        end

        it 'returns AccessToken with same Client' 


        it 'returns AccessToken with #token' 


        it 'returns AccessToken with #refresh_token' 


        it 'returns AccessToken with #expires_in' 


        it 'returns AccessToken with #expires_at' 


        it 'returns AccessToken with params accessible via []' 

      end
    end
  end
end

