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

describe Quizzes::QuizzesController do

  def course_quiz(active=false)
    @quiz = @course.quizzes.create
    @quiz.workflow_state = "available" if active
    @quiz.save!
    @quiz
  end

  def quiz_question
    @quiz.quiz_questions.create
  end

  def quiz_group
    @quiz.quiz_groups.create
  end

  def temporary_user_code(generate=true)
    if generate
      session[:temporary_user_code] ||= "tmp_#{Digest::MD5.hexdigest("#{Time.now.to_i}_#{rand}")}"
    else
      session[:temporary_user_code]
    end
  end

  def logged_out_survey_with_submission(user, questions, &block)
    user_session(@teacher)

    @assignment = @course.assignments.create(:title => "Test Assignment")
    @assignment.workflow_state = "available"
    @assignment.submission_types = "online_quiz"
    @assignment.save
    @quiz = Quizzes::Quiz.where(assignment_id: @assignment).first
    @quiz.anonymous_submissions = false
    @quiz.quiz_type = "survey"

    @questions = questions.map { |q| @quiz.quiz_questions.create!(q) }
    @quiz.generate_quiz_data
    @quiz.save!

    @quiz_submission = @quiz.generate_submission(user)
    @quiz_submission.mark_completed
    @quiz_submission.submission_data = yield if block_given?
    Quizzes::SubmissionGrader.new(@quiz_submission).grade_submission
    @quiz_submission.save!
  end

  before :once do
    course_with_teacher(:active_all => true)
    student_in_course(:active_all => true)
    @student2 = @student
    student_in_course(:active_all => true)
  end

  describe "GET 'index'" do
    it "should require authorization" 


    it "should redirect 'disabled', if disabled by the teacher" 


    it "should assign JS variables" 


    it "should filter out unpublished quizzes for student" 


    it 'should implicitly grade outstanding submissions for user in course' 


    it "js_env SIS_INTEGRATION_SETTINGS_ENABLED is true when AssignmentUtil.sis_integration_settings_enabled? == true" 


    it "js_env SIS_INTEGRATION_SETTINGS_ENABLED is false when AssignmentUtil.sis_integration_settings_enabled? == false" 


    it "js_env SIS_NAME is Foo Bar when AssignmentUtil.post_to_sis_friendly_name is Foo Bar" 


    it "js_env migrate_quiz_enabled is false when only quizzes_next is enabled" 


    it "js_env migrate_quiz_enabled is true when quizzes_next is enabled and quiz LTI apps present" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.due_date_required_for_account? == true" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.due_date_required_for_account? == false" 


    it "js_env MAX_NAME_LENGTH_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.name_length_required_for_account? == true" 


    it "js_env MAX_NAME_LENGTH_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.name_length_required_for_account? == false" 

  end

  describe "POST 'new'" do
    context "when unauthorized" do
      it "should require authorization" 

    end

    context "when authorized" do
      before { user_session(@teacher) }

      it "creates a quiz" 


      it "redirects to the new quiz" 


      context "if xhr request" do
        it "returns the new quiz's edit url" 

      end
    end
  end

  describe "GET 'edit'" do
    before(:once) { course_quiz }

    include_context "grading periods within controller" do
      let(:course) { @course }
      let(:teacher) { @teacher }
      let(:request_params) { [:edit, params: {course_id: course, id: @quiz}] }
    end

    it "should require authorization" 


    it "should assign variables" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.due_date_required_for_account? == true" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.due_date_required_for_account? == false" 


    it "js_env MAX_NAME_LENGTH_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.name_length_required_for_account? == true" 


    it "js_env MAX_NAME_LENGTH_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.name_length_required_for_account? == false" 


    it "js_env MAX_NAME_LENGTH is a 15 when AssignmentUtil.assignment_max_name_length returns 15" 


    context "conditional release" do
      before do
        allow(ConditionalRelease::Service).to receive(:env_for).and_return({ dummy: 'charliemccarthy' })
      end

      it "should define env when enabled" 


      it "should not define env when not enabled" 

    end
  end

  describe "GET 'show'" do
    it "should require authorization" 


    it "should assign variables" 


    it "should set the submission count variables" 


    it "should allow forcing authentication on public quiz pages" 


    it "should set session[headless_quiz] if persist_headless param is sent" 


    it "should not render headers if session[:headless_quiz] is set" 


    it "assigns js_env for attachments if submission is present" 


    it "assigns js_env for versions if submission is present" 


    it "doesn't show unpublished quizzes to students with draft state" 


    it 'logs a single asset access entry with an action level of "view"' 


    it "locks results if there is a submission and one_time_results is on" 


    it "does not attempt to lock results if there is a settings only submission" 


    context "with non-utf8 multiple dropdown question" do
      render_views

      let(:answer) do
        {
          'id' => rand(1..999),
          'text' => "\b你好", # the \b causes psych to store this as a binary string
          'blank_id' => 'blank'
        }
      end

      before do
        course_quiz(true)

        @quiz.quiz_questions.create!(question_data: {
          'question_type' => 'multiple_dropdowns_question',
          'question_text' => '<p>Hello in Chinese is [blank]</p>',
          'answers' => [answer]
        })
        @quiz.generate_quiz_data
        @quiz.save!
      end

      it "renders preview without error" 

    end
  end

  describe "GET 'managed_quiz_data'" do
    it "should respect section privilege limitations" 


    it "should include survey results from logged out users in a public course" 


    it "should include survey results from a logged-in user in a public course" 


    it "should not include teacher previews" 


    context "differentiated_assignments" do
      it "only returns submissions and users when there is visibility" 

    end
  end

  describe "GET 'moderate'" do
    before(:once) { course_quiz }
    it "should require authorization" 


    context 'student_filters' do
      before do
        user_session(@teacher)
        5.times.map do |i|
          name = "#{(i + 'a'.ord).chr}_student"
          course_with_student(name: name, course: @course)
          @student
        end
      end

      it "should sort students" 


      it "should filter students" 

    end

    it "should assign variables" 


    it "should respect section privilege limitations" 


    it 'should not show duplicate students if they are enrolled in multiple sections' 

  end

  describe "POST 'take'" do
    it "should require authorization" 


    it "should allow taking the quiz" 


    context 'asset access logging' do
      before :once do
        Setting.set('enable_page_views', 'db')

        course_quiz
      end

      before :each do
        user_session(@teacher)
      end

      it 'should log a single entry with an action level of "participate"' 


      it 'should not log entries when resuming the quiz' 

    end

    context 'verification' do
      before :once do
        course_quiz(true)
        @quiz.access_code = 'bacon'
        @quiz.save!
      end

      before :each do
        user_session(@student)
      end

      it "should render verification page if password required" 


      it "shouldn't let you in on a bad access code" 


      it "should send you to take with the right access code" 


      it "should not ask for the access code again if you reload the quiz" 

    end

    it "should not let them take the quiz if it's locked" 


    it "should let them take the quiz if it's locked but unlocked by an override" 


    it "should let them take the quiz if it's locked but they've been explicitly unlocked" 


    it "should use default duration if no extensions specified" 


    it "should give user more time if specified" 


    it "should render ip_filter page if ip_filter doesn't match" 


    it "should let the user take the quiz if the ip_filter matches" 


    it "should work without a user for non-graded quizzes in public courses" 

  end

  describe "GET 'take'" do
    before :once do
      course_quiz(true)
    end

    it "should require authorization" 


    it "should render the quiz page if the user hasn't started the quiz" 


    it "should render ip_filter page if the ip_filter stops matching" 


    it "should allow taking the quiz" 


    context "when the ID of a question is passed in" do
      before :once do
        @quiz.generate_submission(@student)
      end

      before :each do
        user_session(@student)
      end

      context "a valid question" do
        it "renders take_quiz" 

      end

      context "a question not in this quiz" do
        it "redirects to the main quiz page" 

      end
    end

    describe "valid_question?" do
      let(:submission) { double }

      context "when the passed in question ID is in the submission" do
        it "returns true" 

      end

      context "when the question ID isn't part of the submission" do
        it "returns false" 

      end
    end
  end

  describe "GET 'history'" do
    before :once do
      course_quiz
    end

    it "should require authorization" 


    it "should redirect if there are no submissions for the user" 


    it "should assign variables" 


    it "mark read if the student is viewing his own quiz history" 


    it "don't mark read if viewing *someone else's* history" 


    it "should find the observed submissions" 


    it "should not allow viewing other submissions if not a teacher" 


    it "should allow viewing other submissions if a teacher" 


    context "when assignment is muted" do
      before do
        @quiz.generate_quiz_data
        @quiz.workflow_state = 'available'
        @quiz.published_at = Time.zone.now
        @quiz.save!
        @quiz.assignment.mute!
      end

      it "should not allow student viewing" 


      it "should allow teacher viewing" 


      it "should allow teacher viewing if the term has ended" 


      it "should allow teacher viewing if the enrollment is concluded" 

    end

    context "with non-utf8 submission data" do
      render_views

      before do
        course_quiz(true)

        @question = @quiz.quiz_questions.create!(question_data: {
          'question_text' => '<p>[color]是我最喜欢的颜色</p>',
          'question_type' => 'fill_in_multiple_blanks_question',
          'answers' => [{
            'id' => rand(1..999).to_s,
            'text' => '红色',
            'blank_id' => 'color'
          }]
        })
        @quiz.generate_quiz_data
        @quiz.save!
      end

      it "should render without error" 

    end
  end

  describe "POST 'create'" do
    it "should require authorization" 


    it "should not allow students to create quizzes" 


    it "should create quiz" 


    it "creates quizzes with overrides" 


    it "does not dispatch assignment-created notifications for unpublished quizzes" 


    context "with grading periods" do
      def call_create(params)
        post('create', params: {course_id: @course.id, quiz: {
          title: "Example Quiz", quiz_type: "assignment"
        }.merge(params)})
      end

      let(:section_id) { @course.course_sections.first.id }

      before :once do
        teacher_in_course(active_all: true)
        grading_period_group = Factories::GradingPeriodGroupHelper.new.create_for_account(@course.root_account)
        term = @course.enrollment_term
        term.grading_period_group = grading_period_group
        term.save!
        Factories::GradingPeriodHelper.new.create_for_group(grading_period_group, {
          start_date: 2.weeks.ago, end_date: 2.days.ago, close_date: 1.day.ago
        })
        @course.assignment_groups.create!(name: "Example Assignment Group")
        account_admin_user(account: @course.root_account)
      end

      context "when the user is a teacher" do
        before :each do
          user_session(@teacher)
        end

        it "allows setting the due date in an open grading period" 


        it "does not allow setting the due date in a closed grading period" 


        it "allows setting the due date in a closed grading period when only visible to overrides" 


        it "does not allow a nil due date when the last grading period is closed" 


        it "allows a due date in a closed grading period when the quiz is not graded" 


        it "allows a nil due date when not graded and the last grading period is closed" 


        it "does not allow setting an override due date in a closed grading period" 


        it "does not allow a nil override due date when the last grading period is closed" 

      end

      context "when the user is an admin" do
        before :each do
          user_session(@admin)
        end

        it "allows setting the due date in a closed grading period" 


        it "allows setting an override due date in a closed grading period" 


        it "allows a nil due date when the last grading period is closed" 


        it "allows a nil override due date when the last grading period is closed" 

      end
    end
  end

  describe "PUT 'update'" do
    it "should require authorization" 


    it "should not allow students to update quizzes" 


    it "should update quizzes" 


    it "should lock if asked to" 


    it "should publish if asked to" 


    it "should not publish if not asked to" 


    context 'post_to_sis' do
      before { @course.enable_feature!(:post_grades) }

      it "should set post_to_sis quizzes" 


      it "doesn't blow up for surveys" 

    end

    it "should be able to change ungraded survey to quiz without error" 


    it "should lock and unlock without removing assignment" 


    it "updates overrides for a quiz" 


    describe "DueDateCacher" do
      before :each do
        user_session(@teacher)
        @quiz = @course.quizzes.build( :title => "Update Overrides Quiz")
        @quiz.save!
        section = @course.course_sections.build
        section.save!
        course_due_date = 3.days.from_now.iso8601
        section_due_date = 5.days.from_now.iso8601
        @quiz.save!

        @quiz_only = {
          course_id: @course.id,
          id: @quiz.id,
          quiz: {
            title: "overridden quiz",
            due_at: course_due_date,
            assignment_overrides: [
              {
                course_section_id: section.id,
                due_at: section_due_date,
                due_at_overridden: true
              }
            ]
          }
        }

        @overrides_only = {
          course_id: @course.id,
          id: @quiz.id,
          quiz: {
            assignment_overrides: [
              {
                course_section_id: section.id,
                due_at: section_due_date,
                due_at_overridden: true
              }
            ]
          }
        }

        @quiz_and_overrides = {
          course_id: @course.id,
          id: @quiz.id,
          quiz: {
            assignment_overrides: [
              {
                course_section_id: section.id,
                due_at: section_due_date,
                due_at_overridden: true
              }
            ]
          }
        }

        @no_changes = {
          course_id: @course.id,
          id: @quiz.id,
          quiz: {
            assignment_overrides: []
          }
        }
      end

      it "runs DueDateCacher only once when overrides are updated" 


      it "runs DueDateCacher only once when quiz due date is updated" 


      it "runs DueDateCacher only once when quiz due date and overrides are updated" 


      it "does not runs DueDateCacher when nothing is updated" 

    end

    it "deletes overrides for a quiz if assignment_overrides params is 'false'" 


    it 'updates the quiz with the correct times for fancy midnight' 


    it "should accept a hash value for 'hide_results'" 


    context 'notifications' do
      before :once do
        @notification = Notification.create(:name => 'Assignment Due Date Changed')

        @section = @course.course_sections.create!

        @student.communication_channels.create(:path => "student@instructure.com").confirm!
        @student.email_channel.notification_policies.create!(notification: @notification,
                                                             frequency: 'immediately')

        course_quiz
        @quiz.generate_quiz_data
        @quiz.workflow_state = 'available'
        @quiz.published_at = Time.now
        @quiz.save!

        @quiz.update_attribute(:created_at, 1.day.ago)
        @quiz.assignment.update_attribute(:created_at, 1.day.ago)
      end

      before :each do
        user_session(@teacher)
      end

      it "should send due date changed if notify_of_update is set" 


      it "should send due date changed if notify_of_update is not set" 

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

      def call_update(params)
        post('update', params: {course_id: @course.id, id: @quiz.id, quiz: params})
      end

      let(:section_id) { @course.course_sections.first.id }

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
          user_session(@teacher)
        end

        it "allows changing the due date to another date in an open grading period" 


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


        it "allows adding an override with a due date in an open grading period" 


        it "does not allow adding an override with a due date in a closed grading period" 


        it "does not allow changing the due date of an override due in a closed grading period" 


        it "succeeds when the override due date is set to the same value" 


        it "does not allow changing the due date of an override to a date within a closed grading period" 


        it "does not allow unsetting the due date of an override when the last grading period is closed" 


        it "does not allow deleting by omission an override due in a closed grading period" 

      end

      context "when the user is an admin" do
        before :each do
          user_session(@admin)
        end

        it "does not allow disabling only_visible_to_overrides when due in a closed grading period" 


        it "does not allow enabling only_visible_to_overrides when due in a closed grading period" 


        it "allows changing the due date on a quiz due in a closed grading period" 


        it "allows changing the due date to a date within a closed grading period" 


        it "allows unsetting the due date when the last grading period is closed" 


        it "allows changing the due date on a quiz with an override due in a closed grading period" 


        it "allows adding an override with a due date in a closed grading period" 


        it "allows changing the due date of an override due in a closed grading period" 


        it "allows changing the due date of an override to a date within a closed grading period" 


        it "allows unsetting the due date of an override when the last grading period is closed" 


        it "allows deleting by omission an override due in a closed grading period" 

      end
    end
  end

  describe "GET 'statistics'" do
    it "should allow concluded teachers to see a quiz's statistics" 


    context "logged out submissions" do
      render_views

      it "should include logged_out users' submissions in a public course" 

    end

    it "should show the statistics page if the course is a MOOC" 

  end

  describe "GET 'read_only'" do
    before(:once) { course_quiz }

    it "should allow concluded teachers to see a read-only view of a quiz" 


    it "should not allow students to see a read-only view of a quiz" 


    it "should include banks hash" 

  end

  describe "DELETE 'destroy'" do
    before(:once) { course_quiz }

    it "should require authorization" 


    it "should not allow students to delete quizzes" 


    it "should delete quizzes" 

  end

  describe "POST 'publish'" do
    it "should require authorization" 


    it "should publish unpublished quizzes" 

  end

  describe "GET 'submission_html'" do
    before(:once) { course_quiz(true) }
    before(:each) { user_session(@teacher) }

    it "renders nothing if there's no submission for current user" 


    it "renders submission html if there is a submission" 

  end

  describe "GET 'submission_html' (as a student)" do
    before do
      user_session(@student)
      course_quiz(true)
    end

    it "locks results if there is a submission and one_time_results is on" 

  end

  describe "POST 'unpublish'" do
    it "should require authorization" 


    it "should unpublish published quizzes" 

  end

  describe "GET submission_versions" do
    before(:once) { course_quiz }

    it "requires authorization" 


    it "assigns variables" 


    it "should render nothing if quiz is muted" 

  end

  describe 'differentiated assignments' do
    before do
      course_with_teacher(active_all: true)
      @student1, @student2 = n_students_in_course(2,:active_all => true, :course => @course)
      @course_section = @course.course_sections.create!
      course_quiz(active = true)
      @quiz.only_visible_to_overrides = true
      @quiz.save!
      student_in_section(@course_section, user: @student1)
      create_section_override_for_quiz(@quiz, course_section: @course_section)
    end
    context 'index' do
      it 'shows the quiz to students with visibility' 

      it 'hides the quiz to students with visibility' 

    end
    context 'show' do
      it 'shows the page to students with visibility' 

      it 'redirect for students without visibility or a submission' 

      it 'shows a message to students without visibility with a submission' 

    end
  end

  describe '#can_take_quiz?' do
    # These specs are test-after, and highly coupled to the existing
    # implementation of the #can_take_quiz method, which is deeply entangled.
    # When possible I recommend extracting this into a PORO or Quizzes::Quiz.

    before do
      allow(subject).to receive(:authorized_action).and_return(true)
      course_with_teacher
      course_quiz(active=true)
      @quiz.save!
      subject.instance_variable_set(:@quiz, @quiz)
      allow(@quiz).to receive(:require_lockdown_browser?).and_return(false)
      allow(@quiz).to receive(:ip_filter).and_return(false)
      subject.instance_variable_set(:@course, @course)
      subject.instance_variable_set(:@current_user, @student)
    end

    let(:return_value) { subject.send :can_take_quiz? }

    it "returns false when locked" 


    it "returns false when unauthorized" 


    it "returns false when a lockdown browser is required and the lockdown browser is false" 


    context "when access code is required but does not match" do
      before do
        allow(@quiz).to receive(:access_code).and_return("trust me. *winks*")
        allow(subject).to receive(:params).and_return({
          :access_code => "Don't trust me. *tips hat*",
          :take => 1
        })
      end

      it "renders access_code template" 


      it "returns false" 

    end

    context "when the ip address is invalid" do
      before do
        allow(@quiz).to receive(:ip_filter).and_return(true)
        allow(@quiz).to receive(:valid_ip?).and_return(false)
        allow(subject).to receive(:params).and_return({:take => 1})
      end

      it "renders invalid_ip" 


      it "returns false" 

    end
  end
end

