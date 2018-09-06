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

require_relative '../spec_helper'

describe JwtsController do
  include_context "JWT setup"
  let(:token_user){ user_factory(active_user: true) }
  let(:other_user){ user_factory(active_user: true) }
  let(:translate_token) do
    ->(resp){
      utf8_token_string = json_parse(resp.body)['token']
      decoded_crypted_token = Canvas::Security.base64_decode(utf8_token_string)
      return Canvas::Security.decrypt_services_jwt(decoded_crypted_token)
    }
  end

  describe "#generate" do
    it "requires being logged in" 


    context "with valid user session" do
      before(:each){ user_session(token_user) }
      let(:translate_token) do
        ->(resp){
          utf8_token_string = json_parse(resp.body)['token']
          decoded_crypted_token = Canvas::Security.base64_decode(utf8_token_string)
          return Canvas::Security.decrypt_services_jwt(decoded_crypted_token)
        }
      end

      it "generates a base64 encoded token for a user session with env var secrets" 


      it "has the users domain in the token" 

    end

    it "doesn't allow using a token to gen a token" 

  end

  describe "#refresh" do
    it "requires being logged in" 


    it "doesn't allow using a token to gen a token" 


    context "with valid user session" do
      before(:each) do
        user_session(token_user)
        request.env['HTTP_HOST'] = 'testhost'
      end

      it "requires a jwt param" 


      it "returns a refreshed token for user" 


      it "returns a different jwt when refresh is called" 


      it "returns an error if jwt is invalid for refresh" 

    end
  end
end

