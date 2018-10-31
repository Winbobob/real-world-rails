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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Quizzes::QuizSubmissionsController do

  before :once do
    course_with_teacher(:active_all => true)
    student_in_course(:active_all => true)
    @teacher_enrollment = @enrollment
  end

  describe "POST 'create'" do
    before :once do
      @quiz = @course.quizzes.create!
      @quiz.workflow_state = "available"
      @quiz.quiz_data = [{:correct_comments=>"", :assessment_question_id=>nil, :incorrect_comments=>"", :question_name=>"Question 1", :points_possible=>1, :question_text=>"Which book(s) are required for this course?", :name=>"Question 1", :id=>128, :answers=>[{:weight=>0, :text=>"A", :comments=>"", :id=>1490}, {:weight=>0, :text=>"B", :comments=>"", :id=>1020}, {:weight=>0, :text=>"C", :comments=>"", :id=>7051}], :question_type=>"multiple_choice_question"}]
      @quiz.save!
    end

    it "should allow previewing" 


    it "should allow previewing a quiz with an access code" 


    it "should not break trying to sanitize parameters of an already submitted quiz" 


    it "clears the access code key in user's session" 


    it "should reject a submission when the validation token does not match" 


    it "should build a new QuizSubmissionEvent" 

  end

  describe "PUT 'update'" do
    before(:once) { quiz_with_submission }
    it "should require authentication" 


    it "should allow updating scores if the teacher is logged in" 


    it "should not allow updating if the course is concluded" 

  end

  describe "PUT 'backup'" do
    before :once do
      quiz_model(:course => @course)
      @qs = @quiz.generate_submission(@student, false)
    end

    it "should require authentication" 


    it "should backup to the user's quiz submission" 


    it "should return the time left to finish a quiz" 


    it "should not backup if no submission can be found" 

  end

  describe "POST 'record_answer'" do
    before :once do
      @course = nil
      @student = nil
      quiz_with_submission(!:complete_quiz)
      @quiz.update_attribute(:one_question_at_a_time, true)
    end

    it "should require authentication" 


    it "should record the user's submission" 


    it "should redirect back to quiz after login if unauthorized" 

  end

  describe "GET / (#index)" do

    context "with a zip parameter present" do
      it "queues a job to get all attachments for all submissions of a quiz" 

    end
  end

  describe "POST / (#extension)" do
    context "as a teacher in course" do
      let_once(:quiz) { course_quiz !!:active }
      it "should be able to extend own extra attempts" 


      it "should be able to reset the result lockdown flag" 


      it "should require a valid user id" 


      it "should allow updating inactive students" 

    end
  end
end

