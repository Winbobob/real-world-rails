#
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

require_relative '../../api_spec_helper'

shared_examples_for 'Quiz Submissions API Restricted Endpoints' do
  it 'should require the LDB' 

end

describe Quizzes::QuizSubmissionsApiController, type: :request do

  module Helpers
    def enroll_student
      last_user = @teacher = @user
      student_in_course(active_all: true)
      @student = @user
      @user = last_user
    end

    def enroll_student_and_submit(submission_data = {})
      enroll_student
      @quiz_submission = @quiz.generate_submission(@student)
      @quiz_submission.submission_data = submission_data
      @quiz_submission.mark_completed
      Quizzes::SubmissionGrader.new(@quiz_submission).grade_submission
      @quiz_submission.reload
    end

    def make_second_attempt
      @quiz_submission.attempt = 2
      @quiz_submission.with_versioning(true, &:save!)
    end

    def normalize(value)
      value = 0 if value == 0.0
      value.to_json.to_s
    end

    def qs_api_index(raw = false, data = {})
      url = "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/submissions.json"
      params = { :controller => 'quizzes/quiz_submissions_api', :action => 'index', :format => 'json',
                 :course_id => @course.id.to_s,
                 :quiz_id => @quiz.id.to_s }
      if raw
        raw_api_call(:get, url, params, data)
      else
        api_call(:get, url, params, data)
      end
    end

    def qs_api_submission(raw = false, data = {})
      url = "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/submission.json"
      params = { :controller => 'quizzes/quiz_submissions_api',
                 :action => 'submission',
                 :format => 'json',
                 :course_id => @course.id.to_s,
                 :quiz_id => @quiz.id.to_s }
      if raw
        raw_api_call(:get, url, params, data)
      else
        api_call(:get, url, params, data)
      end
    end

    def qs_api_show(raw = false, data = {})
      url = "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/submissions/#{@quiz_submission.id}.json"
      params = { :controller => 'quizzes/quiz_submissions_api',
                 :action => 'show',
                 :format => 'json',
                 :course_id => @course.id.to_s,
                 :quiz_id => @quiz.id.to_s,
                 :id => @quiz_submission.id.to_s }
      if raw
        raw_api_call(:get, url, params, data)
      else
        api_call(:get, url, params, data)
      end
    end

    def qs_api_create(raw = false, data = {})
      url = "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/submissions"
      params = { :controller => 'quizzes/quiz_submissions_api',
                 :action => 'create',
                 :format => 'json',
                 :course_id => @course.id.to_s,
                 :quiz_id => @quiz.id.to_s }
      if raw
        raw_api_call(:post, url, params, data)
      else
        api_call(:post, url, params, data)
      end
    end

    def qs_api_complete(raw = false, data = {})
      url = "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/submissions/#{@quiz_submission.id}/complete"
      params = { :controller => 'quizzes/quiz_submissions_api',
                 :action => 'complete',
                 :format => 'json',
                 :course_id => @course.id.to_s,
                 :quiz_id => @quiz.id.to_s,
                 :id => @quiz_submission.id.to_s }
      data = {
        validation_token: @quiz_submission.validation_token
      }.merge(data)

      if raw
        raw_api_call(:post, url, params, data)
      else
        api_call(:post, url, params, data)
      end
    end

    def qs_api_update(raw = false, data = {})
      url = "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/submissions/#{@quiz_submission.id}"
      params = { :controller => 'quizzes/quiz_submissions_api',
                 :action => 'update',
                 :format => 'json',
                 :course_id => @course.id.to_s,
                 :quiz_id => @quiz.id.to_s,
                 :id => @quiz_submission.id.to_s }
      if raw
        raw_api_call(:put, url, params, data)
      else
        api_call(:put, url, params, data)
      end
    end

    def qs_api_time(raw = false, data = {})
      url = "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/submissions/#{@quiz_submission.id}/time"
      params = { :controller => 'quizzes/quiz_submissions_api',
                 :action => 'time',
                 :format => 'json',
                 :course_id => @course.id.to_s,
                 :quiz_id => @quiz.id.to_s,
                 :id => @quiz_submission.id.to_s }
      if raw
        raw_api_call(:get, url, params, data)
      else
        api_call(:get, url, params, data)
      end
    end
  end

  include Helpers

  before :once do
    course_with_teacher :active_all => true

    @quiz = Quizzes::Quiz.create!(:title => 'quiz', :context => @course)
    @quiz.published_at = Time.now
    @quiz.workflow_state = 'available'
    @quiz.save!
  end

  describe 'GET /courses/:course_id/quizzes/:quiz_id/submissions [INDEX]' do
    it 'should return an empty list' 


    it 'should return an empty list for a student' 


    it 'should list quiz submissions' 


    it 'should be accessible by the owner student' 


    it 'should show multiple attempts of the same quiz' 


    it 'should show in progress attempt only when applicable' 


    it 'should show most recent attemps of quiz to teacher' 


    it 'should restrict access to itself' 


    it 'includes submissions' 


    it 'includes submission grading_status' 


    it 'includes submission submission_status' 

  end

  describe 'GET /courses/:course_id/quizzes/:quiz_id/submission' do
    context 'as a student' do
      context 'without a submission' do
        before do
          enroll_student
          @user = @student
        end

        it 'is empty' 

      end

      context 'with a submission' do
        before do
          enroll_student_and_submit
          @user = @student
        end

        it 'returns the submission' 


        context 'with multiple attempts' do
          before do
            make_second_attempt
          end

          it 'returns the submission' 

        end
      end
    end

    context 'as a teacher' do
      context 'when a student has a submission' do
        before do
          enroll_student_and_submit
        end

        it 'does not include the student submission' 

      end
    end
  end

  describe 'GET /courses/:course_id/quizzes/:quiz_id/submissions/:id [SHOW]' do
    before :once do
      enroll_student_and_submit
    end

    it 'should grant access to its student' 


    it 'should be accessible implicitly to its own student as "self"' 


    it 'should deny access by other students' 


    context 'Output' do
      it 'should include the allowed quiz submission output fields' 


      it 'should include time spent' 


      it 'should include html_url' 


      it 'should include results_url only when completed or needs_grading' 

    end

    context 'Links' do
      it 'should include its linked user' 


      it 'should include its linked quiz' 


      it 'should include its linked submission' 


      it 'should include its linked user, quiz, and submission' 

    end

    context 'JSON-API compliance' do
      it 'should conform to the JSON-API spec when returning the object' 


      it 'should conform to the JSON-API spec when returning linked objects' 

    end
  end

  describe 'POST /courses/:course_id/quizzes/:quiz_id/submissions [create]' do
    context 'as a teacher' do
      it 'should create a preview quiz submission' 

    end

    context 'as a student' do
      before :once do
        enroll_student
        @user = @student
      end

      it 'should create a quiz submission' 


      it 'should allow the creation of multiple, subsequent QSes' 


      context 'access validations' do
        include_examples 'Quiz Submissions API Restricted Endpoints'

        before :each do
          @request_proxy = method(:qs_api_create)
        end

        it 'should reject creating a QS when one already exists' 


        it 'should respect the number of allowed attempts' 

      end

      context "unpublished module quiz" do
        before do
          student_in_course(active_all: true)
          @quiz = @course.quizzes.create! title: "Test Quiz w/ Module"
          @quiz.quiz_questions.create!(
            {
              question_data:
              {
                name: 'question',
                points_possible: 1,
                question_type: 'multiple_choice_question',
                'answers' =>
                  [
                    {'answer_text' => '1', 'weight' => '100'},
                    {'answer_text' => '2'},
                    {'answer_text' => '3'},
                    {'answer_text' => '4'}
                  ]
              }
          })
          @quiz.published_at = Time.zone.now
          @quiz.workflow_state = 'available'
          @quiz.save!
          @pre_module = @course.context_modules.create!(:name => 'pre_module')
          # No meaning in this URL
          @tag = @pre_module.add_item(:type => 'external_url', :url => 'http://example.com', :title => 'example')
          @tag.publish! if @tag.unpublished?
          @pre_module.completion_requirements = { @tag.id => { :type => 'must_view' } }
          @pre_module.save!

          locked_module = @course.context_modules.create!(name: 'locked_module', require_sequential_progress: true)
          locked_module.add_item(:id => @quiz.id, :type => 'quiz')
          locked_module.prerequisites = "module_#{@pre_module.id}"
          locked_module.save!
        end

        it "shouldn't allow access to quiz until module is completed" 


        it "should allow access to quiz once module is completed" 

      end
    end
  end

  describe 'POST /courses/:course_id/quizzes/:quiz_id/submissions/:id/complete [complete]' do
    before :once do
      enroll_student

      @quiz_submission = @quiz.generate_submission(@student)
      # @quiz_submission.submission_data = { "question_1" => "1658" }
    end

    it 'should complete a quiz submission' 


    context 'access validations' do
      include_examples 'Quiz Submissions API Restricted Endpoints'

      before do
        @request_proxy = method(:qs_api_complete)
      end

      it 'should reject completing an already complete QS' 


      it 'should require the attempt index' 


      it 'should require the current attempt index' 


      it 'should require a valid validation token' 

    end
  end

  describe 'PUT /courses/:course_id/quizzes/:quiz_id/submissions/:id [update]' do
    before :once do
      # We're gonna test with 2 questions to make sure there are no side effects
      # when we modify a single question
      @qq1 = @quiz.quiz_questions.create!({
        question_data: multiple_choice_question_data
      })

      @qq2 = @quiz.quiz_questions.create!({
        question_data: true_false_question_data
      })

      @quiz.generate_quiz_data

      enroll_student_and_submit({
        "question_#{@qq1.id}" => "1658", # correct, nr points: 50
        "question_#{@qq2.id}" => "8950"  # also correct, nr points: 45
      })

      @original_score = @quiz_submission.score # should be 95
    end

    it 'should fudge points' 


    it 'should modify a question score' 


    it 'should set a comment' 

  end

  describe "GET /courses/:course_id/quizzes/:quiz_id/submssions/:id/time" do
    now = Time.now.utc
    around(:once_and_each) do |block|
      Timecop.freeze(now) { block.call }
    end

    before :once do
      enroll_student
      @user = @student

      @quiz_submission = @quiz.generate_submission(@student)
      @quiz_submission.update_attribute(:end_at, now + 1.hour)
      Quizzes::QuizSubmission.where(:id => @quiz_submission).update_all(:updated_at => now - 1.hour)
    end
    it "should give times for the quiz" 

    it "should reject a teacher other student" 

    it "should reject another student" 

  end
end

