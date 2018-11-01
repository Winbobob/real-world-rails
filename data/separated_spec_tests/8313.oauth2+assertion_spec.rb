require 'jwt'

RSpec.describe OAuth2::Strategy::Assertion do
  subject { client.assertion }

  let(:client) do
    cli = OAuth2::Client.new('abc', 'def', :site => 'http://api.example.com', :auth_scheme => auth_scheme)
    cli.connection.build do |b|
      b.adapter :test do |stub|
        stub.post('/oauth/token') do |token_request|
          @request_body = token_request.body

          case @response_format
          when 'formencoded'
            [200, {'Content-Type' => 'application/x-www-form-urlencoded'}, 'expires_in=600&access_token=salmon&refresh_token=trout']
          when 'json'
            [200, {'Content-Type' => 'application/json'}, '{"expires_in":600,"access_token":"salmon","refresh_token":"trout"}']
          else
            raise 'Please define @response_format to choose a response content type!'
          end
        end
      end
    end
    cli
  end

  let(:auth_scheme) { :request_body }

  describe '#authorize_url' do
    it 'raises NotImplementedError' 

  end

  describe '#get_token' do
    let(:algorithm) { 'HS256' }
    let(:key) { 'arowana' }
    let(:timestamp) { Time.now.to_i }
    let(:claims) do
      {
        :iss => 'carp@example.com',
        :scope => 'https://oauth.example.com/auth/flounder',
        :aud => 'https://sturgeon.example.com/oauth2/token',
        :exp => timestamp + 3600,
        :iat => timestamp,
        :sub => '12345',
        :custom_claim => 'ling cod',
      }
    end

    before do
      @response_format = 'json'
    end

    describe 'assembling a JWT assertion' do
      let(:jwt) do
        payload, header = JWT.decode(@request_body[:assertion], key, true, :algorithm => algorithm)
        {:payload => payload, :header => header}
      end

      let(:payload) { jwt[:payload] }
      let(:header) { jwt[:header] }

      context 'when encoding as HS256' do
        let(:algorithm) { 'HS256' }
        let(:key) { 'super_secret!' }

        before do
          subject.get_token(claims, :algorithm => algorithm, :key => key)
          raise 'No request made!' if @request_body.nil?
        end

        it 'indicates HS256 in the header' 


        it 'encodes the JWT as HS256' 

      end

      context 'when encoding as RS256' do
        let(:algorithm) { 'RS256' }
        let(:key) { OpenSSL::PKey::RSA.new(1024) }

        before do
          subject.get_token(claims, :algorithm => algorithm, :key => key)
          raise 'No request made!' if @request_body.nil?
        end

        it 'indicates RS256 in the header' 


        it 'encodes the JWT as RS256' 

      end

      context 'with bad encoding params' do
        let(:encoding_opts) { {:algorithm => algorithm, :key => key} }

        describe 'non-supported algorithms' do
          let(:algorithm) { 'the blockchain' }
          let(:key) { 'machine learning' }

          it 'raises NotImplementedError' 

        end

        describe 'of a wrong object type' do
          let(:encoding_opts) { 'the cloud' }

          it 'raises ArgumentError' 

        end

        describe 'missing encoding_opts[:algorithm]' do
          before do
            encoding_opts.delete(:algorithm)
          end

          it 'raises ArgumentError' 

        end

        describe 'missing encoding_opts[:key]' do
          before do
            encoding_opts.delete(:key)
          end

          it 'raises ArgumentError' 

        end
      end
    end

    describe 'POST request parameters' do
      context 'when using :auth_scheme => :request_body' do
        let(:auth_scheme) { :request_body }

        it 'includes assertion and grant_type, along with the client parameters' 


        it 'includes other params via request_options' 

      end

      context 'when using :auth_scheme => :basic_auth' do
        let(:auth_scheme) { :basic_auth }

        it 'includes assertion and grant_type by default' 


        it 'includes other params via request_options' 

      end
    end

    describe 'returning the response' do
      let(:access_token) { subject.get_token(claims, {:algorithm => algorithm, :key => key}, {}, response_opts) }
      let(:response_opts) { {} }

      %w[json formencoded].each do |mode|
        context "when the content type is #{mode}" do
          before do
            @response_format = mode
          end

          it 'returns an AccessToken' 


          it 'returns AccessToken with same Client' 


          it 'returns AccessToken with #token' 


          it 'returns AccessToken with #expires_in' 


          it 'returns AccessToken with #expires_at' 


          it 'sets AccessToken#refresh_token to nil' 


          context 'with custom response_opts' do
            let(:response_opts) { {:custom_token_option => 'mackerel'} }

            it 'passes them into the token params' 

          end

          context 'when no custom opts are passed in' do
            let(:response_opts) { {} }

            it 'does not set any params by default' 

          end
        end
      end
    end
  end
end

