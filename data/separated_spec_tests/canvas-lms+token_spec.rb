#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path('../../../spec_helper', File.dirname(__FILE__))
require_dependency "canvas/oauth/token"

module Canvas::Oauth
  describe Token do
    let(:code) { 'code123code' }
    let(:key) { DeveloperKey.create! }
    let(:user) { User.create! }
    let(:token) { Token.new(key, code) }

    def stub_out_cache(client_id = nil, scopes = nil)
      if client_id
        allow(token).to receive_messages(:cached_code_entry =>
                      '{"client_id": ' + client_id.to_s +
                        ', "user": ' + user.id.to_s +
                        (scopes ? ', "scopes": ' + scopes.to_json : '') + '}')
      else
        allow(token).to receive_messages(:cached_code_entry => '{}')
      end
    end

    before { stub_out_cache key.id }

    describe 'initialization' do
      it 'retains the key' 


      it 'retains the code' 

    end

    describe '#is_for_valid_code?' do
      it 'is false when there is no code data' 


      it 'is true otherwise' 

    end

    describe '#client_id' do
      it 'delegates to the parsed json' 


      it 'is nil when there is no cached entry' 

    end

    describe '#user' do
      it 'uses the user_id from the redis entry to load a user' 

    end

    describe '#code_data' do
      it 'parses the json from the cache' 

    end

    describe '#access_token' do
      let(:scopes) {["#{TokenScopes::OAUTH2_SCOPE_NAMESPACE}userinfo"]}

      it 'creates a new token if none exists' 


      it 'creates a scoped access token' 


      it 'creates a new token if the scopes do not match' 


      it 'will not return the full token for a userinfo scope' 


      it 'finds an existing userinfo token if one exists' 


      it 'ignores existing token if user did not remember access' 


      it 'ignores existing tokens by default' 

    end

    describe '#create_access_token_if_needed' do
      it 'deletes existing tokens for the same key when requested' 


      it 'does not delete existing tokens for the same key when not requested' 

    end

    describe '#as_json' do
      let(:json) { token.as_json }

      it 'includes the access token' 


      it 'includes the refresh token' 


      it 'ignores refresh token if its not there' 


      it 'grabs the user json as well' 


      it 'returns the expires_in parameter' 


      it 'does not put anything else into the json' 


      it 'does not put expires_in in the json when auto_expire_tokens is false' 


      it 'puts real_user in the json when masquerading' 


      it 'does not put real_user in the json when not masquerading' 

    end

    describe '.generate_code_for' do
      let(:code) { "brand_new_code" }
      before { allow(SecureRandom).to receive_messages(:hex => code) }

      it 'returns the new code' 


      it 'sets the new data hash into redis with 10 min ttl' 


      it 'sets the new data hash into redis with 10 sec ttl' 

    end

    context "token expiration" do
      it "starts expiring tokens in 1 hour" 


      it 'doesn\'t set an expiration if the dev key has auto_expire_tokens set to false' 


      it 'Tokens wont expire if the dev key has auto_expire_tokens set to false' 

    end
  end
end

