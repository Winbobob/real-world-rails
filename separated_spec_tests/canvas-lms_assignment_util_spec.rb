#
# Copyright (C) 2017 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe AssignmentUtil do
  before :once do
    course_with_teacher(active_all: true)
    student_in_course(active_all: true, user_name: 'a student')
  end

  let(:assignment) do
    @course.assignments.create!(assignment_valid_attributes)
  end

  let(:assignment_name_length_value){ 15 }

  def account_stub_helper(assignment, require_due_date, sis_syncing, new_sis_integrations)
    allow(assignment.context.account).to receive(:sis_require_assignment_due_date).and_return({value: require_due_date})
    allow(assignment.context.account).to receive(:sis_syncing).and_return({value: sis_syncing})
    allow(assignment.context.account).to receive(:feature_enabled?).with('new_sis_integrations').and_return(new_sis_integrations)
  end

  def due_date_required_helper(assignment, post_to_sis, require_due_date, sis_syncing, new_sis_integrations)
    assignment.post_to_sis = post_to_sis
    account_stub_helper(assignment, require_due_date, sis_syncing, new_sis_integrations)
  end

  describe "due_date_required?" do
    it "returns true when all 4 are set to true" 


    it "returns false when post_to_sis is false" 


    it "returns false when sis_require_assignment_due_date is false" 


    it "returns false when sis_syncing is false" 


    it "returns false when new_sis_integrations is false" 

  end

  describe "due_date_required_for_account?" do
    it "returns true when all 3 are set to true" 


    it "returns false when sis_require_assignment_due_date is false" 


    it "returns false when sis_syncing is false" 


    it "returns false when new_sis_integrations is false" 

  end

  describe "assignment_max_name_length" do
    it "returns 15 when the account setting sis_assignment_name_length_input is 15" 

  end

  describe "post_to_sis_friendly_name" do
    it "returns custom friendly name when the account setting sis_name is custom" 


    it "returns SIS when the account setting sis_name is not custom" 

  end

  describe "due_date_ok?" do
    it "returns false when due_at is blank and due_date_required? is true" 


    it "returns true when due_at is blank, due_date_required? is true and grading_type is not_graded" 


    it "returns true when due_at is present and due_date_required? is true" 


    it "returns true when due_at is present and due_date_required? is false" 


    it "returns true when due_at is not present and due_date_required? is false" 

  end

  describe "sis_integration_settings_enabled?" do
    it "returns true when new_sis_integrations fetaure enabled" 


    it "returns false when new_sis_integrations fetaure enabled" 

  end

  describe "assignment_name_length_required?" do
    it "returns true when all 4 are set to true" 


    it "returns false when sis_sycning is set to false" 


    it "returns false when post_to_sis is false" 


    it "returns false when sis_assignment_name_length is false" 


    it "returns false when new_sis_integrations is false" 

  end
end

