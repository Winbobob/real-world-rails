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

require "spec_helper"
require_dependency "lti/oauth2/access_token"
require 'json/jwt'

module Lti
  module Oauth2
    describe AccessToken do

      let(:aud){'http://example.com'}
      let(:sub) {'12084434-0c58-4058-b8c0-4af2da9c2ef8'}
      let(:body) do
        {
          iss: 'Canvas',
          sub: sub,
          exp: 5.minutes.from_now.to_i,
          aud: aud,
          iat: Time.zone.now.to_i,
          nbf: 30.seconds.ago,
          jti: '34084434-0c58-405a-b8c0-4af2da9c2efd',
          shard_id: Shard.current.id
        }
      end

      describe "#to_s" do
        let(:access_token) {Lti::Oauth2::AccessToken.create_jwt(aud: aud, sub: sub)}

        it "is signed by the canvas secret" 


        it "has an 'iss' set to 'Canvas'" 


        it "has an 'aud' set to the current domain" 


        it "has an 'exp' that is derived from the settings" 


        it "has a default 'exp' of 1 hour" 


        it "has an 'iat' set to the current time" 


        it "has a 'nbf' derived from the settings" 


        it "has a default 'nbf' 30 seconds ago" 


        it "has a 'jti' that is uniquely generated" 


        it "memoizes the jwt" 


        it "has a 'sub' that is set to the ToolProxy guid" 


        it "includes the reg_key if passed in" 


        it "sets the 'shard_id' to the current shard" 

      end

      describe ".from_jwt" do
        let(:token) {Canvas::Security.create_jwt(body)}
        let(:access_token) {Lti::Oauth2::AccessToken.from_jwt(aud: aud, jwt: token)}

        it "raises an InvalidTokenError if not signed by the correct secret" 


        it "Sets the 'shard_id'" 

      end

      describe "#validate!" do
        let(:token) {Canvas::Security.create_jwt(body)}
        let(:access_token) {Lti::Oauth2::AccessToken.from_jwt(aud: aud, jwt: token)}

        it "returns true if there are no errors" 


        it "raises InvalidTokenError if any of the assertions are missing" 


        it "raises an InvalidTokenError if 'iss' is not 'Canvas'" 


        it "raises an InvalidTokenError if the 'exp' is in the past" 


        it "raises an InvalidTokenError if the 'aud' is different than the passed in 'aud'" 


        it "handles an array for aud" 


        it "raises an InvalidTokenError if the 'iat' is in the future" 


        it "raises an InvalidTokenError if the 'nbf' is in the future" 


      end

    end
  end
end

