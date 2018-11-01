#
# Copyright (C) 2014 - present Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../../../models/quizzes/quiz_statistics/item_analysis/common')

describe Quizzes::QuizSubmissionEventsApiController, type: :request do
  require File.expand_path(File.dirname(__FILE__) + '/../../../quiz_spec_helper.rb')

  describe 'POST /courses/:course_id/quizzes/:quiz_id/submissions/:id/events [create]' do
    def api_create(options={}, data={})
      url = "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/submissions/#{@quiz_submission.id}/events"
      params = { controller: 'quizzes/quiz_submission_events_api',
                 action: 'create',
                 format: 'json',
                 course_id: @course.id.to_s,
                 quiz_id: @quiz.id.to_s,
                 id: @quiz_submission.id.to_s}
      headers = { 'Accept' => 'application/vnd.api+json' }

      if options[:raw]
        raw_api_call(:post, url, params, data, headers)
      else
        api_call(:post, url, params, data, headers)
      end
    end

    events_data = [{
      "client_timestamp" => Time.zone.now.iso8601,
      "event_type" => "question_answered",
      "event_data" => {"question_id"=>1, "answer"=>"1"}
    }, {
      "client_timestamp" => Time.zone.now.iso8601,
      "event_type" => "question_flagged",
      "event_data" => {"question_id"=>2, "flagged"=>true}
    }]

    before :once do
      course_with_teacher :active_all => true

      simple_quiz_with_submissions %w{T T T}, %w{T T T}, %w{T F F}, %w{T F T},
        :user => @user,
        :course => @course

      @user = @teacher
    end

    it 'should deny unauthorized access' 


    it "should respond with no_content success" 


    it 'should store the passed values into the DB table' 


    it "should store both client_timestamp and created_at" 


    it 'should not succeed when the QS is `settings_only`' 

  end

  describe 'GET /courses/:course_id/quizzes/:quiz_id/submissions/:id/events [index]' do
    def api_index(data={})
      url = "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/submissions/#{@quiz_submission.id}/events"
      params = { controller: 'quizzes/quiz_submission_events_api',
                 action: 'index',
                 format: 'json',
                 course_id: @course.id.to_s,
                 quiz_id: @quiz.id.to_s,
                 id: @quiz_submission.id.to_s}
      headers = { 'Accept' => 'application/vnd.api+json' }

      if data.delete(:raw)
        raw_api_call(:get, url, params, data, headers)
      else
        api_call(:get, url, params, data, headers)
      end
    end

    before :once do
      Account.default.enable_feature!(:quiz_log_auditing)
      @quiz = course_factory(active_all: true).quizzes.create!
    end

    context 'as the student who took the quiz' do
      before :once do
        student_in_course(course: @course)
      end

      it 'should not let me in' 

    end

    context 'as the teacher' do
      before(:once) do
        teacher_in_course(course: @course)
        @quiz_submission = @quiz.generate_submission(@student)
      end

      it 'should let me in' 


      context 'with a specific attempt' do
        before(:once) do
          student_in_course(course: @course)
          @quiz_submission = @quiz.generate_submission(@student)
          @quiz_submission.with_versioning(true, &:save!)

          @quiz_submission.attempt = 2
          @quiz_submission.with_versioning(true, &:save!)

          @quiz_submission.events.create!({ event_type: 'a', attempt: 1 })
          @quiz_submission.events.create!({ event_type: 'b', attempt: 2 })
          teacher_in_course(course: @course)
        end

        it 'should work' 

      end

      context 'with the latest attempt' do
        before(:once) do
          @quiz_submission = @quiz.generate_submission(@student)
          @quiz_submission.events.create!({
            event_type: 'something',
            event_data: [ 'test' ],
            attempt: 1
          })
        end

        describe 'JSON-API compliance' do
          it 'should conform to the JSON-API spec when returning the object' 

        end
      end
    end

    context 'as someone else' do
      before(:once) do
        student_in_course(course: @course)
        user_factory(active_all: true)

        @quiz_submission = @quiz.generate_submission(@student)
      end

      it 'should not let me in' 

    end
  end
end

