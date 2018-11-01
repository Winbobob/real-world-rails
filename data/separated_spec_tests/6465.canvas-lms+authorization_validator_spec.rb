#
# Copyright (C) 2017 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')

module Lti
  module Oauth2
    describe AuthorizationValidator do

      let(:product_family) do
        product_family_mock = double("product_family")
        allow(product_family_mock).to receive(:developer_key).and_return(dev_key)
        product_family_mock
      end

      let(:account) { Account.create! }

      let(:tool_proxy) do
        tool_proxy_mock = double("tool_proxy")
        allow(tool_proxy_mock).to receive(:guid).and_return("3b7f3b02-b481-4f63-a6b0-129dee85abee")
        allow(tool_proxy_mock).to receive(:shared_secret).and_return('42')
        allow(tool_proxy_mock).to receive(:raw_data).and_return({'enabled_capability' => ['Security.splitSecret']})
        allow(tool_proxy_mock).to receive(:workflow_state).and_return('active')
        allow(tool_proxy_mock).to receive(:product_family).and_return(product_family)
        tool_proxy_mock
      end

      let(:auth_url) { 'http://example.com/api/lti/authorize' }

      let(:raw_jwt) do
        raw_jwt = JSON::JWT.new(
          {
            sub: tool_proxy.guid,
            aud: auth_url,
            exp: 1.minute.from_now,
            iat: Time.zone.now.to_i,
            jti: "6b7f5b02-b4e1-4fa3-d6b0-329dee85abff"
          }
        )
        raw_jwt
      end
      let(:dev_key) { DeveloperKey.create! }
      let(:raw_jwt_dev_key) do
        raw_jwt = JSON::JWT.new(
          {
            sub: dev_key.global_id,
            aud: auth_url,
            exp: 1.minute.from_now,
            iat: Time.zone.now.to_i,
            jti: SecureRandom.uuid
          }
        )
        raw_jwt
      end

      let(:auth_validator) do
        AuthorizationValidator.new(
          jwt: raw_jwt.sign(tool_proxy.shared_secret, :HS256).to_s,
          authorization_url: auth_url,
          context: account
        )
      end

      before do
        allow(Lti::ToolProxy).to receive(:where).and_return([])
        allow(Lti::ToolProxy).to receive(:where).with(guid: tool_proxy.guid, workflow_state: 'active').and_return([tool_proxy])
      end

      describe "#jwt" do

        it "returns the decoded JWT" 


        it "raises Lti::Oauth2::AuthorizationValidator::InvalidAuthJwt if any of the assertions are missing" 


        it 'raises JSON::JWT:InvalidFormat if the JWT format is invalid' 


        it 'raises JSON::JWS::VerificationFailed if the signature is invalid' 


        it 'raises JSON::JWS::UnexpectedAlgorithm if the signature type is :none' 


        it "raises Lti::Oauth2::AuthorizationValidator::InvalidAuthJwt if the 'exp' is in the past" 



        it "raises Lti::Oauth2::AuthorizationValidator::InvalidAuthJwt if the 'iat' to old" 


        it "raises Lti::Oauth2::AuthorizationValidator::InvalidAuthJwt if the 'iat' is in the future" 


        it "raises Lti::Oauth2::AuthorizationValidator::InvalidAuthJwt if the 'jti' has already been used" 



        it "raises Lti::Oauth2::AuthorizationValidator::InvalidAuthJwt if the 'aud' is not the authorization endpoint" 


        it "raises Lti::Oauth2::AuthorizationValidator::SecretNotFound if no ToolProxy or developer key" 


        context "JWT signed with dev key" do
            let(:auth_validator) do
              AuthorizationValidator.new(
                jwt: raw_jwt_dev_key.sign(dev_key.api_key, :HS256).to_s,
                authorization_url: auth_url,
                code: 'reg_key',
                context: account
              )
            end

            it 'throws an exception if no code is provided' 


            it "returns the decoded JWT" 

        end
      end

      describe "#developer_key" do
        let(:auth_validator) do
          AuthorizationValidator.new(
            jwt: raw_jwt_dev_key.sign(dev_key.api_key, :HS256).to_s,
            authorization_url: auth_url,
            code: '123',
            context: account
          )
        end

        it 'gets the correct developer key' 


        it 'returns nil if developer key not found' 

      end

      describe "#sub" do
        it 'returns the tool proxy guid if tool proxy is present' 


        it 'returns the developer key global id if dev key is present' 

      end

      describe "#tool_proxy" do

        it 'returns the tool_proxy from the uuid specified in the sub' 


        it "raises Lti::Oauth2::AuthorizationValidator::InvalidAuthJwt if the Tool Proxy is not using a split secret" 


        it "accepts OAuth.splitSecret capability for backwards compatability" 


        it "requires an active developer_key" 


        it "requires a developer key that is usable for the cluster" 


      end

    end
  end
end

