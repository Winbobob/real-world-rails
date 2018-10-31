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
#
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GradeSummaryAssignmentPresenter do
  before :each do
    attachment_model
    course_factory(active_all: true)
    student_in_course active_all: true
    teacher_in_course active_all: true
    @assignment = @course.assignments.create!(title: "some assignment",
                                                assignment_group: @group,
                                                points_possible: 12,
                                                tool_settings_tool: @tool)
    @attachment.context = @student
    @attachment.save!
    @submission = @assignment.submit_homework(@student, attachments: [@attachment])
  end

  let(:summary) {
    GradeSummaryPresenter.new :first, :second, :third
  }

  let(:presenter) {
    GradeSummaryAssignmentPresenter.new(summary,
                                        @student,
                                        @assignment,
                                        @submission)
  }

  describe '#plagiarism_attachment?' do
    it 'returns true if the submission has an OriginalityReport' 


    it 'returns true when the attachment has a pending originality report' 


    it 'returns when submission was automatically created by group assignment submission' 

  end

  describe '#originality_report' do
    it 'returns true when an originality report exists' 


    it 'returns true when an originality report exists with no attachment' 


    it 'returns false if no originailty report exists' 

  end

  describe "#grade_distribution" do
    context "when a summary's assignment_stats is empty" do
      before { allow(summary).to receive(:assignment_stats).and_return({}) }

      it "does not raise an error " 


      it "returns nil when a summary's assignment_stats is empty" 

    end
  end

  describe "#original_points" do
    it "returns an empty string when assignment is muted" 


    it "returns an empty string when submission is nil" 


    it "returns the published score" 

  end

  describe '#deduction_present?' do
    it 'returns true when submission has positive points_deducted' 


    it 'returns false when submission has zero points_deducted' 


    it 'returns false when submission has nil points_deducted' 


    it 'returns false when submission is not present' 

  end

  describe '#entered_grade' do
    it 'returns empty string when neither letter graded nor gpa scaled' 


    it 'returns empty string when ungraded' 


    it 'returns entered grade in parentheses' 

  end

  describe "#show_submission_details_link?" do
    before :each do
      @submission_stub = double()
      allow(@submission_stub).to receive(:originality_reports_for_display)
    end

    it "returns false when assignment is not an assignment" 


    it "returns false when assignment is an assignment and user cannot view details on submission" 


    it "returns true when assignment is an assignment and use can view details on submission" 


    it "returns false when submission is nil" 

  end

  describe "#missing?" do
    it "returns the value of the submission method" 

  end

  describe "#late?" do
    it "returns the value of the submission method" 

  end
end

