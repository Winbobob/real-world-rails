#
# Copyright (C) 2014 Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../lti2_api_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../api_spec_helper')
require_dependency "lti/ims/tool_proxy_controller"

module Lti
  module Ims
    describe ToolProxyController, type: :request do
      include_context 'lti2_api_spec_helper'

      let(:account) { Account.new }
      let(:product_family) do
        ProductFamily.create(vendor_code: '123', product_code: 'abc', vendor_name: 'acme', root_account: account)
      end
      let(:tool_proxy) do
        ToolProxy.create!(
          context: account,
          guid: SecureRandom.uuid,
          shared_secret: 'abc',
          product_family: product_family,
          product_version: '1',
          workflow_state: 'disabled',
          raw_data: {'proxy' => 'value'},
          lti_version: '1'
        )
      end

      let(:oauth1_header) do
        {
          'HTTP_AUTHORIZATION' => "OAuth
                oauth_consumer_key=\"#{tool_proxy.guid}\",
                oauth_signature_method=\"HMAC-SHA1\",
                oauth_signature=\"not_a_sig\",
                oauth_timestamp=\"137131200\",
                oauth_nonce=\"4572616e48616d6d65724c61686176\",
                oauth_version=\"1.0\" ".gsub(/\s+/, ' ')
        }
      end

      describe "Get #show" do

        before(:each) do
          allow(OAuth::Signature).to receive(:build).and_return(double(verify: true))
          allow(OAuth::Helper).to receive(:parse_header).and_return({'oauth_consumer_key' => 'key'})
        end

        it 'the tool proxy raw data' 


        it 'has the correct content-type' 


      end

      describe "POST #create" do

        before(:each) do
          mock_oauth_sig = double('oauth_signature')
          allow(mock_oauth_sig).to receive(:verify).and_return(true)
          allow(OAuth::Signature).to receive(:build).and_return(mock_oauth_sig)
          allow(OAuth::Helper).to receive(:parse_header).and_return({'oauth_consumer_key' => 'key'})
          allow(Lti::RegistrationRequestService).to receive(:retrieve_registration_password).and_return({
            reg_password: 'password',
            registration_url: 'http://example.com/register'
          })
        end

        it 'returns a tool_proxy id object' 


        it 'has the correct content-type' 


        it 'returns an error message' 


        it 'accepts split secret' 


        context "custom tool consumer profile" do
          let(:account) {Account.create!}
          let(:dev_key) do
            dev_key = DeveloperKey.create(api_key: 'test-api-key', vendor_code: vendor_code)
            dev_key
          end
          let!(:tcp) do
            dev_key.create_tool_consumer_profile!(
              services: Lti::ToolConsumerProfile::RESTRICTED_SERVICES,
              capabilities: Lti::ToolConsumerProfile::RESTRICTED_CAPABILITIES,
              uuid: SecureRandom.uuid,
              developer_key: dev_key
            )
          end
          let(:tcp_url) {polymorphic_url([account, :tool_consumer_profile], tool_consumer_profile_id: tcp.uuid)}
          let(:access_token) do
            aud = host rescue (@request || request).host
            Lti::Oauth2::AccessToken.create_jwt(aud: aud, sub: developer_key.global_id, reg_key: 'reg_key')
          end
          let(:request_headers) { {Authorization: "Bearer #{access_token}"} }

          before { allow(DeveloperKey).to receive(:find_cached) { dev_key }  }

          it 'supports using a specified custom TCP' 

        end

      end

      describe "POST #create with JWT access token" do
        let(:access_token) do
          aud = host rescue (@request || request).host
          developer_key.update_attributes(vendor_code: vendor_code)
          Lti::Oauth2::AccessToken.create_jwt(aud: aud, sub: developer_key.global_id, reg_key: 'reg_key')
        end
        let(:request_headers) { {Authorization: "Bearer #{access_token}"} }

        it 'accepts valid JWT access tokens' 


        it 'returns a 401 if the reg_key is not valid' 


      end

      describe "POST #reregistration" do

        before(:each) do
          mock_siq = double('signature')
          allow(mock_siq).to receive(:verify).and_return(true)
          allow(OAuth::Signature).to receive(:build).and_return(mock_siq)

        end

        it "routes to the reregistration action based on header" 


        it 'checks for valid oauth signatures' 


        it 'updates the tool proxy update payload' 


        it 'Errors on invalid payload' 

      end
    end
  end
end

