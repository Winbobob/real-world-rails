#
# Copyright (C) 2015 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Oauth2ProviderController do
  describe 'GET auth' do
    let_once(:key) do
      d = DeveloperKey.create! :redirect_uri => 'https://example.com'
      enable_developer_key_account_binding!(d)
      d
    end

    it 'renders a 401 when there is no client_id' 


    it 'renders 400 on a bad redirect_uri' 


    context 'with invalid scopes' do
      let(:dev_key) { DeveloperKey.create! redirect_uri: 'https://example.com', require_scopes: true, scopes: [] }

      it 'renders 400' 


      it 'renders 400 when scopes empty' 

    end

    it 'redirects back with an error for invalid response_type' 


    it 'redirects to the login url' 


    it 'passes on canvas_login if provided' 


    it 'should pass pseudonym_session[unique_id] to login to populate username textbox' 



    context 'with a user logged in' do
      before :once do
        user_with_pseudonym(:active_all => 1, :password => 'qwertyuiop')
      end

      before :each do
        user_session(@user)

        redis = double('Redis')
        allow(redis).to receive(:setex)
        allow(Canvas).to receive_messages(:redis => redis)
      end

      it 'should redirect to the confirm url if the user has no token' 


      it 'redirects to login_url with ?force_login=1' 


      it 'should redirect to login_url when oauth2 session is nil' 


      it 'should redirect to the redirect uri if the user already has remember-me token' 


      it 'it accepts the deprecated name of scopes for scope param' 


      it 'should not reuse userinfo tokens for other scopes' 


      it 'should redirect to the redirect uri if the developer key is trusted' 


      shared_examples_for 'the authorization endpoint' do
        let(:account_developer_key) { raise 'set in examples' }
        let(:account) { account_developer_key.account || Account.site_admin }

        it 'should redirect with "unauthorized_client" if binding does not exist for the account' 


        it 'should redirect with "unauthorized_client" if binding for the account is set to "allow"' 


        it 'should redirect with "unauthorized_client" if binding for the account is set to "off"' 


        it 'should redirect to confirmation page when the binding for the account is set to "on"' 

      end

      context 'when key is a site admin key' do
        let(:root_account) { Account.default }
        let(:developer_key) { DeveloperKey.create!(redirect_uri: 'https://example.com') }
        let(:root_account_binding) { developer_key.developer_key_account_bindings.find_by(account: root_account) }
        let(:sa_account_binding) { developer_key.developer_key_account_bindings.find_by(account: Account.site_admin) }
        let(:redirect_query_params) { Rack::Utils.parse_query(URI.parse(response.location).query) }

        it_behaves_like 'the authorization endpoint' do
          let(:account_developer_key) { developer_key }
        end

        context 'when root account binding exists' do
          before do
            developer_key.developer_key_account_bindings.create!(account: root_account)
          end

          it 'should redirect with "unauthorized_client" if binding for SA is "off" and root account binding is "on"' 


          it 'should redirect with "unauthorized_client" if binding for SA is "allow" and binding for root account is "allow"' 


          it 'should redirect with "unauthorized_client" if binding for SA is "allow" and binding for root account is "off"' 


          it 'should redirect with "unauthorized_client" if binding for SA is "off" and binding for root account is "off"' 


          it 'should redirect to confirmation page if binding for SA is "allow" and binding for root account is "on"' 


          it 'should redirect to confirmation page if binding for SA is "on" and binding for root account is "off"' 


          it 'should redirect to confirmation page if binding for SA is "on" and binding for root account is "allow"' 


          it 'should redirect to confirmation page if binding for SA is "on" and binding for root account is "on"' 

        end
      end

      context 'when key is a root account key' do
        let(:root_account) { Account.default }

        it_behaves_like 'the authorization endpoint' do
          let(:account_developer_key) { DeveloperKey.create!(redirect_uri: 'https://example.com', account: root_account) }
        end
      end
    end
  end

  describe 'POST token' do
    subject { response }

    let_once(:key) { DeveloperKey.create! scopes: [TokenScopes::USER_INFO_SCOPE[:scope]] }
    let_once(:other_key) { DeveloperKey.create! }
    let_once(:inactive_key) { DeveloperKey.create! workflow_state: 'inactive' }
    let_once(:user) { User.create! }
    let(:old_token) { user.access_tokens.create!(developer_key: key) }
    let(:client_id) { key.id }
    let(:client_secret) { key.api_key }
    let(:base_params) do
      {client_id: client_id, client_secret: client_secret, grant_type: grant_type}
    end

    shared_examples_for 'common oauth2 token checks' do
      let(:success_params) { raise 'Override in spec' }
      let(:success_setup) { nil }
      let(:success_token_keys) { raise 'Override in spec' }
      let(:before_post) { nil }
      let(:overrides) { {} }

      before do
        before_post
        parameters = base_params.merge(overrides)
        post :token, params: parameters
      end

      context 'invalid key' do
        context 'key is inactive' do
          let(:client_id) { inactive_key.id }

          it { is_expected.to have_http_status(401) }
        end

        context 'key is missing' do
          let(:client_id) { nil }

          it { is_expected.to have_http_status(401) }
        end

        context 'key is not found' do
          let(:client_id) { 0 }

          it { is_expected.to have_http_status(401) }
        end

        context 'key is not an integer' do
          let(:client_id) { 'a' }

          it { is_expected.to have_http_status(401) }
        end
      end

      context 'secret and key combo invalid' do
        context 'key secret and provided secret do not match' do
          let(:client_secret) { other_key.api_key }

          it do
            skip 'not valid for this grant_type' if grant_type == 'client_credentials'
            is_expected.to have_http_status(401)
          end
        end

        context 'key secret is not provided' do
          let(:client_secret) { nil }

          it do
            skip 'not valid for this grant_type' if grant_type == 'client_credentials'
            is_expected.to have_http_status(401)
          end
        end
      end

      context 'valid request' do
        let(:before_post) { success_setup }
        let(:overrides) { success_params }

        it { is_expected.to have_http_status(200) }

        it 'outputs the token json if everything checks out' 

      end

      context 'invalid grant_type provided' do
        context 'unsupported grant_type' do
          let(:grant_type) { 'urn:unsupported' }

          it { is_expected.to have_http_status(400) }
        end

        context 'missing grant_type' do
          let(:grant_type) { nil }

          it { is_expected.to have_http_status(400) }
        end
      end
    end

    context 'authorization_code' do
      let(:grant_type) { 'authorization_code' }
      let(:valid_code) {"thecode"}
      let(:valid_code_redis_key) {"#{Canvas::Oauth::Token::REDIS_PREFIX}#{valid_code}"}
      let(:redis) do
        redis = double('Redis')
        allow(redis).to receive(:get)
        allow(redis).to receive(:get).with(valid_code_redis_key).and_return(%Q{{"client_id": #{key.id}, "user": #{user.id}}})
        allow(redis).to receive(:del).with(valid_code_redis_key).and_return(%Q{{"client_id": #{key.id}, "user": #{user.id}}})
        redis
      end

      before { allow(Canvas).to receive_messages(:redis => redis) }

      it_behaves_like 'common oauth2 token checks' do
        let(:success_params) { { code: valid_code } }
        let(:success_setup) do
          expect(redis).to receive(:del).with(valid_code_redis_key).at_least(:once)
        end
        let(:success_token_keys) { %w(access_token refresh_token user expires_in token_type) }
      end

      it 'renders a 400 if a code is not provided for an authorization_code grant' 


      it 'renders a 400 if the provided code does not match a token' 


      it 'renders a 400 if the provided code is for the wrong key' 


      it 'default grant_type to authorization_code if none is supplied and code is present' 


      it 'deletes existing tokens for the same key when replace_tokens=1' 


      it 'does not delete existing tokens without replace_tokens' 

    end

    context 'grant_type refresh_token' do
      let(:grant_type) { 'refresh_token' }
      let(:refresh_token) { old_token.plaintext_refresh_token }

      it_behaves_like 'common oauth2 token checks' do
        let(:success_params) { {refresh_token: refresh_token} }
        let(:success_token_keys) { %w(access_token user expires_in token_type) }
      end

      it 'should not generate a new access_token with an invalid refresh_token' 


      it 'should generate a new access_token' 


      it 'errors with a mismatched client id and refresh_token' 


      it 'should be able to regenerate access_token multiple times' 

    end

    context 'client_credentials' do
      let(:grant_type) { 'client_credentials' }
      let(:aud) { Rails.application.routes.url_helpers.oauth2_token_url host: 'test.host' }
      let(:iat) { 1.minute.ago.to_i }
      let(:exp) { 10.minutes.from_now.to_i }
      let(:signing_key) { JSON::JWK.new(key.private_jwk) }
      let(:jwt) do
        {
          iss: 'someiss',
          sub: client_id,
          aud: aud,
          iat: iat,
          exp: exp,
          jti: SecureRandom.uuid
        }
      end
      let(:jws) { JSON::JWT.new(jwt).sign(signing_key, :RS256).to_s }
      let(:client_credentials_params) do
        {
          client_assertion_type: 'urn:ietf:params:oauth:client-assertion-type:jwt-bearer',
          client_assertion: jws,
          scope: TokenScopes::USER_INFO_SCOPE[:scope]
        }
      end

      before do
        key.generate_rsa_keypair! overwrite: true
        key.save!
      end

      it_behaves_like 'common oauth2 token checks' do
        let(:success_params) { client_credentials_params }
        let(:overrides) { client_credentials_params }
        let(:success_token_keys) { %w(access_token token_type expires_in scope) }
      end

      describe 'additional client_credentials checks' do
        subject do
          parameters = {grant_type: 'client_credentials' }.merge(client_credentials_params)
          post :token, params: parameters
          response
        end

        context 'with bad aud' do
          let(:aud) { 'doesnotexist' }

          it { is_expected.to have_http_status 400 }
        end

        context 'with aud as an array' do
          let(:aud) { [Rails.application.routes.url_helpers.oauth2_token_url(host: 'test.host'), 'doesnotexist'] }

          it { is_expected.to have_http_status 200 }
        end

        context 'with bad exp' do
          let(:exp) { 1.minute.ago.to_i }

          it { is_expected.to have_http_status 400 }
        end

        context 'with bad iat' do
          let(:iat) { 1.minute.from_now.to_i }

          it { is_expected.to have_http_status 400 }

          context 'with iat too far in future' do
            let(:iat) { 6.minutes.from_now.to_i }

            it { is_expected.to have_http_status 400 }
          end
        end

        context 'with bad signing key' do
          let(:signing_key) { JSON::JWK.new(other_key.private_jwk) }
          before do
            other_key.generate_rsa_keypair! overwrite: true
            other_key.save!
          end

          it { is_expected.to have_http_status 400 }
        end

        context 'with missing assertion' do
          Canvas::Security::JwtValidator::REQUIRED_ASSERTIONS.each do |assertion|
            it "returns 400 when #{assertion} missing" 

          end
        end

        context 'with replayed jwt' do
          it 'returns 400' 

        end
      end
    end
  end

  describe 'POST accept' do
    let_once(:user) { User.create! }
    let_once(:key) { DeveloperKey.create! }
    let(:session_hash) { { :oauth2 => { :client_id => key.id, :redirect_uri => Canvas::Oauth::Provider::OAUTH2_OOB_URI  } } }
    let(:oauth_accept) { post :accept, session: session_hash }

    before { user_session user }

    it 'uses the global id of the user for generating the code' 


    it 'saves the requested scopes with the code' 


    it 'remembers the users access preference with the code' 


    it 'removes oauth session info after code generation' 


    it 'forwards the oauth state if it was provided' 


  end

  describe 'GET deny' do
    let_once(:key) { DeveloperKey.create! }
    let(:session_hash) { { :oauth2 => { :client_id => key.id, :redirect_uri => Canvas::Oauth::Provider::OAUTH2_OOB_URI  } } }

    it 'forwards the oauth state if it was provided' 


    it "does not provide state if there wasn't one provided" 

  end
end

