#
# Copyright (C) 2015 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/helpers/context_modules_common')

describe "context modules" do
  include_context "in-process server selenium tests"
  include ContextModulesCommon

  context "as an observer" do
    before(:each) do
      @course = course_factory(active_all: true)
      @student = user_factory(active_all: true, :active_state => 'active')
      @observer = user_factory(active_all: true, :active_state => 'active')

      @student_enrollment = @course.enroll_user(@student, 'StudentEnrollment', :enrollment_state => 'active')

      @assignment = @course.assignments.create!(:title => 'assignment 1', :name => 'assignment 1')
      @due_at = 1.year.from_now
      override_for_student(@student, @due_at)

      course_module
      @module.add_item({:id => @assignment.id, :type => 'assignment'})

      user_session(@observer)
    end

    def override_for_student(student, due_at)
      override = assignment_override_model(:assignment => @assignment)
      override.override_due_at(due_at)
      override.save!
      override_student = override.assignment_override_students.build
      override_student.user = student
      override_student.save!
    end

    def section_due_date_override(due_at)
      section2 = @course.course_sections.create!
      override = assignment_override_model(:assignment => @assignment)
      override.set = section2
      override.override_due_at(due_at)
      override.save!
      return section2
    end

    it "when not associated, and in one section, it should show the section's due date" 


    it "when not associated, and in multiple sections, it should show the latest due date" 


    it "when associated with a student, it should show the student's overridden due date" 


    it "should indicate multiple due dates for multiple observed students" 

  end
end

