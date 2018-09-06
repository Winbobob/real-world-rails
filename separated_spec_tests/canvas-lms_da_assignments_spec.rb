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

describe "interaction with differentiated assignments" do
  include_context "in-process server selenium tests"
  include DifferentiatedAssignments
  include AssignmentsCommon

  context "Student" do
    before :each do
      course_with_student_logged_in
      da_setup
      create_da_assignment
      @teacher = User.create!
      @course.enroll_teacher(@teacher)
    end

    context "Assignment Index" do
      it "should hide assignments not visible" 

      it "should show assignments with an override" 

      it "should show assignments with a graded submission" 

    end

    context "Assignment Show page and Submission page" do
      it "should redirect back to assignment index from inaccessible assignments" 

      it "should show the assignment page with an override" 

      it "should show the assignment page with a graded submission" 

      it "should allow previous submissions to be accessed on an inaccessible assignment" 

    end

      context "Student Grades Page" do
        it "should show assignments with an override" 

        it "should show assignments with a graded submission" 

        it "should not show inaccessible assignments" 

      end
    end

  context "Observer with student" do
    before :each do
      observer_setup
      da_setup
      create_da_assignment
      @teacher = User.create!
      @course.enroll_teacher(@teacher)
    end

    context "Assignment Index" do
      it "should hide inaccessible assignments" 

      it "should show assignments with an override" 

      it "should show assignments with a graded submission" 

    end

    context "Assignment Show page and Submission page" do
      it "should redirect back to assignment index from inaccessible assignments" 

      it "should show the assignment page with an override" 

      it "should show the assignment page with a graded submission" 

      it "should allow previous submissions to be accessed on an inaccessible assignment" 

    end

    context "Student Grades Page" do
      it "should show assignments with an override" 

      it "should show assignments with a graded submission" 

      it "should not show inaccessible assignments" 

    end
  end

  context "Teacher" do
    before :each do
      course_with_teacher_logged_in
      da_setup
      create_da_assignment
    end
    it "should hide students from speedgrader if they don't have Differentiated assignment visibility or a graded submission" 

  end
end

