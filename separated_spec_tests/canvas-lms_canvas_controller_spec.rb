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

require_relative '../../sharding_spec_helper'
require 'rotp'

describe Login::CanvasController do
  before :once do
    user_with_pseudonym(:username => 'jtfrd@instructure.com', :active_all => 1, :password => 'qwertyuiop')
  end

  describe 'mobile layout decision' do
    let(:mobile_agents) do
      [
        "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5",
        "Mozilla/5.0 (iPod; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5",
        "Mozilla/5.0 (Linux; U; Android 2.2; en-us; SCH-I800 Build/FROYO) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1",
        "Mozilla/5.0 (Linux; U; Android 2.2; en-us; Sprint APA9292KT Build/FRF91) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1",
        "Mozilla/5.0 (Linux; U; Android 2.2; en-us; Nexus One Build/FRF91) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1"
      ]
    end

    def confirm_mobile_layout
      mobile_agents.each do |agent|
        controller.js_env.clear
        request.env['HTTP_USER_AGENT'] = agent
        yield
        expect(response).to render_template(:mobile_login)
      end
    end

    it "should render normal layout if not iphone/ipod" 


    it "should render special iPhone/iPod layout if coming from one of those" 


    it "should render special iPhone/iPod layout if coming from one of those and it's the wrong password'" 


  end

  it "should show sso buttons on load" 


  it "should still show sso buttons on login error" 


  it "should re-render if no user" 


  it "should re-render if incorrect password" 


  it "should re-render if no password given" 


  it "password auth should work" 


  it "password auth should work for an explicit Canvas pseudonym" 


  it "password auth should work with extra whitespace around unique id " 


  it "should re-render if authenticity token is invalid and referer is not trusted" 


  it "should re-render if authenticity token is invalid and referer is trusted" 


  it "should login if authenticity token is invalid and referer is trusted" 


  it "rejects canvas auth if Canvas auth is disabled" 


  context "ldap" do
    it "should log in a user with a identifier_format" 


    it "works for a pseudonym explicitly linked to LDAP" 


    it "ignores a pseudonym explicitly linked to a different LDAP" 


    it "should only query the LDAP server once, even with a differing identifier_format but a matching pseudonym" 


    it "doesn't query the server at all if the enabled features don't require it, and there is no matching login" 


    it "provisions automatically when enabled" 

  end

  context "trusted logins" do
    it "should login for a pseudonym from a different account" 


    it "should login for a user with multiple identical pseudonyms" 


    it "should not login for multiple users with identical pseudonyms" 


    it "should login a site admin user with other identical pseudonyms" 


    context "sharding" do
      specs_require_sharding

      it "should login for a user from a different shard" 

    end
  end

  context "merging" do
    it "should redirect back to merge users" 

  end

  context "otp" do
    it "should not ask for verification of unenrolled, optional user" 

  end

  context "otp login cookie" do
    before :once do
      Account.default.settings[:mfa_settings] = :required
      Account.default.save!

      user_with_pseudonym(:active_all => 1, :password => 'qwertyuiop')
      @user.otp_secret_key = ROTP::Base32.random_base32
      @user.save!
    end

    before :each do
      allow_any_instance_of(ActionController::TestRequest).to receive(:remote_ip).and_return('myip')
    end

    it "should skip otp verification for a valid cookie" 


    it "should ignore a bogus cookie" 


    it "should ignore an expired cookie" 


    it "should ignore a cookie from an old secret_key" 


    it "should ignore a cookie for a different IP" 

  end

  context "oauth" do
    before :once do
      user_with_pseudonym(:active_all => 1, :password => 'qwertyuiop')
    end

    before :each do
      redis = double('Redis')
      allow(redis).to receive(:setex)
      allow(redis).to receive(:hmget)
      allow(redis).to receive(:del)
      allow(Canvas).to receive_messages(:redis => redis)
    end

    let_once(:key) { DeveloperKey.create! :redirect_uri => 'https://example.com' }
    let(:params) { {:pseudonym_session => { :unique_id => @pseudonym.unique_id, :password => 'qwertyuiop' } } }

    it 'should redirect to the confirm url if the user has no token' 


    it 'should redirect to the redirect uri if the user already has remember-me token' 


    it 'should redirect to the redirect uri with the provided state' 


    it 'should not reuse userinfo tokens for other scopes' 


    it 'should redirect to the redirect uri if the developer key is trusted' 

  end
end

