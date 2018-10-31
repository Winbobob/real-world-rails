#
# Copyright (C) 2014 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../helpers/assignments_common')
require File.expand_path(File.dirname(__FILE__) + '/../helpers/differentiated_assignments')

describe "interaction with differentiated assignments on the dashboard and calendar" do
  include_context "in-process server selenium tests"
  include DifferentiatedAssignments
  include AssignmentsCommon

  context "Student" do
    before :each do
      course_with_student_logged_in
      da_setup
      create_da_assignment
    end

    context "Main Dashboard" do
      it "should not show inaccessible assignments in the To Do section" 

      it "should show assignments with an override in the To Do section" 

      it "should not show inaccessible assignments in Recent activity" 

    end

    context "Course Dashboard" do
      it "should not show inaccessible assignments in the To Do section" 

      it "should show assignments with an override in the To Do section" 

    end

    context "Calendar" do
      it "should not show inaccessible assignments" 

      it "should show assignments with an override" 

      it "should show assignments with a graded submission" 

    end
  end

  context "Observer with student" do
    before :each do
      observer_setup
      da_setup
      create_da_assignment
    end

    context "Main Dashboard" do
      it "should not show inaccessible assignments in the To Do section" 

      it "should show assignments with an override in the To Do section" 

      it "should not show inaccessible assignments in Recent activity" 

    end

    context "Course Dashboard" do
      it "should not show inaccessible assignments in the To Do section" 

      it "should show assignments with an override in the To Do section" 

    end

    context "Calendar" do
      it "should not show inaccessible assignments" 

      it "should show assignments with an override" 

      it "should show assignments with a graded submission" 

    end
  end
end

