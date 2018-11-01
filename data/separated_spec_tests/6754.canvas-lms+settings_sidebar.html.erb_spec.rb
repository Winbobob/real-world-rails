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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "courses/_settings_sidebar.html.erb" do
  before do
    course_with_teacher(:active_all => true)
    @course.sis_source_id = "so_special_sis_id"
    @course.workflow_state = 'claimed'
    @course.save!
    assign(:context, @course)
    assign(:user_counts, {})
    assign(:all_roles, Role.custom_roles_and_counts_for_course(@course, @user))
    assign(:course_settings_sub_navigation_tools, [])
  end

  describe "End this course button" do
    it "should not display if the course or term end date has passed" 


    it "should display if the course and its term haven't ended" 

  end

  describe "Reset course content" do
    it "should not display the dialog contents under the button" 

  end

  describe "course settings sub navigation" do
    before do
      view_context(@course, @user)
      assign(:current_user, @user)
      @controller.instance_variable_set(:@context, @course)
    end

    describe "external tools" do
      def create_course_settings_sub_navigation_tool(options = {})
          @course.root_account.enable_feature!(:lor_for_account)
          defaults = {
            name: options[:name] || "external tool",
            consumer_key: 'test',
            shared_secret: 'asdf',
            url: 'http://example.com/ims/lti',
            course_settings_sub_navigation: { icon_url: '/images/delete.png' },
          }
          @course.context_external_tools.create!(defaults.merge(options))
      end

      it "should display all configured tools" 


      it "should include the launch type parameter" 

    end
  end
end

