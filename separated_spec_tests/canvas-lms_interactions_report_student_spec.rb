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

require File.expand_path(File.dirname(__FILE__) + '/common')

describe "student interactions report" do
  include_context "in-process server selenium tests"

  context "as a student" do

    before(:each) do
        course_with_teacher_logged_in(:active_all => true)
        @student1 = student_in_course(:active_all => true).user
        @student2 = student_in_course(:active_all => true, :name => "zzz student").user

        @assignment = @course.assignments.create(:name => "first assignment", :points_possible => 10)
        @sub1 = @assignment.submissions.find_by!(user: @student1)
        @sub2 = @assignment.submissions.find_by!(user: @student2)

        @sub1.update_attribute(:score, 10)
        @sub2.update_attribute(:score, 5)

        get "/users/#{@teacher.id}/teacher_activity/course/#{@course.id}"
    end

    it "should have sortable columns, except the email header" 


    it "should allow sorting by columns" 

  end
end

