# Copyright (C) 2014 Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../../../models/quizzes/quiz_user_messager_spec_helper')

describe Quizzes::QuizSubmissionUsersController, type: :request do

  before :once do
    course_with_teacher(active_all: true)
  end

  def controller_options(options)
    options.reverse_merge!({
       controller: "quizzes/quiz_submission_users",
       action: "message",
       format: "json",
       course_id: @course.id,
       id: @quiz.id
    })
  end

  describe "POST message" do
    include Quizzes::QuizUserMessagerSpecHelper

    before :once do
      course_quiz(true)
      @finder = Quizzes::QuizUserFinder.new(@quiz, @teacher)
      course_with_student(active_all: true, course: @course)
      @user = @teacher
    end

    def send_message(target_group)
      raw_api_call(
        :post,
        "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/submission_users/message",
        controller_options(
          action: 'message',
          conversations: [
            { body: 'Ohi!', recipients: target_group.to_s }
          ]
        )
      )
      run_jobs
    end

    it "sends a message to unsubmitted users" 


    it "sends a message to submitted users" 

  end

  describe "GET submission_users" do
    before :once do
      @student1 = course_with_student(course: @course, active_all: true).user
      quiz_with_graded_submission([], course: @course, user: @student1)
      @student2 = course_with_student(course: @course, active_all: true).user
      @user = @teacher
    end

    def get_submitted_users(options={})
      options = controller_options(options.reverse_merge!(action: 'index'))
      raw_api_call(
        :get,
        "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/submission_users",
        options,
        { 'Accept' => 'application/json'}
      )
      JSON.parse(response.body) if response.successful?
    end

    it "does not allow students to view information at the endpoint" 


    it "allows teachers to see submitted students with ?submitted=true" 


    it "allows teachers to see unsubmitted students with ?submitted=false" 


    it "allows teachers to see all students for quiz when submitted parameter not passed" 


    it "will sideload quiz_submissions" 


    context "differentiated_assignments" do
      it "only returns submissions of students with visibility" 

    end
  end
end
