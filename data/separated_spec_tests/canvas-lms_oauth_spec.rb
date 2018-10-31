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

require File.expand_path(File.dirname(__FILE__) + '/common')


describe "oauth2 flow" do
  include_context "in-process server selenium tests"

  before do
    @key = DeveloperKey.create!(:name => 'Specs', :redirect_uri => 'http://www.example.com')
    @client_id = @key.id
    @client_secret = @key.api_key
  end

  if Canvas.redis_enabled?
    def oauth_login_fill_out_form
      expect(driver.current_url).to match(%r{/login/canvas$})
      user_element = f('#pseudonym_session_unique_id')
      user_element.send_keys("nobody@example.com")
      password_element = f('#pseudonym_session_password')
      password_element.send_keys("asdfasdf")
      password_element.submit
    end

    describe "a logged-in user" do
      before do
        course_with_student_logged_in(:active_all => true)
      end

      it "should show the confirmation dialog without requiring login" 


    end

    describe "a non-logged-in user" do
      before do
        course_with_student(:active_all => true, :user => user_with_pseudonym)
      end

      it "should show the confirmation dialog after logging in" 

    end
  end

  describe "oauth2 tool icons" do
    include_context "in-process server selenium tests"
    before do
      course_with_student_logged_in(:active_all => true)
    end

    it "should show no icon if icon_url is not set on the developer key" 


    it "should show the developer keys icon if icon_url is set" 


    it "should show remember authorization checkbox for scoped token requests" 


    it "should not show remember authorization checkbox for unscoped requests" 


    it "should not let developer keys expire if remember me was checked" 

  end
end

