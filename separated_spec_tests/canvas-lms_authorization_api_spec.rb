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
#

require File.expand_path(File.dirname(__FILE__) + '/../../api_spec_helper')
require_dependency "lti/ims/authorization_controller"
require 'json/jwt'

module Lti
  module Ims
    describe AuthorizationController, type: :request do

      let(:account) { Account.create! }

      let(:developer_key) { DeveloperKey.create!(redirect_uri: 'http://example.com/redirect') }

      let(:product_family) do
        ProductFamily.create(
          vendor_code: '123',
          product_code: 'abc',
          vendor_name: 'acme',
          root_account: account,
          developer_key: developer_key
        )
      end
      let(:tool_proxy) do
        ToolProxy.create!(
          context: account,
          guid: SecureRandom.uuid,
          shared_secret: 'abc',
          product_family: product_family,
          product_version: '1',
          workflow_state: 'active',
          raw_data: {'enabled_capability' => ['Security.splitSecret']},
          lti_version: '1'
        )
      end

      let(:raw_jwt) do
        raw_jwt = JSON::JWT.new(
          {
            sub: tool_proxy.guid,
            aud: polymorphic_url([account, :lti_oauth2_authorize]),
            exp: 1.minute.from_now,
            iat: Time.zone.now.to_i,
            jti: SecureRandom.uuid
          }
        )
        raw_jwt
      end

      let(:auth_endpoint) { polymorphic_url([account, :lti_oauth2_authorize]) }
      let(:jwt_string) do
        raw_jwt.sign(tool_proxy.shared_secret, :HS256).to_s
      end
      let(:params) do
        {
          grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
          assertion: jwt_string
        }
      end

      describe "POST 'authorize'" do

        it 'responds with 200' 


        it 'includes an expiration' 


        it 'has a token_type of bearer' 


        it 'returns an access_token' 


        it "allows the use of the 'OAuth.splitSecret'" 


        it "renders a 400 if the JWT format is invalid" 


        it "renders a the correct json if the grant_type is invalid" 


        it "adds the file_host and the request host to the aud" 


        context 'error reports' do
          it 'creates an error report with error as the message' 


          it 'sets the error report category' 

        end

        context "reg_key" do

          let(:reg_key) { SecureRandom.uuid }

          let(:reg_password) { SecureRandom.uuid }

          let(:registration_url) { 'http://example.com/register' }

          let(:raw_jwt) do
            RegistrationRequestService.cache_registration(account, reg_key, reg_password, registration_url)
            raw_jwt = JSON::JWT.new(
              {
                sub: reg_key,
                aud: polymorphic_url([account, :lti_oauth2_authorize]),
                exp: 1.minute.from_now,
                iat: Time.zone.now.to_i,
                jti: SecureRandom.uuid,
              }
            )
            raw_jwt
          end

          let(:jwt_string) do
            raw_jwt.sign(reg_password, :HS256).to_s
          end

          let(:params) do
            {
              grant_type: 'authorization_code',
              assertion: jwt_string,
            }
          end

          it 'accepts a valid reg_key' 

        end

        context "developer credentials" do

          let(:raw_jwt) do
            raw_jwt = JSON::JWT.new(
              {
                sub: developer_key.global_id,
                aud: polymorphic_url([account, :lti_oauth2_authorize]),
                exp: 1.minute.from_now,
                iat: Time.zone.now.to_i,
                jti: SecureRandom.uuid,
              }
            )
            raw_jwt
          end

          let(:jwt_string) do
            raw_jwt.sign(developer_key.api_key, :HS256).to_s
          end

          let(:params) do
            {
              grant_type: 'authorization_code',
              assertion: jwt_string,
              code: 'reg_key'
            }
          end

          it "rejects the request if a valid reg_key isn't provided and grant_type is auth code" 


          it "accepts a developer key with a reg key" 



        end

      end
    end
  end
end

