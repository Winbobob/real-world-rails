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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProfileController do
  before :once do
    course_with_teacher(:active_all => true)
    user_with_pseudonym(:active_user => true)
  end

  describe "show" do
    it "should not require an id for yourself" 


    it "should chain to settings when it's the same user" 


    it "should require a password session when chaining to settings" 


    describe "other user's profile" do
      before :each do
        # to allow viewing other user's profile
        allow(@controller).to receive(:api_request?).and_return(true)
      end

      it "should include common contexts in @user_data" 

    end
  end

  describe "update" do
    it "should allow changing the default e-mail address and nothing else" 


    it "should clear email cache" 


    it "should allow changing the default e-mail address and nothing else (name changing disabled)" 


    it "should not let an unconfirmed e-mail address be set as default" 


    it "should not allow a student view student profile to be edited" 

  end

  describe "GET 'communication'" do
    it "should not fail when a user has a notification policy with no notification" 

  end

  describe "update_profile" do
    before :once do
      user_with_pseudonym
      @user.register
    end

    before :each do
      # reload to catch the user change
      user_session(@user, @pseudonym.reload)
    end

    it "should let you change your short_name and profile information" 


    it "should not let you change your short_name information if you are not allowed" 


    it "should let you set visibility on user_services" 


    it "should let you set your profile links" 

  end
end

