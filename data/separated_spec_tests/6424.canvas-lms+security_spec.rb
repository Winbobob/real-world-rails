#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Canvas::Security do
  describe "JWT tokens" do
    describe "encoding" do
      describe ".create_jwt" do
        it "should generate a token with an expiration" 


        it "should generate a token without expiration" 


        it "should encode with configured encryption key" 


        it "should encode with the supplied key" 


        it "should encode with supplied algorithm" 

      end

      describe ".create_encrypted_jwt" do
        let(:signing_secret){ "asdfasdfasdfasdfasdfasdfasdfasdf" }
        let(:encryption_secret){ "jkl;jkl;jkl;jkl;jkl;jkl;jkl;jkl;" }
        let(:payload) { { arbitrary: "data" } }

        it "builds up an encrypted token" 


        it "raises InvalidJwtKey if encryption_secret is nil" 


        it "raises InvalidJwtKey if signing_secret is nil" 


      end
    end

    describe ".base64_encode" do
      it "trims off newlines" 

    end

    describe "decoding" do
      let(:key){ "mykey" }

      def test_jwt(claims={})
        JSON::JWT.new({ a: 1 }.merge(claims)).sign(key, :HS256).to_s
      end

      around(:example) do |example|
        Timecop.freeze(Time.utc(2013,3,13,9,12)) do
          example.run
        end
      end

      it "should decode token" 


      it "should return token body with indifferent access" 


      it "should check using past keys" 


      it "should raise on an expired token" 


      it "should not raise an error on a token with expiration in the future" 


      it "errors if the 'nbf' claim is in the future" 


      it "allows 5 minutes of future clock skew" 


      it "produces an InvalidToken error if string isn't a jwt (even if it looks like one)" 


    end
  end

  describe "hmac_sha512" do
    it "verifies items signed with the same secret" 


    it "rejects items signed with different secrets" 

  end

  if Canvas.redis_enabled?
    describe "max login attempts" do
      before do
        Setting.set('login_attempts_total', '2')
        Setting.set('login_attempts_per_ip', '1')
        u = user_with_pseudonym :active_user => true,
          :username => "nobody@example.com",
          :password => "asdfasdf"
        u.save!
        @p = u.pseudonym
      end

      it "should be limited for the same ip" 


      it "should have a higher limit for other ips" 


      it "should not block other users with the same ip" 


      it "should timeout the login block after a waiting period" 

    end
  end

  describe '.config' do
    before { described_class.instance_variable_set(:@config, nil) }
    after  { described_class.instance_variable_set(:@config, nil) }

    it 'loads config as erb from config/security.yml' 

  end
end

