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

describe DashboardHelper do
  include DashboardHelper

  context "show_welcome_message?" do
    it "should be true if the user has no current enrollments" 


    it "should be false otherwise" 

  end

  context "user_dashboard_view" do
    before :once do
      course_with_student(:active_all => true)
      @current_user = @student
    end

    it "should use the account's default dashboard view setting if the user has not selected one" 


    it "should return 'planner' if set" 


    it "should be backwards compatible with the deprecated 'show_recent_activity' preference" 


    it "should return the correct value based on the user's setting" 

  end

  describe "map_courses_for_menu" do
    context "with Dashcard Reordering feature enabled" do
      before(:each) do
        @account = Account.default
        @account.enable_feature! :dashcard_reordering
        @domain_root_account = @account
      end

      it "returns the list of courses sorted by position" 

    end
  end
end

