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

require 'spec_helper'

describe LatePolicyApplicator do
  describe '.for_course' do
    before :once do
      course_factory(active_all: true)

      @published_assignment = @course.assignments.create!(workflow_state: 'published')
    end

    it 'instantiates an applicator for the course' 


    it 'does not instantiate an applicator for an unpublished course' 


    it 'does not instantiate an applicator for a course with no published assignments' 


    it 'kicks off a singleton background job with an identifier based on the course id' 

  end

  describe '.for_assignment' do
    before :once do
      course_factory(active_all: true)

      @published_assignment = @course.assignments.create!(workflow_state: 'published', points_possible: 20)
    end

    it 'instantiates an applicator for the assignment' 


    it 'does not instantiate an applicator for an unpublished assignment' 


    it 'does not instantiate an applicator for an assignment with no points possible' 


    it 'does not instantiate an applicator for an assignment with zero points possible' 


    it 'does not instantiate an applicator for an assignment with negative points possible' 


    it 'does not instantiate an applicator for an assignment without a course' 


    it 'kicks off a singleton background job with an identifier based on the assignment id' 

  end

  describe '#process' do
    before :once do
      @now = Time.zone.now
      course_factory(active_all: true, grading_periods: [:old, :current])

      @late_policy = late_policy_factory(course: @course, deduct: 50.0, every: :day, missing: 95.0)
      @course.late_policy = @late_policy
      @course.save!

      @students = Array.new(4) do
        user = User.create!
        @course.enroll_student(user, enrollment_state: 'active')

        user
      end

      @assignment_in_closed_gp = @course.assignments.create!(
        points_possible: 20, due_at: @now - 3.months, submission_types: 'online_text_entry'
      )

      @late_submission1 = @assignment_in_closed_gp.submissions.find_by(user: @students[0])
      # Update using update_all to prevent any callbacks that already apply late policies
      # rubocop:disable Rails/SkipsModelValidations
      Submission.where(id: @late_submission1.id).
        update_all(
          submitted_at: @now - 3.months + 1.hour,
          cached_due_date: @now - 3.months,
          score: 20,
          grade: 20,
          submission_type: 'online_text_entry'
        )

      @timely_submission1 = @assignment_in_closed_gp.submissions.find_by(user: @students[1])
      Submission.where(id: @timely_submission1).
        update_all(
          submitted_at: @now,
          cached_due_date: @now + 1.hour,
          score: 20,
          grade: 20,
          submission_type: 'online_text_entry'
        )

      @missing_submission1 = @assignment_in_closed_gp.submissions.find_by(user: @students[2])
      Submission.where(id: @missing_submission1).
        update_all(
          submitted_at: nil,
          cached_due_date: 1.month.ago(@now),
          score: nil,
          grade: nil
        )

      @assignment_in_open_gp = @course.assignments.create!(
        points_possible: 20, due_at: @now - 1.month, submission_types: 'online_text_entry'
      )

      @late_submission2 = @assignment_in_open_gp.submissions.find_by(user: @students[0])
      Submission.where(id: @late_submission2.id).
        update_all(
          submitted_at: @now - 1.month + 1.hour,
          cached_due_date: @now - 1.month,
          score: 20,
          grade: 20,
          submission_type: 'online_text_entry'
        )

      @timely_submission2 = @assignment_in_open_gp.submissions.find_by(user: @students[1])
      Submission.where(id: @timely_submission2).
        update_all(
          submitted_at: @now,
          cached_due_date: @now + 1.hour,
          score: 20,
          grade: 20,
          submission_type: 'online_text_entry'
        )

      @missing_submission2 = @assignment_in_open_gp.submissions.find_by(user: @students[2])
      Submission.where(id: @missing_submission2).
        update_all(
          submitted_at: nil,
          cached_due_date: @now - 1.month,
          score: nil,
          grade: nil
        )

      @previously_late_submission = @assignment_in_open_gp.submissions.find_by(user: @students[3])
      Submission.where(id: @previously_late_submission).
        update_all(
          submitted_at: @now,
          cached_due_date: @now + 1.hour,
          score: 10,
          grade: 10,
          points_deducted: 10,
          submission_type: 'online_text_entry'
        )
      # rubocop:enable Rails/SkipsModelValidations
    end

    context 'when the course has no late policy' do
      it 'does not apply a late policy to late submissions' 

    end

    context 'when the course has a late policy' do
      it 'does not apply the late policy to submissions unless late_submission_deduction_enabled or missing_submission_deduction_enabled' 


      it 'applies the late policy to submissions if late_submission_deduction_enabled' 


      it 'applies the late policy to submissions if missing_submission_deduction_enabled' 


      it 'applies the late policy to late submissions in the open grading period' 


      it 'does not apply the late policy to late submissions for concluded students' 


      it 'recalculates late penalties with current due date in the open grading period' 


      it 'does not recalculate late penalties with current due date in the open grading period if late deductions are disabled' 


      it 'applies the missing policy to missing submissions in the open grading period' 


      it 'does not apply the missing policy to missing submissions for concluded students' 


      it 'does not apply the late policy to timely submissions in the open grading period' 


      it 'does not apply the late policy to late submissions in the closed grading period' 


      it 'does not apply the late policy to missing submissions in the closed grading period' 


      it 'does not apply the late policy to timely submissions in the closed grading period' 


      it 'calls re-calculates grades in bulk after processing all submissions' 


      it 'processes differentiated assignments that have a student in a closed grading period without error' 

    end
  end
end

