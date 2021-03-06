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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
require File.expand_path(File.dirname(__FILE__) + '/../lti2_spec_helper')

describe AssignmentsController do
  before :once do
    course_with_teacher(active_all: true)
    student_in_course(active_all: true)
    course_assignment
  end

  def course_assignment(course = nil)
    course ||= @course
    @group = course.assignment_groups.create(:name => "some group")
    @assignment = course.assignments.create(
      :title => "some assignment",
      :assignment_group => @group,
      :due_at => Time.zone.now + 1.week
    )
    @assignment
  end

  describe "GET 'index'" do
    it "should throw 404 error without a valid context id" 


    it "should return unauthorized without a valid session" 


    it "should redirect 'disabled', if disabled by the teacher" 


    it "should set WEIGHT_FINAL_GRADES in js_env" 


    it "js_env HAS_ASSIGNMENTS is true when the course has assignments" 


    it "js_env HAS_ASSIGNMENTS is false when the course does not have assignments" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.due_date_required_for_account? == true" 


    it "js_env SIS_INTEGRATION_SETTINGS_ENABLED is true when AssignmentUtil.sis_integration_settings_enabled? == true" 


    it "js_env SIS_INTEGRATION_SETTINGS_ENABLED is false when AssignmentUtil.sis_integration_settings_enabled? == false" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.due_date_required_for_account? == false" 


    it "js_env SIS_NAME is SIS when @context does not respond_to assignments" 


    it "js_env SIS_NAME is Foo Bar when AssignmentUtil.post_to_sis_friendly_name is Foo Bar" 


    it "js_env POST_TO_SIS_DEFAULT is false when sis_default_grade_export is false on the account" 


    it "js_env POST_TO_SIS_DEFAULT is true when sis_default_grade_export is true on the account" 


    it "should set QUIZ_LTI_ENABLED in js_env if quizzes 2 is available" 


    it "should not set QUIZ_LTI_ENABLED in js_env if url is voided" 


    it "should not set QUIZ_LTI_ENABLED in js_env if quizzes 2 is not available" 


    it "should not set QUIZ_LTI_ENABLED in js_env if quizzes_next is not enabled" 


    it "js_env MAX_NAME_LENGTH_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.name_length_required_for_account? == true" 


    it "js_env MAX_NAME_LENGTH_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.name_length_required_for_account? == false" 


    it "js_env MAX_NAME_LENGTH is a 15 when AssignmentUtil.assignment_max_name_length returns 15" 


    context "draft state" do
      it "should create a default group if none exist" 


      it "should separate manage_assignments and manage_grades permissions" 

    end

    describe "per-assignment permissions" do
      let(:assignment_permissions) { assigns[:js_env][:PERMISSIONS][:by_assignment_id] }

      before(:each) do
        @course.enable_feature!(:moderated_grading)

        @editable_assignment = @course.assignments.create!(
          moderated_grading: true,
          grader_count: 2,
          final_grader: @teacher
        )

        user_session(@teacher)
        ta_in_course(active_all: true)

        @noneditable_assignment = @course.assignments.create!(
          moderated_grading: true,
          grader_count: 2,
          final_grader: @ta
        )
      end

      it "sets the 'update' attribute for an editable assignment to true" 


      it "sets the 'update' attribute for a non-editable assignment to false" 

    end
  end

  describe "GET 'show_moderate'" do
    before(:each) do
      user_session(@teacher)
      course_with_user('TeacherEnrollment', {active_all: true, course: @course})
      @other_teacher = @user
      @assignment = @course.assignments.create!(
        moderated_grading: true,
        final_grader: @other_teacher,
        grader_count: 2,
        workflow_state: 'published'
      )
    end

    it "renders the page when the current user is the selected moderator" 


    it "renders unauthorized when the current user is not the selected moderator" 


    it "renders unauthorized when no moderator is selected and the user is not an admin" 


    it "renders unauthorized when no moderator is selected and the user is an admin without " \
    "'Select Final Grade for Moderation' permission" do
      @course.account.role_overrides.create!(role: admin_role, enabled: false, permission: :select_final_grade)
      @assignment.update!(final_grader: nil)
      user_session(account_admin_user)
      get 'show_moderate', params: {course_id: @course.id, assignment_id: @assignment.id}
      assert_status(401)
    end

    it "renders the page when the current user is an admin and not the selected moderator" 


    it "renders the page when no moderator is selected and the user is an admin with " \
    "'Select Final Grade for Moderation' permission" do
      @assignment.update!(final_grader: nil)
      user_session(account_admin_user)
      get 'show_moderate', params: {course_id: @course.id, assignment_id: @assignment.id}
      assert_status(200)
    end

    describe "js_env" do
      let_once(:grader_1) do
        course_with_user('TeacherEnrollment', {active_all: true, course: @course})
        @user
      end
      let_once(:grader_2) do
        course_with_user('TeacherEnrollment', {active_all: true, course: @course})
        @user
      end

      let(:env) { assigns[:js_env] }

      before :once do
        @assignment.grade_student(@student, grader: grader_1, provisional: true, score: 10)
        @assignment.grade_student(@student, grader: grader_2, provisional: true, score: 5)
      end

      before :each do
        @assignment.update_attributes(
          moderated_grading: true,
          final_grader: @other_teacher,
          grader_count: 2
        )
        user_session(@other_teacher)
      end

      it "includes ASSIGNMENT.course_id" 


      it "includes ASSIGNMENT.id" 


      it "includes ASSIGNMENT.grades_published" 


      it "includes ASSIGNMENT.muted" 


      it "includes ASSIGNMENT.title" 


      it "optionally sets CURRENT_USER.can_view_grader_identities to true" 


      it "optionally sets CURRENT_USER.can_view_grader_identities to false" 


      it "optionally sets CURRENT_USER.can_view_student_identities to true" 


      it "optionally sets CURRENT_USER.can_view_student_identities to false" 


      describe "CURRENT_USER.grader_id" do
        it "is the id of the user when the user can see other grader identities" 


        context "when the user cannot see other grader identities" do
          before :each do
            @assignment.update(grader_names_visible_to_final_grader: false)
          end

          it "is the anonymous_id of the associated moderation grader when the user has graded" 


          it "is nil when the user has not graded" 

        end
      end

      it "includes CURRENT_USER.id" 


      describe "FINAL_GRADER.grader_id" do
        it "is the id of the final grader when the current user can see other grader identities" 


        context "when the current user cannot see other grader identities" do
          before :each do
            @assignment.update(grader_names_visible_to_final_grader: false)
          end

          it "is the anonymous_id of the final grader's moderation grader when the final grader has graded" 


          it "is nil when the final grader has not graded" 

        end
      end

      it "includes FINAL_GRADER.id when the assignment has a final grader" 


      it "sets FINAL_GRADER to nil when the assignment does not have a final grader" 


      it "includes moderation graders in GRADERS" 


      it "does not include the final grader in GRADERS" 

    end
  end

  describe "GET 'show'" do
    it "should return 404 on non-existant assignment" 


    it "doesn't fail on a public course with a nil user" 


    it "should return unauthorized if not enrolled" 


    it "should assign variables" 


    it "should assign 'similarity_pledge'" 


    it 'uses the vericite pledge if vericite is enabled' 


    it 'uses the closest pledge when vericite is enabled but no pledge is set' 


    it 'uses the turnitin pledge if turnitin is enabled' 


    it "should assign submission variable if current user and submitted" 


    it "should assign (active) peer review requests" 


    it "should redirect to wiki page if assignment is linked to wiki page" 


    it "should not redirect to wiki page" 


    it "should redirect to discussion if assignment is linked to discussion" 


    it "should not redirect to discussion for observer if assignment is linked to discussion but read_forum is false" 


    it "should not show locked external tool assignments" 


    it "should require login for external tools in a public course" 


    it 'should set user_has_google_drive' 


    context "page views enabled" do
      before do
        Setting.set('enable_page_views', 'db')
        @old_thread_context = Thread.current[:context]
        Thread.current[:context] = { request_id: SecureRandom.uuid }
        allow(BasicLTI::Sourcedid).to receive(:encryption_secret) {'encryption-secret-5T14NjaTbcYjc4'}
        allow(BasicLTI::Sourcedid).to receive(:signing_secret) {'signing-secret-vp04BNqApwdwUYPUI'}
      end

      after do
        Thread.current[:context] = @old_thread_context
      end

      it "should log an AUA as an assignment view for an external tool assignment" 

    end

  end

  describe "GET 'syllabus'" do
    it "should require authorization" 


    it "should redirect 'disabled', if disabled by the teacher" 


    it "should assign variables" 

  end

  describe "PUT 'toggle_mute'" do
    it "should require authorization" 


    context "while logged in" do
      before :each do
        user_session(@teacher)
      end

      context "with moderated grading on" do
        before :each do
          @assignment.update!(moderated_grading: true, grader_count: 1)
        end

        it "should fail if grades are not published, and status is false" 


        it "should mute if grades are not published, and status is true" 

      end

      it "should mute if status is true" 


      it "should unmute if status is false" 


      describe 'anonymize_students' do
        it "is included in the response" 


        it "is true if the assignment is anonymous and muted" 


        it "is false if the assignment is anonymous and unmuted" 


        it "is false if the assignment is not anonymous" 

      end
    end
  end

  describe "GET 'new'" do
    it "should require authorization" 


    it "should default to unpublished for draft state" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.due_date_required_for_account? == true" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.due_date_required_for_account? == false" 


    it "js_env SIS_NAME is Foo Bar when AssignmentUtil.post_to_sis_friendly_name is Foo Bar" 


    context "with ?quiz_lti query param" do
      it "uses quizzes 2 if available" 


      it "falls back to normal behaviour if quizzes 2 is not set up" 

    end
  end

  describe "POST 'create'" do
    it "sets the lti_context_id if provided" 


    it "should require authorization" 


    it "should create assignment" 


    it "should create assignment when no groups exist yet" 


    it "should set updating_user on created assignment" 


    it "should default to unpublished if draft state is enabled" 


    it "should assign to a group" 


    it "should not assign to a group from a different course" 


    it 'should use the default post-to-SIS setting' 

  end

  describe "GET 'edit'" do
    include_context "grading periods within controller" do
      let(:course) { @course }
      let(:teacher) { @teacher }
      let(:request_params) { [:edit, params: {course_id: course, id: @assignment}] }
    end

    shared_examples 'course feature flags for Anonymous Moderated Marking' do
      before(:each) do
        user_session(@teacher)
      end

      it 'is false when the feature flag is not enabled' 


      it 'is true when the feature flag is enabled' 

    end

    it "should require authorization" 


    it "should find assignment" 


    it "bootstraps the correct assignment info to js_env" 


    it "bootstrap the assignment originality report visibility settings to js_env" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.due_date_required_for_account? == true" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.due_date_required_for_account? == false" 


    it "js_env SIS_NAME is Foo Bar when AssignmentUtil.post_to_sis_friendly_name is Foo Bar" 


    it 'js_env AVAILABLE_MODERATORS includes the name and id for each available moderator' 


    it 'js_env MODERATED_GRADING_MAX_GRADER_COUNT is the max grader count for the assignment' 


    describe 'js_env ANONYMOUS_INSTRUCTOR_ANNOTATIONS_ENABLED' do
      before(:each) do
        user_session(@teacher)
      end

      it 'is true when the course has anonymous_instructor_annotations on' 


      it 'is true when the account has anonymous_instructor_annotations on' 


      it 'is false when the course has anonymous_instructor_annotations off' 


      it 'is false when the account has anonymous_instructor_annotations off' 

    end

    context 'plagiarism detection platform' do
      include_context 'lti2_spec_helper'

      let(:service_offered) do
        [
          {
            "endpoint" => "http://originality.docker/eula",
            "action" => ["GET"],
            "@id" => "http://originality.docker/lti/v2/services#vnd.Canvas.Eula",
            "@type" => "RestService"
          }
        ]
      end

      before do
        allow_any_instance_of(AssignmentConfigurationToolLookup).to receive(:create_subscription).and_return true
        allow(Lti::ToolProxy).to receive(:find_active_proxies_for_context).with(@course) { Lti::ToolProxy.where(id: tool_proxy.id) }
        tool_proxy.resources << resource_handler
        tool_proxy.update_attributes!(context: @course)

        AssignmentConfigurationToolLookup.create!(
          assignment: @assignment,
          tool: message_handler,
          tool_type: 'Lti::MessageHandler',
          tool_id: message_handler.id
        )
      end

      it "bootstraps the correct message_handler id for LTI 2 tools to js_env" 


      it "bootstraps the correct EULA link for the associated LTI 2 tool" 

    end

    context "redirects" do
      before do
        user_session(@teacher)
      end

      it "to quiz" 


      it "to discussion topic" 


      it "to wiki page" 


      it "includes return_to" 

    end

    context "conditional release" do
      before do
        allow(ConditionalRelease::Service).to receive(:env_for).and_return({ dummy: 'cr-assignment' })
      end

      it "should define env when enabled" 


      it "should not define env when not enabled" 

    end

    describe 'js_env ANONYMOUS_GRADING_ENABLED' do
      it_behaves_like 'course feature flags for Anonymous Moderated Marking' do
        let(:js_env_attribute) { :ANONYMOUS_GRADING_ENABLED }
        let(:feature_flag) { :anonymous_marking }
      end
    end

    describe 'js_env MODERATED_GRADING_ENABLED' do
      it_behaves_like 'course feature flags for Anonymous Moderated Marking' do
        let(:js_env_attribute) { :MODERATED_GRADING_ENABLED }
        let(:feature_flag) { :moderated_grading }
      end
    end
  end

  describe "DELETE 'destroy'" do
    it "should require authorization" 


    it "should delete assignments if authorized" 

  end

  describe "GET list_google_docs" do
    it "passes errors through to Canvas::Errors" 

  end

end

