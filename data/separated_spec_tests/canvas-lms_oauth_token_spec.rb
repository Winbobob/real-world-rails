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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

%w{ Twitter LinkedIn }.each do |integration|
describe integration do
  before do
    course_with_student_logged_in(:active_all => true)
  end

  def oauth_start(integration)
    expect_any_instance_of(UsersController).to receive(:feature_and_service_enabled?).with(integration.underscore).and_return(true)
    if integration == "LinkedIn"
      expect(LinkedIn::Connection).to receive(:config).at_least(:once).and_return({})
    elsif integration == "Twitter"
      expect(Twitter::Connection).to receive(:config).at_least(:once).and_return({})
    else
      expect(integration.constantize).to receive(:config).at_least(:once).and_return({})
    end

    # mock up the response from the 3rd party service, so we don't actually contact it
    expect_any_instance_of(OAuth::Consumer).to receive(:token_request).and_return({:oauth_token => "test_token", :oauth_token_secret => "test_secret", :authorize_url => "http://oauth.example.com/start"})
    expect_any_instance_of(OAuth::RequestToken).to receive(:authorize_url).and_return("http://oauth.example.com/start")
    get "/oauth?service=#{integration.underscore}"
  end

  it "should error if the service isn't enabled" 


  it "should redirect to the service for auth" 


  describe "oauth_success" do
    before do
      OauthRequest.create!({
        :service => integration.underscore,
        :token => "test_token",
        :secret => "test_secret",
        :return_url => user_profile_url(@user),
        :user => @user,
        :original_host_with_port => "www.example.com",
      })
    end

    it "should fail without a valid token" 


    it "should fail with the wrong user" 


    it "should redirect to the original host if a different host is returned to" 


    it "should create the UserService on successful auth" 


    it "should fail creating the UserService if getting the initial user info fails" 

  end
end
end

