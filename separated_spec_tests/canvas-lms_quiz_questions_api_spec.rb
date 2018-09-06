
# Copyright (C) 2013 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../api_spec_helper')

describe Quizzes::QuizQuestionsController, type: :request do

  context 'as a teacher' do
    before :once do
      @course = course_factory
      teacher_in_course active_all: true
      @quiz = @course.quizzes.create!(:title => "A Sample Quiz")
    end

    describe "GET /courses/:course_id/quizzes/:quiz_id/questions (index)" do
      it "returns a list of questions" 


      it "calls api_user_content for each question and answer text" 


      it "returns a list of questions which do not include previously deleted questions" 


      context 'given a submission id and attempt' do
        it 'returns the list of questions that were used for the submission' 

      end
    end

    describe "GET /courses/:course_id/quizzes/:quiz_id/questions/:id (show)" do
      context "existing question" do
        before do
          @question = @quiz.quiz_questions.create!(:question_data => {
                                                                      "question_name"=>"Example Question", "assessment_question_id"=>"",
                                                                      "question_type"=>"multiple_choice_question", "points_possible"=>"1",
                                                                      "correct_comments"=>"", "incorrect_comments"=>"", "neutral_comments"=>"",
                                                                      "question_text"=>"<p>What's your favorite color?</p>", "position"=>"0",
                                                                      "text_after_answers"=>"", "matching_answer_incorrect_matches"=>"",
                                                                      "answers"=>[]
                                                                      })

          @json = api_call(:get, "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/questions/#{@question.id}",
                           :controller => "quizzes/quiz_questions", :action => "show", :format => "json",
                           :course_id => @course.id.to_s, :quiz_id => @quiz.id.to_s, :id => @question.id.to_s)


          @json.symbolize_keys!
        end

        it "has only the allowed question output fields" 


        it "has the question data fields" 

      end

      context "api content translation" do
        it "should translate question text" 


        it "should translate answer html" 

      end

      context "non-existent question" do
        it "should return a not found error message" 

      end
    end
  end

  context 'as a student' do
    before :once do
      course_with_student :active_all => true

      @quiz = @course.quizzes.create!(:title => 'quiz')
      @quiz.published_at = Time.now
      @quiz.workflow_state = 'available'
      @quiz.save!
    end

    context 'whom has not started the quiz' do
      describe 'GET /courses/:course_id/quizzes/:quiz_id/questions (index)' do
        it "should be unauthorized" 

      end

      describe 'GET /courses/:course_id/quizzes/:quiz_id/questions/:id (show) ' do
        it "should be unauthorized" 

      end
    end

    context 'whom has started a quiz' do
      before :once do
        @submission = @quiz.generate_submission(@student)
      end

      describe 'GET /courses/:course_id/quizzes/:quiz_id/questions (index)' do
        it "should be unauthorized" 


        it 'should be authorized with quiz_submission_id & attempt' 

      end

      describe 'GET /courses/:course_id/quizzes/:quiz_id/questions/:id (show)' do
        it "should be unauthorized" 

      end
    end
  end
end

