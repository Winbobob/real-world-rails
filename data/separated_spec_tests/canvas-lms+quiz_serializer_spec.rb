#
# Copyright (C) 2013 - present Instructure, Inc.
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

describe Quizzes::QuizSerializer do

  def quiz_serializer(options={})
    options.reverse_merge!({
      controller: controller,
      scope: @user,
      session: @session
    })
    Quizzes::QuizSerializer.new(@quiz, options)
  end
  let(:quiz) { @quiz }
  let(:context ) { @context }
  let(:serializer) { @serializer }
  let(:host_name) { 'example.com' }
  let(:json) { @json }
  let(:session) { @session }
  let(:controller) do
    ActiveModel::FakeController.new(accepts_jsonapi: true, stringify_json_ids: false)
  end

  before do
    @context = Account.default.courses.new
    @context.id = 1
    @quiz = Quizzes::Quiz.new title: 'test quiz', description: 'default quiz description'
    @quiz.id = 1
    @quiz.context = @context
    @user = User.new
    allow(@quiz).to receive(:locked_for?).and_return false
    allow(@quiz).to receive(:check_right?).and_return true
    @session = double(:[] => nil)
    allow(controller).to receive(:session).and_return session
    allow(controller).to receive(:context).and_return context
    allow(@quiz).to receive(:grants_right?).at_least(:once).and_return true
    allow(@context).to receive(:grants_right?).at_least(:once).and_return true
    @serializer = quiz_serializer
    @json = @serializer.as_json[:quiz]
  end

  [
    :title, :quiz_type, :hide_results, :time_limit,
    :shuffle_answers, :show_correct_answers, :scoring_policy,
    :allowed_attempts, :one_question_at_a_time, :question_count,
    :points_possible, :cant_go_back, :access_code, :ip_filter, :due_at,
    :lock_at, :unlock_at, :published, :show_correct_answers_at,
    :hide_correct_answers_at, :show_correct_answers_last_attempt,
    :has_access_code, :migration_id
  ].each do |attribute|

      it "serializes #{attribute}" 

    end

  it "serializes mobile_url" 


  it "serializes html_url" 



  describe "description" do
    it "serializes description with a formatter if given" 


    it "returns desctiption otherwise" 

  end

  describe "description for locked quiz" do
    it "returns an empty string for students" 


    it "returns description for non-students" 

  end

  it "serializes speed_grader_url" 


  it "doesn't include the section count unless the user can grade" 


  it "uses available_question_count for question_count" 


  it "sends the message_students_url when user can grade" 


  describe "access code" do
    it "is included if the user can grade" 


    it "is included if the user can manage" 


    it "is not included if the user can't grade or manage" 

  end

  describe "id" do

    it "stringifys when stringify_json_ids? is true" 


    it "when stringify_json_ids? is false" 


  end

  describe "lock_info" do
    it "includes lock_info when appropriate" 


    it "doesn't if skip_lock_tests is on" 

  end

  describe "unpublishable" do

    it "is not present unless the user can manage the quiz's assignments" 

  end

  describe "takeable" do
    before { skip }
    before do
      course_with_teacher(active_all: true)
      course_quiz(true)
      quiz_with_graded_submission([], user: @teacher, quiz: @quiz)
      @serializer = quiz_serializer(quiz_submissions: { @quiz.id => @quiz_submission })
    end

    it "is true when there is no quiz submision" 


    it "is true when quiz_submission is present but not completed" 


    it "is true when the quiz submission is completed but quiz has unlimited attempts" 


    it "is true when quiz submission is completed, !quiz.unlimited_attempts" 

  end

  describe "preview_url" do

    it "is only present when the user can grade the quiz" 

  end

  describe "links" do

    describe "assignment_group" do

      context "controller accepts_jsonapi?" do
        before { skip }

        it "serialize the assignment group's url when present" 


        it "doesn't serialize the assignment group's url if not present" 

      end

      context "controller doesn't accept jsonapi" do

        it "serialized the assignment_group as assignment_group_id" 

      end
    end

    describe "student_quiz_submissions" do
      before { skip }
      context "when user may grade" do

        it "sends the url for all submissions" 


        it "sends the url when no student_quiz_submissions are present" 


      end

      context "when user may not grade" do

        it "sends nil" 


      end

    end

    describe "quiz_submission" do
      before { skip }
      it "includes the quiz_submission in the response if it is present" 

    end

    describe 'quiz_reports' do
      it 'sends the url' 


      it 'sends the url as quiz_reports_url' 

    end

    describe "quiz_statistics" do
      it "sends the url" 


      it "sends the url in non-JSONAPI too" 

    end

    describe "submitted_students" do
      before { skip }
      it "sends nil if user can't grade" 


      it "sends a url if there are submissions and user can grade" 

    end

    describe "unsubmitted_students" do
      before { skip }
      it "sends nil if user can't grade" 


      it "sends a url if there are submissions and user can grade" 

    end
  end

  describe "quiz_submission_html_url" do
    it "includes a url to the quiz_submission html only if JSONAPI request" 

  end

  describe "quiz_submissions_zip_url" do
    it "includes a url to download all files" 


    it "doesn't if it's not a JSON-API request" 


    it "doesn't if the user may not grade" 


    it "doesn't if the quiz has no file upload questions" 

  end

  describe "permissions" do
    it "serializes permissions" 

  end

  it 'displays overridden dates for students' 


  it 'displays quiz dates for students if not overridden' 


  it 'includes all_dates for teachers and observers' 


  describe "only_visible_to_overrides" do
    context "as a teacher" do
      before :once do
        course_with_teacher(active_all: true)
        course_quiz(true)
      end

      it "returns the value for DA" 

    end

    context "as a student" do
      before :once do
        course_with_student(active_all: true)
        course_quiz(true)
      end

      it "is not in the hash" 

    end

  end

  it "includes anonymous_submisions if quiz is a survey quiz" 


  it "does not include question_types" 

end

