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
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "courses/settings.html.erb" do
  before do
    @subaccount = Account.default.sub_accounts.create!(:name => 'subaccount')
    course_with_teacher(:active_all => true, :account => @subaccount)
    @course.sis_source_id = "so_special_sis_id"
    @course.workflow_state = 'claimed'
    @course.save!
    assign(:context, @course)
    assign(:user_counts, {})
    assign(:all_roles, Role.custom_roles_and_counts_for_course(@course, @user))
    assign(:course_settings_sub_navigation_tools, [])
  end

  describe "sis_source_id edit box" do
    it "should not show to teacher" 


    it "should show to sis admin" 


    it "should not show to non-sis admin" 


    it "should not show to subaccount admin" 


    it "should show grade export when enabled" 


    it "should not show grade export when disabled" 

  end

  describe "quota box" do
    context "as account admin" do
      before do
        admin = account_admin_user
        view_context(@course, admin)
        assign(:current_user, admin)
      end

      it "should show quota input box" 

    end

    context "as teacher" do
      before do
        view_context(@course, @teacher)
        assign(:current_user, @teacher)
        @user = @teacher
      end

      it "should not show quota input box" 

    end
  end

  context "account_id selection" do
    it "should let sub-account admins see other accounts within their sub-account as options" 


    it "should let site admins see all accounts within their root account as options" 

  end
end

