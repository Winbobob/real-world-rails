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

describe "interaction with differentiated discussions" do
  include_context "in-process server selenium tests"
  include DifferentiatedAssignments
  include AssignmentsCommon

  context "Student" do
    before :each do
      course_with_student_logged_in
      da_setup
      create_da_discussion
    end

    context "Discussion and Assignment Index" do
      it "should hide inaccessible discussions" 

      it "should show discussions with an override" 

      it "should show discussions with a graded submission" 

    end

    context "Discussion Show page" do
      it "should redirect back to discussion index from inaccessible discussions" 

      it "should show the discussion page with an override" 

      it "should show the discussion page with a graded submission" 

    end

    context "Student Grades Page" do
      it "should show discussions with an override" 

      it "should show discussions with a graded submission" 

      it "should not show inaccessible discussions" 

    end
  end

  context "Observer with student" do
    before :each do
      observer_setup
      da_setup
      create_da_discussion
    end

    context "Discussion and Assignment Index" do
      it "should not show inaccessible discussions" 

      it "should show discussions with an override" 

      it "should show discussions with a graded submission" 

    end

    context "Discussion Show page" do
      it "should redirect back to discussion index from inaccessible discussions" 

      it "should show the discussion page with an override" 

      it "should show the discussion page with a graded submission" 

    end

    context "Student Grades Page" do
      it "should show discussions with an override" 

      it "should show discussions with a graded submission" 

      it "should not show inaccessible discussions" 

    end
  end
end

