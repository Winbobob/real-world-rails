#
# Copyright (C) 2012 - present Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../../locked_spec')
require File.expand_path(File.dirname(__FILE__) + '/../../../file_upload_helper')


describe Quizzes::QuizzesApiController, type: :request do

  include FileUploadHelper

  context 'locked api item' do
    let(:item_type) { 'quiz' }

    let(:locked_item) do
      quiz = @course.quizzes.create!(:title => 'Locked Quiz')
      quiz.publish!
      quiz
    end

    def api_get_json
      api_call(
        :get,
        "/api/v1/courses/#{@course.id}/quizzes/#{locked_item.id}",
        {:controller=>'quizzes/quizzes_api', :action=>'show', :format=>'json', :course_id=>"#{@course.id}", :id => "#{locked_item.id}"},
      )
    end

    include_examples 'a locked api item'
  end

  describe "GET /courses/:course_id/quizzes (index)" do
    let(:quizzes) { (0..3).map { |i| @course.quizzes.create! :title => "quiz_#{i}"} }

    before(:once) { teacher_in_course(:active_all => true) }

    before do
      quizzes
    end

    context 'as a teacher' do
      subject do
        api_call(:get,
                 "/api/v1/courses/#{@course.id}/quizzes",
                 controller: "quizzes/quizzes_api",
                 action: "index",
                 format: "json",
                 course_id: "#{@course.id}")
      end

      it "should return list of quizzes" 


      it 'should not be able to take quiz' 


      describe 'search_term query param' do
        let(:search_term) { 'waldo' }
        let(:quizzes_with_search_term) { (0..2).map { |i| @course.quizzes.create! :title => "#{search_term}_#{i}" } }
        let(:quizzes_without_search_term) { (0..2).map { |i| @course.quizzes.create! :title => "quiz_#{i}" } }
        let(:quizzes) { quizzes_with_search_term + quizzes_without_search_term }

        it "should search for quizzes by title" 

      end

      context 'quizzes with the same title' do
        let(:quiz_count) { 10 }
        let(:quizzes) { (0..quiz_count).map { @course.quizzes.create! :title => "the same title" } }

        it "should deterministically order quizzes for pagination" 

      end

      context "jsonapi style" do
        it "renders a jsonapi style response" 

      end
    end

    context 'as a student' do
      before(:once) { student_in_course(:active_all => true) }

      context 'quiz tab is disabled' do
        before do
          @course.tab_configuration = [{ :id => Course::TAB_QUIZZES, :hidden => true }]
          @course.save!
        end

        it "should return unauthorized" 

      end

      context 'a published quiz' do
        let(:published_quiz) { quizzes.first }

        before do
          published_quiz.publish!
        end

        subject do
          api_call(:get,
                   "/api/v1/courses/#{@course.id}/quizzes",
                   controller: 'quizzes/quizzes_api',
                   action: 'index',
                   format: 'json',
                   course_id: "#{@course.id}")
        end

        it "only returns published quizzes" 


        it 'should be able to take quiz' 


        context "jsonapi style" do
          it "only returns published quizzes" 

        end
      end
    end
  end

  describe "GET /courses/:course_id/quizzes/:id (show)" do
    before(:once) { course_with_teacher(:active_all => true, :course => @course) }

    context "unpublished quiz" do
      before do
        @quiz = @course.quizzes.create! :title => 'title'
        @quiz.quiz_questions.create!(:question_data => { :name => "test 1" })
        @quiz.save!

        @json = api_call(:get, "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}",
                        :controller=>"quizzes/quizzes_api", :action=>"show", :format=>"json", :course_id=>"#{@course.id}", :id => "#{@quiz.id}")
      end

      it "includes unpublished questions in question count" 

    end

    context "jsonapi style request" do

      it "renders in a jsonapi style" 

    end

    context "non-jsonapi style request" do
      let(:quiz) { @course.quizzes.create! title: 'Test Quiz' }
      let(:json) do
        json = api_call(:get, "/api/v1/courses/#{@course.id}/quizzes/#{quiz.id}",
          { :controller=>"quizzes/quizzes_api", :action=>"show", :format=>"json", :course_id=>"#{@course.id}", :id => "#{quiz.id}"}, {})
        json.with_indifferent_access
      end

      it "renders with QuizApiSerializer" 

    end

    context "non-existent quiz" do
      it "should return a not found error message" 

    end
  end

  describe "POST /courses/:course_id/quizzes (create)" do
    def api_create_quiz(quiz_params, opts={})
      api_call(:post, "/api/v1/courses/#{@course.id}/quizzes",
              {:controller=>"quizzes/quizzes_api", :action => "create", :format=>"json", :course_id=>"#{@course.id}"},
              {:quiz => quiz_params}, {}, opts)
    end

    before(:once) { teacher_in_course(:active_all => true) }

    let (:new_quiz) { @course.quizzes.first }

    context "jsonapi style request" do

      it "renders in a jsonapi style" 

    end

    it "creates a quiz for the course" 


    it "doesn't allow setting fields not in the whitelist" 


    it "allows creating a published quiz" 


    it "renders an error when the title is too long" 


    describe "validations" do
      context "assignment_group_id" do
        let_once(:my_group) { @course.assignment_groups.create! :name => 'my group' }
        let_once(:other_course) { Course.create! :name => 'other course' }
        let_once(:other_group) { other_course.groups.create! :name => 'other group' }

        it "should put the quiz in a group owned by its course" 


        it "should not put the quiz in a group not owned by its course" 

      end

      context "hide_results" do
        it "should set hide_results='until_after_last_attempt' if allowed_attempts > 1" 


        it "should not hide_results='until_after_last_attempt' if allowed_attempts == 1" 


        it "should not hide_results='until_after_last_attempt' if allowed_attempts < 1" 

      end

      context "show_correct_answers" do
        it "should be set if hide_results is disabled" 


        it "should be ignored if hide_results is enabled" 

      end

      context 'show_correct_answers_last_attempt' do
        it 'should be settable if show_correct_answers is on and allowed_attempts > 1' 


        it 'should be ignored otherwise' 

      end

      context "scoring_policy" do
        it "should set scoring policy if allowed_attempts > 1" 


        it "should not set scoring policy if allowed_attempts == 1" 


        it "should not set scoring policy if allowed_attempts > 1" 

      end

      context "cant_go_back" do
        it "should set cant_go_back if one_question_at_a_time is true" 


        it "should not set cant_go_back if one_question_at_a_time is not true" 

      end

      context 'time_limit' do
        it 'should discard negative values' 

      end

      context 'allowed_attempts' do
        it 'should discard values less than -1' 

      end

      it 'removes domain from URLs in description' 

    end

    context "with grading periods" do
      def call_create(params, expected_status)
        api_call_as_user(
          @current_user,
          :post, "/api/v1/courses/#{@course.id}/quizzes",
          {
            controller: "quizzes/quizzes_api",
            action: "create",
            format: "json",
            course_id: @course.id.to_s
          },
          { quiz: { title: "Example Title", quiz_type: "assignment" }.merge(params) },
          {},
          { expected_status: expected_status }
        )
      end

      before :once do
        teacher_in_course(active_all: true)
        grading_period_group = Factories::GradingPeriodGroupHelper.new.create_for_account(@course.root_account)
        term = @course.enrollment_term
        term.grading_period_group = grading_period_group
        term.save!
        Factories::GradingPeriodHelper.new.create_for_group(grading_period_group, {
          start_date: 2.weeks.ago, end_date: 2.days.ago, close_date: 1.day.ago
        })
        account_admin_user(account: @course.root_account)
      end

      context "when the user is a teacher" do
        before :each do
          @current_user = @teacher
        end

        it "allows setting the due date in an open grading period" 


        it "does not allow setting the due date in a closed grading period" 


        it "allows setting the due date in a closed grading period when only visible to overrides" 


        it "does not allow a nil due date when the last grading period is closed" 


        it "allows a due date in a closed grading period when the quiz is not graded" 


        it "allows a nil due date when not graded and the last grading period is closed" 

      end

      context "when the user is an admin" do
        before :each do
          @current_user = @admin
        end

        it "allows setting the due date in a closed grading period" 


        it "allows a nil due date when the last grading period is closed" 

      end
    end
  end

  describe "DELETE /courses/:course_id/quizzes/id (destroy)" do
    it "deletes a quiz" 

  end

  describe "PUT /courses/:course_id/quizzes/:id (update)" do
    def api_update_quiz(quiz_params, api_params, opts={})
      @quiz ||= @course.quizzes.create!({:title => 'title'}.merge(quiz_params))
      api_call(:put, "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}",
              {:controller=>"quizzes/quizzes_api", :action => "update", :format=>"json", :course_id=>"#{@course.id}", :id=>"#{@quiz.id}"},
              {:quiz => api_params}, {}, opts)
    end

    before { teacher_in_course(:active_all => true) }

    let (:updated_quiz) { @course.quizzes.first }
    let (:quiz_params) { {} }

    it "updates quiz attributes" 


    it "allows quiz attribute \'only_visible_to_overrides\' to be updated to true with PUT request " 


    it "allows quiz attribute \'only_visible_to_overrides\' to be updated to false with PUT request " 


    it 'removes domain from URLs' 


    context "jsonapi style request" do

      it "renders in a jsonapi style" 

    end

    it "doesn't allow setting fields not in the whitelist" 


    it "renders an error when the title is too long" 


    context 'anonymous_submissions' do
      it "updates anonymous_submissions" 

    end

    context 'points_possible' do
      it "updates points_possible for graded surveys" 

    end

    context 'lockdown_browser' do
      before :once do
        # require_lockdown_browser, require_lockdown_browser_for_results and
        # require_lockdown_browser_monitor will only return true if the plugin is enabled,
        # so register and enable it for these test
        Canvas::Plugin.register(:example_spec_lockdown_browser, :lockdown_browser, {
                :settings => {:enabled => false}})
        setting = PluginSetting.create!(name: 'example_spec_lockdown_browser')
        setting.settings = {:enabled => true}
        setting.save!
      end

      it 'should allow setting require_lockdown_browser' 


      it 'should allow setting require_lockdown_browser_for_results' 


      it 'should allow setting require_lockdown_browser_monitor' 


      it 'should allow setting lockdown_browser_monitor_data' 

    end

    context "draft state changes" do

      it "allows un/publishing an unpublished quiz" 


      it "should not lose quiz question count when publishing with draft state" 

    end

    describe "validations" do
      context "hide_results" do
        it "should set hide_results='until_after_last_attempt' if allowed_attempts > 1" 


        it "should not hide_results='until_after_last_attempt' if allowed_attempts == 1" 


        it "should not hide_results='until_after_last_attempt' if allowed_attempts < 1" 

      end

      context "show_correct_answers" do
        it "should save show_correct_answers if hide_results is null" 


        it "should not save show_correct_answers if hide_results is not null" 

      end

      context "scoring_policy" do
        it "should set scoring policy if allowed_attempts > 1" 


        it "should not set scoring policy if allowed_attempts == 1" 


        it "should not set scoring policy if allowed_attempts > 1" 

      end

      context "cant_go_back" do
        it "should set cant_go_back if one_question_at_a_time is true" 


        it "should not set cant_go_back if one_question_at_a_time is not true" 

      end

      context 'time_limit' do
        it 'should discard negative values' 

      end

      context 'allowed_attempts' do
        it 'should discard values less than -1' 

      end
    end

    context "with grading periods" do
      def create_quiz(attr)
        @course.quizzes.create!({ title: "Example Quiz", quiz_type: "assignment" }.merge(attr))
      end

      def override_for_date(date)
        override = @quiz.assignment_overrides.build
        override.set_type = "CourseSection"
        override.due_at = date
        override.due_at_overridden = true
        override.set_id = @course.course_sections.first
        override.save!
        override
      end

      def call_update(params, expected_status)
        api_call_as_user(
          @current_user,
          :put, "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}",
          {
            controller: "quizzes/quizzes_api",
            action: "update",
            format: "json",
            course_id: @course.id.to_s,
            id: @quiz.to_param
          },
          { quiz: params },
          {},
          { expected_status: expected_status }
        )
      end

      before :once do
        teacher_in_course(active_all: true)
        grading_period_group = Factories::GradingPeriodGroupHelper.new.create_for_account(@course.root_account)
        term = @course.enrollment_term
        term.grading_period_group = grading_period_group
        term.save!
        Factories::GradingPeriodHelper.new.create_for_group(grading_period_group, {
          start_date: 2.weeks.ago, end_date: 2.days.ago, close_date: 1.day.ago
        })
        account_admin_user(account: @course.root_account)
      end

      context "when the user is a teacher" do
        before :each do
          @current_user = @teacher
        end

        it "should allow changing due_at and lock_at with 'fancy midnight'" 


        it "should allow changing due_at with 'fancy midnight'" 


        it "should allow changing lock_at with 'fancy midnight'" 


        it "allows changing the due date to another date in an open grading period" 


        it "allows dates within the same minute to be considered equal" 


        it "allows changing the due date when the quiz is only visible to overrides" 


        it "allows disabling only_visible_to_overrides when due in an open grading period" 


        it "allows enabling only_visible_to_overrides when due in an open grading period" 


        it "does not allow disabling only_visible_to_overrides when due in a closed grading period" 


        it "does not allow enabling only_visible_to_overrides when due in a closed grading period" 


        it "allows disabling only_visible_to_overrides when changing due date to an open grading period" 


        it "does not allow changing the due date on a quiz due in a closed grading period" 


        it "does not allow changing the due date to a date within a closed grading period" 


        it "does not allow unsetting the due date when the last grading period is closed" 


        it "succeeds when the due date is set to the same value" 


        it "succeeds when the due date is not changed" 


        it "allows changing the due date when the quiz is not graded" 


        it "allows unsetting the due date when not graded and the last grading period is closed" 


        it "allows changing the due date on a quiz with an override due in a closed grading period" 

      end

      context "when the user is an admin" do
        before :each do
          @current_user = @admin
        end

        it "does not allow disabling only_visible_to_overrides when due in a closed grading period" 


        it "does not allow enabling only_visible_to_overrides when due in a closed grading period" 


        it "allows changing the due date on a quiz due in a closed grading period" 


        it "allows changing the due date on a quiz with an override due in a closed grading period" 


        it "allows changing the due date to a date within a closed grading period" 


        it "allows unsetting the due date when the last grading period is closed" 

      end
    end
  end

  describe "POST /courses/:course_id/quizzes/:id/reorder (reorder)" do
    before :once do
      teacher_in_course(:active_all => true)
      @quiz  = @course.quizzes.create! :title => 'title'
      @question1 = @quiz.quiz_questions.create!(:question_data => {'name' => 'test question 1', 'answers' => [{'id' => 1}, {'id' => 2}], :position => 1})
      @question2 = @quiz.quiz_questions.create!(:question_data => {'name' => 'test question 2', 'answers' => [{'id' => 3}, {'id' => 4}], :position => 2})
      @question3 = @quiz.quiz_questions.create!(:question_data => {'name' => 'test question 3', 'answers' => [{'id' => 5}, {'id' => 6}], :position => 3})
    end

    it "should require authorization" 


    it "should reorder a quiz's questions" 


    it "should reorder a quiz's questions and groups" 


    it "should pull questions out of a group to the root quiz" 

  end

  describe "POST /courses/:course_id/quizzes/:id/validate_access_code" do
    before :once do
      teacher_in_course(:active_all => true)
      @quiz = @course.quizzes.create!
    end

    it "should return false if no access code" 


    it "should return false on an incorrect access code" 


    it "should return true on a correct access code" 


  end

  describe "differentiated assignments" do
    def calls_display_quiz(quiz, _opts={except: []})
      get_index(quiz.context)
      expect(JSON.parse(response.body).to_s).to include("#{quiz.title}")
      get_show(quiz)
      expect(JSON.parse(response.body).to_s).to include("#{quiz.title}")
    end

    def calls_do_not_show_quiz(quiz)
      get_index(quiz.context)
      expect(JSON.parse(response.body).to_s).not_to include("#{quiz.title}")
      get_show(quiz)
      assert_status(401)
    end

    def get_index(course)
      raw_api_call(:get, "/api/v1/courses/#{course.id}/quizzes",
                   :controller => "quizzes/quizzes_api",
                   :action => "index",
                   :format => "json",
                   :course_id => "#{course.id}")
    end

    def get_show(quiz)
      raw_api_call(:get, "/api/v1/courses/#{quiz.context.id}/quizzes/#{quiz.id}",
                        :controller=>"quizzes/quizzes_api", :action=>"show", :format=>"json", :course_id=>"#{quiz.context.id}", :id => "#{quiz.id}")
    end

    def create_quiz_for_da(opts={})
      @quiz = Quizzes::Quiz.create!({
        context: @course,
        description: 'descript foo',
        only_visible_to_overrides: opts[:only_visible_to_overrides],
        points_possible: rand(1000),
        title: opts[:title]
      })
      @quiz.publish
      @quiz.save!
      @assignment = @quiz.assignment
      @quiz
    end

    before(:once) do
      course_with_teacher(:active_all => true, :user => user_with_pseudonym)
      @student_with_override, @student_without_override= create_users(2, return_type: :record)

      @quiz_with_restricted_access = create_quiz_for_da(title: "only visible to student one", only_visible_to_overrides: true)
      @quiz_visible_to_all = create_quiz_for_da(title: "assigned to all", only_visible_to_overrides: false)

      @course.enroll_student(@student_without_override, :enrollment_state => 'active')
      @section = @course.course_sections.create!(name: "test section")
      student_in_section(@section, user: @student_with_override)
      create_section_override_for_quiz(@quiz_with_restricted_access, {course_section: @section})

      @observer = User.create
      @observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment', :section => @course.course_sections.first, :enrollment_state => 'active')
      @observer_enrollment.update_attribute(:associated_user_id, @student_with_override.id)
    end

    it "lets the teacher see all quizzes" 


    it "lets students with visibility see quizzes" 


    it 'gives observers the same visibility as their student' 


    it 'observers without students see all' 


    it "restricts access to students without visibility" 


    it "doesnt show extra assignments with overrides in the index" 

  end
end

