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
    course_factory(active_all: true)
    outcome_with_rubric
    @assignment = @course.assignments.new(:name => 'assignment with rubric', :points_possible => 10)
    @assignment.moderated_grading = true
    @assignment.save!
    @association = @rubric.associate_with(@assignment, @course, :purpose => 'grading', :use_for_grading => true)
    student_submission
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
      f('#rubric_full tr.learning_outcome_criterion .criterion_comments img').click

      f('textarea.criterion_comments').send_keys(comment)
      f('#rubric_criterion_comments_dialog .save_button').click
      f('#rubric_full input.criterion_points').send_keys(score.to_s)
      scroll_into_view('.save_rubric_button')
      f('#rubric_full .save_rubric_button').click
      wait_for_ajaximations
    end

    it "should create provisional grades and submission comments" 


    it "should create rubric assessments for the provisional grade" 

  end

  context "as a moderator" do
    before do
      course_with_teacher_logged_in(:course => @course, :active_all => true)
      @moderator = @teacher
      @is_moderator = true
    end

    include_examples "moderated grading"

    it "should be able to see a ta's provisional grade in read-only mode" 


    it "should be able to two ta's provisional grades in read-only mode" 


    it "should allow a second mark to be explicitly created by the moderator when student is selected for moderation" 


    it "should work with new rubric assessments on a second mark" 


    it "should be able to see and edit a final mark given by another teacher" 


    it "should be able to add a rubric assessment to a final mark given by another teacher" 


    it "should be able to create a new final mark" 


    it "should be able to copy a 1st mark to the final mark" 


    it "should be able to copy a 2nd mark to the final mark" 


    it "should be able to re-copy a mark to the final mark" 


    context "grade reloading" do
      it "should load the current provisional grades while switching students if it changed in the background" 


      it "should load the current provisional grades selection while switching students if it changed in the background" 


      it "should load the current provisional grade while switching students even if its from the same moderator" 

    end

    context "moderated grade selection" do
      before :once do
        @other_ta = course_with_ta(:course => @course, :active_all => true).user
        @pg1 = @submission.find_or_create_provisional_grade!(@other_ta, score: 7)
        @selection = @assignment.moderated_grading_selections.create!(:student => @student)
      end

      it "should be able to select a provisional grade" 


      it "should be able to select a newly created provisional grade (once it's saved)" 


      it "should automatically select the copied final grade" 

    end
  end

  context "as a provisional grader" do
    before do
      course_with_ta_logged_in(:course => @course, :active_all => true)
      @is_moderator = false
    end

    include_examples "moderated grading"

    it "should not lock a provisional grader out if graded by self" 


    it "should lock a provisional grader out if graded by someone else (and not up for moderation)" 


    it "should lock a provisional grader out if graded by someone else while switching students" 


    it "should not lock a provisional grader out if someone else graded but the student is selected for moderation" 


    it "should lock a provisional grader out the student is selected for moderation but two people have marked it" 

  end
end

