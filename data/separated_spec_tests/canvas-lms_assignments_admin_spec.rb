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

require File.expand_path(File.dirname(__FILE__) + '/../common')

describe "assignments" do
  include_context "in-process server selenium tests"

  context "as an admin" do
    before do
      @student = user_with_pseudonym(:active_user => true)
      course_with_student(:active_all => true, :user => @student)
      assignment_model(:course => @course, :submission_types => 'online_upload', :title => 'Assignment 1')
      site_admin_logged_in
    end

    it "should not show google docs tab for masquerading admin" 


    it "should show the submit button if admin is enrolled as student" 

  end

  context "with limited permissions" do
    before :once do
      @student = user_with_pseudonym(:active_user => true)
      course_with_student(:active_all => true, :user => @student)
      assignment_model(:course => @course, :submission_types => 'online_upload', :title => 'Assignment 1')
    end

    it "shouldn't kersplode on the index without the `manage_courses` permission" 


    it "shouldn't kersplode on the index without the `manage_assignments` permission" 

  end
end

