require 'spec_helper_min'
require 'carto/oauth_provider_controller'
require 'support/helpers'
require 'helpers/subdomainless_helper'

describe Carto::OauthProviderController do
  include HelperMethods
  include_context 'organization with users helper'

  before(:all) do
    @sequel_developer = FactoryGirl.create(:valid_user)
    @developer = Carto::User.find(@sequel_developer.id)
    @user = FactoryGirl.create(:valid_user)
  end

  before(:each) do
    @oauth_app = FactoryGirl.create(:oauth_app, user: @developer)
  end

  after(:each) do
    @oauth_app.reload.destroy
  end

  after(:all) do
    @developer.destroy
    @user.destroy
  end

  after(:each) do
    Carto::User.find(@user.id).oauth_app_users.each(&:destroy)
  end

  let(:valid_payload) do
    {
      client_id: @oauth_app.client_id,
      response_type: 'code',
      state: 'random_state_thingy',
      accept: true
    }
  end

  def parse_fragment_parameters(uri)
    URI.decode_www_form(Addressable::URI.parse(uri).fragment).to_h
  end

  def parse_query_parameters(uri)
    Addressable::URI.parse(uri).query_values
  end

  def validate_token_response(parameters, access_token, refresh_token = nil)
    expect(parameters[:access_token]).to(eq(access_token.api_key.token))
    expect(parameters[:token_type]).to(eq('Bearer'))
    expect(parameters[:expires_in].to_i).to(be_between(3595, 3600)) # Little margin for slowness
    if refresh_token
      expect(parameters[:refresh_token]).to(eq(refresh_token.token))
    else
      expect(parameters[:refresh_token]).to(be_nil)
    end
    expect(parameters[:user_info_url]).to(include(api_v4_users_me_path, access_token.oauth_app_user.user.username))
  end

  shared_examples_for 'authorization parameter validation' do
    it 'returns a 400 error if application cannot be found' 


    it 'shows an error if invalid response_type' 


    shared_examples_for 'invalid parameter redirections' do
      it 'redirects with an error if missing state' 


      it 'redirects with an error if requesting unknown scopes' 


      it 'redirects with an error if requesting non-existent datasets' 


      it 'redirects with an error if requesting invalid dataset scopes' 


      it 'redirects with an error if requesting with an invalid redirect_uri' 


      describe 'with restricted app' do
        before(:each) do
          @oauth_app.update!(restricted: true)
          @org_authorization = @oauth_app.oauth_app_organizations.create!(organization: @carto_organization, seats: 1)
        end

        it 'redirects with an error if the user is not an organization member' 


        it 'succeeds if logged in as a member of an allowed organization' 


        it 'redirects with an error if the organization is out of seats for the application' 

      end
    end

    describe 'with code response' do
      it_behaves_like 'invalid parameter redirections' do
        def parse_uri_parameters(uri)
          parse_query_parameters(uri)
        end
      end
    end

    describe 'with token response' do
      it_behaves_like 'invalid parameter redirections' do
        before(:each) do
          valid_payload[:response_type] = 'token'
        end

        def parse_uri_parameters(uri)
          parse_fragment_parameters(uri)
        end
      end
    end
  end

  describe '#consent' do
    before(:each) do
      login_as(@user, scope: @user.username)
      host!("#{@user.username}.localhost.lan")
    end

    it_behaves_like 'authorization parameter validation' do
      def request_endpoint(parameters)
        get oauth_provider_authorize_url(parameters)
      end

      def expect_success(response)
        expect(response.status).to(eq(200))
      end
    end

    shared_examples_for 'success with response pre-authorized' do
      it 'with valid payload and code response, pre-authorized, redirects back to the application' 


      it 'with valid payload and token response, pre-authorized, redirects back to the application' 

    end

    describe 'domains and authentication' do
      it 'works with a URL for another username/org' 


      it 'in subdomainless, should not require username at all' 

    end

    it 'logged out, redirects to login' 


    it 'with valid payload, shows the consent form' 


    it 'with valid payload and datasets scopes shows the consent form' 


    it 'with valid payload, pre-authorized and requesting more scopes, shows the consent screen' 


    describe 'with code or token' do
      it_behaves_like 'success with response pre-authorized'
    end

    describe 'with silent flow' do
      before(:each) do
        valid_payload[:response_type] = 'token'
        valid_payload[:prompt] = 'none'
      end

      it_behaves_like 'success with response pre-authorized'

      it 'redirects with invalid request if prompt is not none' 


      it 'redirects with login_required if not logged in' 


      it 'redirects with access_denied if not authorized' 


      it 'with valid payload, pre-authorized and requesting more scopes redirects with access_denied' 

    end
  end

  describe '#authorize' do
    before(:each) do
      login_as(@user, scope: @user.username)
      host!("#{@user.username}.localhost.lan")
    end

    it_behaves_like 'authorization parameter validation' do
      def request_endpoint(parameters)
        post oauth_provider_authorize_url(parameters)
      end

      def expect_success(response)
        expect(response.status).to(eq(302))
        expect(response.location).not_to(include('error'))
      end
    end

    it 'logged out, redirects to login' 


    shared_examples_for 'successfully authorizes' do
      it 'with valid payload, creates an authorization and redirects back to the application with a code' 


      it 'with valid payload and redirect URIs, creates an authorization and redirects back to the requested URI' 


      it 'with valid payload, and a pre-existing grant, upgrades it adding more scopes' 


      it 'with client_secret in the payload throws an error' 

    end

    describe 'with code response' do
      it_behaves_like 'successfully authorizes' do
        def validate_response(response)
          authorization_code = @oauth_app.oauth_app_users.find_by_user_id!(@user.id).oauth_authorization_codes.first
          expect(authorization_code).to(be)
          expect(authorization_code.code).to(be_present)

          expect(response.status).to(eq(302))
          expect(parse_query_parameters(response.location)['code']).to(eq(authorization_code.code))
        end
      end
    end

    describe 'with token response' do
      before(:each) do
        valid_payload[:response_type] = 'token'
      end

      it_behaves_like 'successfully authorizes' do
        def validate_response(response)
          access_token = @oauth_app.oauth_app_users.find_by_user_id!(@user.id).oauth_access_tokens.first
          expect(access_token).to(be)
          expect(access_token.api_key).to(be_present)

          expect(response.status).to(eq(302))
          validate_token_response(parse_fragment_parameters(response.location).symbolize_keys, access_token)
        end
      end

      it 'redirects with an error if requesting offline scope' 

    end
  end

  describe '#token' do
    before(:each) do
      @oauth_app_user = @oauth_app.oauth_app_users.create!(user_id: @user.id)
      @authorization_code = @oauth_app_user.oauth_authorization_codes.create!
    end

    let (:auth_code_token_payload) do
      {
        client_id: @oauth_app.client_id,
        client_secret: @oauth_app.client_secret,
        grant_type: 'authorization_code',
        code: @authorization_code.code
      }
    end

    describe 'with authorization code' do
      it 'with valid code returns an api key' 


      it 'with valid code and offline scope returns an api key and refresh token' 


      it 'with valid code and redirect uri returns an api key' 


      it 'with expired code, returns code not valid' 


      it 'with invalid code, returns error without creating the api key' 


      it 'with invalid redirect_uri, returns error without creating the api key' 


      it 'without redirect_uri, returns error without creating the api key' 

    end

    describe 'with refresh token' do
      before(:each) do
        @refresh_token = @oauth_app_user.oauth_refresh_tokens.create!(scopes: ['offline'])
      end

      let (:refresh_token_payload) do
        {
          client_id: @oauth_app.client_id,
          client_secret: @oauth_app.client_secret,
          grant_type: 'refresh_token',
          refresh_token: @refresh_token.token
        }
      end

      it 'with valid token returns an api key' 


      it 'with valid token and explicit scopes returns a restricted api key' 


      it 'with expired token, returns error without creating the api key' 


      it 'with invalid code, returns error without creating the api key' 


      it 'with missing refresh_token parameter returns an informative error' 

    end

    it 'with missing required parameters returns an informative error' 


    it 'with invalid client_id, returns error without creating the api key' 


    it 'with invalid client_secret, returns error without creating the api key' 


    it 'with invalid grant_type, returns error without creating the api key' 

  end

  describe '#acceptance' do
    include Capybara::DSL

    # Since Capybara+rack passes all requests to the local server, we set a redirect URI inside localhost
    let(:redirect_uri) { "https://#{@user.username}.localhost.lan/redirect" }

    let(:state) { SecureRandom.hex(16) }

    let(:base_uri) { "http://#{@user.username}.localhost.lan" }

    before(:each) do
      @oauth_app.update!(redirect_uris: ['https://fake_uri', redirect_uri])
    end

    def login
      login_as(@user, scope: @user.username)
      begin
        visit "#{base_uri}/login"
      rescue ActionView::MissingTemplate
        # Expected error trying to load dashboard statics
      end
    end

    def request_authorization(response_type, scope)
      visit "#{base_uri}/oauth2/authorize?client_id=#{@oauth_app.client_id}&state=#{state}" \
            "&response_type=#{response_type}&scope=#{scope}&redirect_uri=#{redirect_uri}"

      begin
        click_on 'Accept'
      rescue ActionController::RoutingError
        # Expected error since /redirect is a made up URL
      end
    end

    def test_access_token(token_response, expect_success:)
      # TODO: use bearer auth
      get_json "#{token_response[:user_info_url]}?api_key=#{token_response[:access_token]}" do |response|
        if expect_success
          expect(response.status).to(eq(200))
          expect(response.body[:username]).to(eq(@user.username))
        else
          expect(response.status).to(eq(401))
        end
      end
    end

    it 'following the code flow produces a valid API Key and refresh token to renew it' 


    it 'following the implicit flow produces a valid API Key' 


    it 'will return to oauth flow after login' 

  end
end

