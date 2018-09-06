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
    let_once(:key) { DeveloperKey.create! :redirect_uri => 'https://example.com' }

    it 'renders a 401 when there is no client_id' 


    it 'renders 400 on a bad redirect_uri' 


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


      context 'when new developer key FF is enabled' do
        before do
          allow(Account.site_admin).to receive(:feature_allowed?).and_return(false)
          allow(Account.default).to receive(:feature_enabled?).and_return(false)
          allow(Account.site_admin).to receive(:feature_allowed?).with(:developer_key_management_ui_rewrite).and_return(true)
          allow(Account.default).to receive(:feature_enabled?).with(:developer_key_management_ui_rewrite).and_return(true)
        end

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
  end

  describe 'POST token' do
    let_once(:key) { DeveloperKey.create! }
    let_once(:user) { User.create! }
    let(:valid_code) {"thecode"}
    let(:valid_code_redis_key) {"#{Canvas::Oauth::Token::REDIS_PREFIX}#{valid_code}"}
    let(:redis) do
      redis = double('Redis')
      allow(redis).to receive(:get)
      allow(redis).to receive(:get).with(valid_code_redis_key).and_return(%Q{{"client_id": #{key.id}, "user": #{user.id}}})
      allow(redis).to receive(:del).with(valid_code_redis_key).and_return(%Q{{"client_id": #{key.id}, "user": #{user.id}}})
      redis
    end

    it 'renders a 401 if theres no client_id' 


    it 'renders a 401 if the secret is invalid' 


    it 'renders a 400 if a code is not provided for an authorization_code grant' 


    it 'renders a 400 if the provided code does not match a token' 


    it 'outputs the token json if everything checks out' 


    it 'renders a 400 if the provided code is for the wrong key' 


    it 'default grant_type to authorization_code if none is supplied and code is present' 


    it 'deletes existing tokens for the same key when replace_tokens=1' 


    it 'does not delete existing tokens without replace_tokens' 


    context 'grant_type refresh_token' do
      it 'must specify grant_type' 


      it 'should not generate a new access_token with an invalid refresh_token' 


      it 'should generate a new access_token' 


      it 'errors with a mismatched client id' 


      it 'should be able to regenerate access_token multiple times' 

    end

    context 'unsupported grant_type' do
      it 'returns a 400' 

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
end

