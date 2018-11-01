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

require_relative '../../helpers/speed_grader_common'
require_relative '../../helpers/gradebook_common'

describe "speed grader" do
  include_context "in-process server selenium tests"
  include GradebookCommon
  include SpeedGraderCommon

  before(:once) do
    @course = course_factory(active_all: true)
    outcome_with_rubric(course: @course)
    @assignment = @course.assignments.create!(
      name: 'assignment with rubric',
      points_possible: 10,
      moderated_grading: true,
      grader_count: 1
    )
    @association = @rubric.associate_with(@assignment, @course, purpose: 'grading', use_for_grading: true)
    @submission = student_submission(assignment: @assignment)
  end

  before do
    stub_kaltura
  end

  shared_examples_for "moderated grading" do
    def add_rubric_assessment(score, comment)
      scroll_into_view('.toggle_full_rubric')
      f('.toggle_full_rubric').click
      expect(f('#rubric_full')).to be_displayed
      expand_right_pane
      wait_for_ajaximations
      f('svg[name="IconFeedback"]').find_element(:xpath, '../../parent::button').click
      f("textarea[data-selenium='criterion_comments_text']").send_keys(comment)
      fj("button:contains('Update Comment'):visible").click
      wait_for_ajaximations
      f('.criterion_points input').send_keys(score.to_s)
      f('.criterion_points input').send_keys(:tab)
      wait_for_ajaximations
      scroll_to(f('.save_rubric_button'))
      save_rubric_button = f('#rubric_full .save_rubric_button')
      save_rubric_button.click
      wait_for_ajaximations
    end

    it "should create provisional grades and submission comments" 


    it "should create rubric assessments for the provisional grade" 

  end

  context "as a moderator" do
    before do
      course_with_teacher_logged_in(course: @course, active_all: true)
      @moderator = @teacher
      @is_moderator = true
    end

    include_examples "moderated grading"
  end

  context "as a provisional grader" do
    before do
      course_with_ta_logged_in(course: @course, active_all: true)
      @is_moderator = false
    end

    include_examples "moderated grading"

    it "should not lock a provisional grader out if graded by self" 


    it "should lock a provisional grader out if graded by someone else" 


    it "should lock a provisional grader out if graded by someone else while switching students" 


    it "should not lock a provisional grader out if someone else graded but more grader slots are available" 


    it "should not lock a provisional grader out if someone else graded but grader is final grader" 

  end
end

