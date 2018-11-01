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

describe AssignmentsHelper do
  include TextHelper
  include AssignmentsHelper

  describe "#assignment_publishing_enabled?" do
    before(:once) do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
      assignment_model(course: @course)
    end

    it "is false if the user cannot update the assignment" 


    it "is true if the assignment already has submissions and is unpublished" 


    it "is true otherwise" 

  end

  describe "#due_at" do
    before(:once) do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
      @due_date = 1.month.from_now
      assignment_model(course: @course, due_at: @due_date)
    end

    it "renders due date" 


    it "renders no due date when none present" 


    context "with multiple due dates" do
      before(:once) do
        @section = @course.course_sections.create!(name: "test section")
        student_in_section(@section, user: @student)
        @section_due_date = 2.months.from_now
        create_section_override_for_assignment(@assignment, course_section: @section, due_at: @section_due_date)
      end

      it "renders multiple dates" 


      it "renders override date when it applies to all assignees" 


      it "renders applicable date to student" 

    end
  end

  describe "#turnitin active?" do
    before(:once) do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
      assignment_model(course: @course)
      @assignment.turnitin_enabled = true
      @assignment.update_attributes!({
        submission_types: ["online_url"]
      })
      @context = @assignment.context
      account = @context.account
      account.turnitin_account_id = 12345
      account.turnitin_shared_secret = "the same combination on my luggage"
      account.settings[:enable_turnitin] = true
      account.save!
    end

    it "returns true if turnitin is active on the assignment and account" 


    it "returns false if the assignment does not require submissions" 


    it "returns false if turnitin is disabled on the account level" 

  end
end

