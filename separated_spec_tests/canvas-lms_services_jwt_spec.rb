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

require_relative '../../../spec_helper'
require_dependency "canvas/security/services_jwt"

module Canvas::Security
  describe ServicesJwt do
    include_context "JWT setup"

    def build_wrapped_token(user_id, real_user_id: nil)
      payload = { sub: user_id }
      payload[:masq_sub] = real_user_id if real_user_id
      crypted_token = ServicesJwt.generate(payload, false)
      payload = {
        iss: "some other service",
        user_token: crypted_token
      }
      wrapper_token = Canvas::Security.create_jwt(payload, nil, fake_signing_secret)
      # because it will come over base64 encoded from any other service
      Canvas::Security.base64_encode(wrapper_token)
    end

    let(:translate_token) do
      ->(jwt){
        decoded_crypted_token = Canvas::Security.base64_decode(jwt)
        return Canvas::Security.decrypt_services_jwt(decoded_crypted_token)
      }
    end

    it "has secrets accessors" 


    describe "#initialize" do
      it "throws an error for nil token string" 

    end

    describe "#wrapper_token" do
      let(:user_id){ 42 }

      it "is the body of the wrapper token if wrapped" 


      it "is an empty hash if an unwrapped token" 

    end

    describe "user ids" do
      let(:user_id){ 42 }

      it "can get the user_id out of a wrapped issued token" 


      it "can pull out the masquerading user if provided" 

    end

    describe "initialization" do
      let(:jwt_string){ ServicesJwt.generate(sub: 1) }

      it "uses SecureRandom for generating the JWT" 


      it "expires in an hour" 


      describe "via .generate" do

        let(:base64_regex) do
          %r{^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{4}|[A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)$}
        end

        let(:jwt_string){ ServicesJwt.generate(sub: 1) }

        it "builds an encoded token out" 


        it "can return just the encrypted token without base64 encoding" 


        it "allows the introduction of arbitrary data" 


        it "errors if you try to pass data without a sub entry" 


      end

      describe "via .for_user" do
        let(:user){ double(global_id: 42) }
        let(:ctx){ double(id: 47) }
        let(:host){ "example.instructure.com" }
        let(:masq_user){ double(global_id: 24) }

        it "can build from a user and host" 


        it "includes masquerading user if given" 


        it "doesn't include the masq key if there is no real user" 


        it "includes workflows if given" 


        it "does not include a workflow if not given" 


        it "does not include a workflow if empty array" 


        it 'includes workflow_state if workflows is given' 


        it 'does not include workflow_state if empty' 


        it 'includes context type and id if context is given' 


        it "errors without a host" 


        it "errors without a user" 

      end

      describe "refresh_for_user" do
        let(:user1){ double(global_id: 42) }
        let(:user2){ double(global_id: 43) }
        let(:host) { 'testhost' }

        it 'is invalid if jwt cannot be decoded' 


        it 'is invlaid if user id is different' 


        it 'is invlaid if host is different' 


        it 'is invlaid masquerading user is different' 


        it 'is invalid if masquerading and token does not have masq_sub' 


        it 'is invalid if more than 6 hours past token expiration' 


        it 'generates a token with the same user id and host' 


        it 'generates a token with masq_sub for masquerading users' 


        it 'generates a token with same workflows as original' 


        it 'generates a token with same context as original' 


        it 'generates a new token even if the original token has expired' 

      end
    end
  end
end

