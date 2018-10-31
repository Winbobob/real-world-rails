#
# Copyright (C) 2016 - present Instructure, Inc.
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

require_relative '../../../spec_helper.rb'

class SisAssignmentHarness
  include Api::V1::SisAssignment
end

describe Api::V1::SisAssignment do
  subject(:generator) { SisAssignmentHarness.new }

  context "#sis_assignments_json" do
    let(:course_1) { course_factory }
    let(:assignment_1) { assignment_model(course: course_factory) }

    let(:assignment_override_1) do
      assignment_override_model(assignment: assignment_1)
    end

    let(:assignment_override_2) do
      assignment_override_model(assignment: assignment_1)
    end

    let(:assignment_overrides) do
      allow(assignment_override_1).to receive(:set_type).and_return("CourseSection")
      allow(assignment_override_1).to receive(:set_id).and_return(1)

      allow(assignment_override_2).to receive(:set_type).and_return("CourseSection")
      allow(assignment_override_2).to receive(:set_id).and_return(2)

      [
        assignment_override_1,
        assignment_override_2
      ]
    end


    let(:course_section_1) { CourseSection.new }
    let(:course_section_2) { CourseSection.new }
    let(:course_section_3) { CourseSection.new }

    let(:course_sections) do
      [
        course_section_1,
        course_section_2,
        course_section_3
      ]
    end

    before do
      allow(assignment_1).to receive(:locked_for?).and_return(false)

      allow(assignment_overrides).to receive(:loaded?).and_return(true)
      allow(assignment_overrides).to receive(:unlock_at).and_return(15.days.ago)
      allow(assignment_overrides).to receive(:lock_at).and_return(2.days.from_now)

      allow(course_section_1).to receive(:id).and_return(1)
      allow(course_section_2).to receive(:id).and_return(2)
      allow(course_section_3).to receive(:id).and_return(3)

      course_sections.each do |course_section|
        allow(course_section).to receive(:nonxlist_course).and_return(course_1)
        allow(course_section).to receive(:crosslisted?).and_return(false)
      end

      allow(course_sections).to receive(:loaded?).and_return(true)
      allow(course_sections).to receive(:active_course_sections).and_return(course_sections)
      allow(course_sections).to receive(:association).and_return(OpenStruct.new(:loaded? => true))
    end

    it "creates assignment groups that have name and integration_data with proper data" 


    it "creates assignment groups where integration_data is nil" 


    it "returns false for include_in_final_grade when omit_from_final_grade is true" 


    it "returns false for include_in_final_grade when grading_type is not_graded" 


    it "returns true for include_in_final_grade when appropriate" 


    it "returns an empty hash for 0 assignments" 


    context "returns hash when there are no courses" do
      let(:assignments) { [assignment_1] }
      let(:results) { subject.sis_assignments_json(assignments) }
      it { expect(results.size).to eq(1) }
      it { expect(results.first["id"]).to eq(assignment_1.id) }
    end

    it "displays all section overrides" 


    it "includes unlock_at and lock_at attributes" 


    it "includes unlock_at and lock_at attributes in section overrides" 


    it "can return an empty due_at" 


    context "mastery paths overrides" do
      it "uses a mastery paths due date as the course due date" 


      it "prefers the assignment due_at over an override" 

    end

    context "student_overrides: true" do
      let(:course) {assignment_1.course}

      before do
        @student1 = student_in_course(course: course, workflow_state: 'active').user
        @student2 = student_in_course(course: course, workflow_state: 'active').user
        managed_pseudonym(@student2, sis_user_id: 'SIS_ID_2')

        due_at = Time.zone.parse('2017-02-08 22:11:10')
        @override = create_adhoc_override_for_assignment(assignment_1, [@student1, @student2], due_at: due_at)
      end

      it "adds student assignment override information" 


      it "raises an error when active_assignment_overrides are not preloaded" 


      it "raises an error when assignment_override_students are not preloaded" 


      it "does not list student sis_ids when users are not preloaded" 


      it "does not list student sis_ids when pseudonyms are not preloaded" 


      it 'provides an empty list when there are no overrides' 

    end

  end
end

