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

describe OutcomesController do
  def context_outcome(context)
    @outcome_group ||= context.root_outcome_group
    @outcome = context.created_learning_outcomes.create!(:title => 'outcome')
    @outcome_group.add_outcome(@outcome)
  end

  def course_outcome
    context_outcome(@course)
  end

  def account_outcome
    context_outcome(@account)
  end

  before :once do
    course_with_teacher(active_all: true)
    student_in_course(active_all: true)
    @account = Account.default
    account_admin_user
  end

  describe "GET 'index'" do
    it "should require authorization" 


    it "should redirect 'disabled', if disabled by the teacher" 


    it "should assign variables" 


    it "should work in accounts" 


    it "should find a common core group from settings" 

  end

  describe "GET 'show'" do
    it "should require authorization" 


    it "should not allow students to view outcomes" 


    it "should assign variables" 


    it "should work in accounts" 


    it "should include tags from courses when viewed in the account" 


    it "should not allow access to individual outcomes for large_roster courses" 

  end

  describe "GET 'details'" do
    it "should require authorization" 


    it "should assign variables" 


    it "should work in accounts" 

  end

  describe "GET 'user_outcome_results'" do
    it "should require authorization" 


    it "should return outcomes for the given user" 

  end

  describe "GET 'list'" do
    it "should list account outcomes for an account context" 


    it "should list account outcomes for a subaccount context" 


    it "should list account outcomes for a course context" 

  end

  describe "POST 'create'" do
    before :once do
      OUTCOME_PARAMS = {
        :description => "A long description",
        :short_description => "A short description"
      }
    end

    it "should require authorization" 


    it "should not let a student create a outcome" 


    it "should allow creating a new outcome with the root group" 


    it "should allow creating a new outcome with a specific group" 

  end

  describe "PUT 'update'" do
    TEST_STRING = "Some test String"

    before :each do
      course_outcome
    end

    it "should require authorization" 


    it "should not let a student update the outcome" 


    it "should allow updating the outcome" 

  end

  describe "DELETE 'destroy'" do
    before :each do
      course_outcome
    end

    it "should require authorization" 


    it "should not let a student delete the outcome" 


    it "should delete the outcome from the database" 

  end

  describe "GET 'outcome_result" do
    before :each do
      course_outcome
    end

    context "with a quiz result" do
      before :each do
        assessment_question_bank_with_questions
        @outcome.align(@bank, @bank.context, :mastery_score => 0.7)

        @quiz = @course.quizzes.create!(:title => "a quiz")
        @quiz.add_assessment_questions [ @q1, @q2 ]

        @submission = @quiz.generate_submission @student
        @submission.quiz_data = @quiz.generate_quiz_data
        @submission.mark_completed
        Quizzes::SubmissionGrader.new(@submission).grade_submission
      end

      it "should require teacher authorization" 


      it "should redirect to show quiz when result is a quiz" 

    end
  end
end

