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

describe CoursesController do
  describe "GET 'index'" do
    it "should force login" 


    it "should assign variables" 


    it "should not duplicate enrollments in variables" 


    describe 'current_enrollments' do
      it "should group enrollments by course and type" 

    end

    describe 'past_enrollments' do
      it "should include 'completed' courses" 


      it "should include 'rejected' and 'completed' enrollments" 


      it "should prioritize completed enrollments over inactive ones" 


      it "should include 'active' enrollments whose term is past" 


      it "should do other terrible date logic based on sections" 


      it "should not include hard-inactive enrollments even in the future" 


      it "should not include 'invited' enrollments whose term is past" 


      it "should not include the course if the caller is a student or observer and the course restricts students viewing courses after the end date" 


      it "should include the student's course when the course restricts students viewing courses after the end date if they're not actually soft-concluded" 

    end

    describe 'current_enrollments' do
      it "should include courses with no applicable start/end dates" 


      it "should include courses with current start/end dates" 


      it "should include 'invited' enrollments, and list them before 'active'" 


      it "should include unpublished courses" 

    end

    describe 'future_enrollments' do
      it "should include courses with a start date in the future, regardless of published state" 


      it "should include courses with accepted enrollments and future start dates" 


      it "should not be empty if the caller is a student or observer and the root account restricts students viewing courses before the start date" 


      it "should not include unpublished course enrollments if account disallows future view" 

    end

    describe "per-assignment permissions" do
      let(:js_permissions) { assigns[:js_env][:PERMISSIONS] }

      before(:each) do
        course_with_teacher_logged_in(active_all: true)

        @course.update!(default_view: 'assignments')
        @course.enable_feature!(:moderated_grading)

        @editable_assignment = @course.assignments.create!(
          moderated_grading: true,
          grader_count: 2,
          final_grader: @teacher
        )
      end

      context "when Anonymous Moderated Marking is on" do
        let(:assignment_permissions) { assigns[:js_env][:PERMISSIONS][:by_assignment_id] }

        before(:each) do
          @course.root_account.enable_feature!(:anonymous_moderated_marking)

          ta_in_course(active_all: true)
          @uneditable_assignment = @course.assignments.create!(
            moderated_grading: true,
            grader_count: 2,
            final_grader: @ta
          )
        end

        it "sets the 'update' attribute for an editable assignment to true" 


        it "sets the 'update' attribute for an uneditable assignment to false" 

      end

      context "when Anonymous Moderated Marking is off" do
        it "does not set permissions in js_env for individual assignments" 

      end
    end
  end

  describe "GET 'statistics'" do
    it 'does not break using new student_ids method from course' 

  end

  describe "GET 'settings'" do
    before :once do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
    end

    it "should set tool creation permissions true for roles that are granted rights" 


    it "should not set tool creation permissions for roles not granted rights" 


    it "should require authorization" 


    it "should should not allow students" 


    it "should render properly" 


    it "should give a helpful error message for students that can't access yet" 


    it "does not record recent activity for unauthorize actions" 


    it "should assign active course_settings_sub_navigation external tools" 

  end

  describe "GET 'enrollment_invitation'" do
    it "should successfully reject invitation for logged-in user" 


    it "should successfully reject invitation for not-logged-in user" 


    it "should successfully reject temporary invitation" 


    it "should not reject invitation for bad parameters" 


    it "should accept invitation for logged-in user" 


    it "should ask user to login for registered not-logged-in user" 


    it "should defer to registration_confirmation for pre-registered not-logged-in user" 


    it "should defer to registration_confirmation if logged-in user does not match enrollment user" 


    it "should ask user to login if logged-in user does not match enrollment user, and enrollment user doesn't have an e-mail" 


    it "should accept an enrollment for a restricted by dates course" 

  end

  describe "GET 'show'" do
    before :once do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
    end

    it "should require authorization" 


    it "should not find deleted courses" 


    it "should assign variables" 


    it "should give a helpful error message for students that can't access yet" 


    it "should allow student view student to view unpublished courses" 


    it "should not allow student view students to view other courses" 


    def check_course_show(should_show)
      controller.instance_variable_set(:@context_all_permissions, nil)
      controller.instance_variable_set(:@js_env, nil)

      get 'show', params: {:id => @course.id}
      if should_show
        expect(response).to be_success
        expect(assigns[:context]).to eql(@course)
      else
        assert_status(401)
      end
    end

    it "should show unauthorized/authorized to a student for a future course depending on restrict_student_future_view setting" 


    it "should show unauthorized/authorized to a student for a past course depending on restrict_student_past_view setting" 


    context 'when default_view is `syllabus`' do
      before do
        course_with_student_logged_in(active_course: 1)
        @course.default_view = 'syllabus'
        @course.syllabus_body = '<p>This is your syllabus.</p>'
        @course.save!
      end

      it 'assigns syllabus_body' 


      it 'assigns groups' 

    end

    context "show feedback for the current course only on course front page" do
      before(:once) do
        course_with_student(:active_all => true)
        @me = @user
        @course1 = @course
        course_with_teacher(:course => @course1)

        course_with_student(:active_all => true, :user => @student)
        @course2 = @course
        course_with_teacher(:course => @course2, :user => @teacher)

        @a1 = @course1.assignments.new(:title => "some assignment course 1")
        @a1.workflow_state = "published"
        @a1.save
        @s1 = @a1.submit_homework(@student)
        @c1 = @s1.add_comment(:author => @teacher, :comment => "some comment1")

        # this shouldn't show up in any course 1 list
        @a2 = @course2.assignments.new(:title => "some assignment course 2")
        @a2.workflow_state = "published"
        @a2.save
        @s2 = @a2.submit_homework(@student)
        @c2 = @s2.add_comment(:author => @teacher, :comment => "some comment2")
      end

      before(:each) do
        user_session(@me)
      end

      it "should work for module view" 


      it "should work for assignments view" 


      it "should disable management and set env urls on assignment homepage" 


      it "should set ping_url" 


      it "should not show unpublished assignments to students" 


      it "should work for wiki view" 


      it "should work for wiki view with draft state enabled" 


      it "should work for wiki view with home page announcements enabled" 


      it "should not show announcements for public users" 


      it "should work for syllabus view" 


      it "should work for feed view" 


      it "should only show recent feedback if user is student in specified course" 


    end

    context "invitations" do
      before :once do
        Account.default.settings[:allow_invitation_previews] = true
        Account.default.save!
        course_with_teacher(active_course: true)
        @teacher_enrollment = @enrollment
        student_in_course(course: @course)
      end

      it "should allow an invited user to see the course" 


      it "should still show unauthorized if unpublished, regardless of if previews are allowed" 


      it "should not show unauthorized for invited teachers when unpublished" 


      it "should re-invite an enrollment that has previously been rejected" 


      it "should auto-accept if previews are not allowed" 


      it "should not error when previewing an unpublished course as an invited admin" 


      it "should ignore invitations that have been accepted (not logged in)" 


      it "should ignore invitations that have been accepted (logged in)" 


      it "should use the invitation enrollment, rather than the current enrollment" 


      it "should auto-redirect to registration page when it's a self-enrollment" 


      it "should not use the session enrollment if it's for the wrong course" 


      it "should find temporary enrollments that match the logged in user" 

    end

    it "should redirect html to settings page when user can :read_as_admin, but not :read" 


    it "should not redirect xhr to settings page when user can :read_as_admin, but not :read" 


    it "should redirect to the xlisted course" 


    it "should not redirect to the xlisted course if the enrollment is deleted" 


    context "page views enabled" do
      before do
        Setting.set('enable_page_views', 'db')
        @old_thread_context = Thread.current[:context]
        Thread.current[:context] = { request_id: SecureRandom.uuid }
      end

      after do
        Thread.current[:context] = @old_thread_context
      end

      it "should log an AUA with membership_type" 


      it "should log an asset user access for api requests" 

    end

    context "course_home_sub_navigation" do
      before :once do
        @course.root_account.enable_feature!(:lor_for_account)
        @tool = @course.context_external_tools.create(consumer_key: 'test', shared_secret: 'secret', url: 'http://example.com/lti',
          name: 'tool', course_home_sub_navigation: {enabled: true, visibility: 'admins'})
      end

      it "should show admin-level course_home_sub_navigation external tools for teachers" 


      it "should reject admin-level course_home_sub_navigation external tools for students" 

    end
  end

  describe "POST 'unenroll_user'" do
    before :once do
      course_with_teacher(active_all: true)
      @teacher_enrollment = @enrollment
      student_in_course(active_all: true)
    end

    it "should require authorization" 


    it "should not allow students to unenroll" 


    it "should unenroll users" 


    it "should not allow teachers to unenroll themselves" 


    it "should allow admins to unenroll themselves" 

  end

  describe "POST 'enroll_users'" do
    before :once do
      account = Account.default
      account.settings = { :open_registration => true }
      account.save!
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
    end

    it "should require authorization" 


    it "should not allow students to enroll people" 


    it "should enroll people" 


    it "should not enroll people in hard-concluded courses" 


    it "should not enroll people in soft-concluded courses" 


    it "should record initial_enrollment_type on new users" 


    it "should enroll using custom role id" 


    it "should allow TAs to enroll Observers (by default)" 


    it "will use json for limit_privileges_to_course_section param" 


    it "should also accept a list of user tokens (instead of ye old UserList)" 

  end

  describe "POST create" do
    before do
      @account = Account.default
      role = custom_account_role 'lamer', :account => @account
      @account.role_overrides.create! :permission => 'manage_courses', :enabled => true, :role => role
      user_factory
      @account.account_users.create!(user: @user, role: role)
      user_session @user
    end

    it "should log create course event" 

  end

  describe "PUT 'update'" do
    before :once do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
    end

    it "should require authorization" 


    it "should not let students update the course details" 


    it "should update course details" 


    it "should update some settings and stuff" 


    it "should allow sending events" 


    it "should log published event on update" 


    it "should log claimed event on update" 


    it 'should allow unpublishing of the course' 


    it 'should not allow unpublishing of the course if submissions present' 


    it "should allow unpublishing of the course if submissions have no score or grade" 


    it "should allow the course to be unpublished if it contains only graded student view submissions" 


    it "should lock active course announcements" 


    it "should log update course event" 


    it "should update its lock_all_announcements setting" 


    it "should let sub-account admins move courses to other accounts within their sub-account" 


    it "should not let sub-account admins move courses to other accounts outside their sub-account" 


    it "should let site admins move courses to any account" 


    describe "touching content when public visibility changes" do
      before :each do
        user_session(@teacher)
        @assignment = @course.assignments.create!(:name => "name")
        @time = 1.day.ago
        Assignment.where(:id => @assignment).update_all(:updated_at => @time)

        @assignment.reload
      end

      it "should touch content when is_public is updated" 


      it "should touch content when is_public_to_auth_users is updated" 


      it "should not touch content when neither is updated" 

    end

    it "should let admins without course edit rights update only the syllabus body" 


    it "should render the show page with a flash on error" 


    describe "course images" do
      before :each do
        user_session(@teacher)
      end

      it "should allow valid course file ids" 


      it "should allow valid urls" 


      it "should reject invalid urls" 


      it "should reject random letters and numbers" 


      it "should reject setting both a url and an id at the same time" 


      it "should reject non-course ids" 


      it "should clear the image_url when setting an image_id" 


      it "should clear the image_id when setting an image_url" 


      it "should clear image id after setting remove_image" 


      it "should clear image url after setting remove_image" 

    end

    describe 'master courses' do
      before :once do
        Account.default.enable_feature! :master_courses
        account_admin_user
        course_factory
      end

      before :each do
        user_session(@admin)
      end

      it 'should require :manage_master_courses permission' 


      it 'should set a course as a master course' 


      it 'should not allow a course with students to be set as a master course' 


      it 'should not allow a minion course to be set as a master course' 


      it "should allow setting of default template restrictions" 


      it "should validate template restrictions" 


      it "should allow setting whether to use template restrictions by object type" 


      it "should allow setting default template restrictions by object type" 


      it "should validate default template restrictions by object type" 

    end
  end

  describe "POST 'unconclude'" do
    it "should unconclude the course" 

  end

  describe "GET 'self_enrollment'" do
    before :once do
      Account.default.update_attribute(:settings, :self_enrollment => 'any', :open_registration => true)
      course_factory(active_all: true)
    end

    it "should redirect to the new self enrollment form" 


    it "should redirect to the new self enrollment form if using a long code" 


    it "should return to the course page for an incorrect code" 


    it "should redirect to the new enrollment form even if self_enrollment is disabled" 

  end

  describe "POST 'self_unenrollment'" do
    before(:once) { course_with_student(:active_all => true) }
    before(:each) { user_session(@student) }

    it "should unenroll" 


    it "should not unenroll for incorrect code" 


    it "should not unenroll a non-self-enrollment" 

  end

  describe "GET 'sis_publish_status'" do
    before(:once) { course_with_teacher(:active_all => true) }

    it 'should check for authorization' 


    it 'should not try and publish grades' 


    it 'should return reasonable json for a few enrollments' 

  end

  describe "POST 'publish_to_sis'" do
    it "should publish grades and return results" 

  end

  describe "GET 'public_feed.atom'" do
    before(:once) do
      course_with_student(:active_all => true)
      assignment_model(:course => @course)
    end

    it "should require authorization" 


    it "should include absolute path for rel='self' link" 


    it "should include an author for each entry" 


    it "should not include unpublished assignments or discussions" 

  end

  describe "POST 'reset_content'" do
    before :once do
      course_with_teacher(:active_all => true)
    end

    it "should allow teachers to reset" 


    it "should not allow TAs to reset" 


    it "does not allow resetting blueprint courses" 


    it "should log reset audit event" 

  end

  context "visibility_configuration" do
    let(:controller) { CoursesController.new }

    before do
      controller.instance_variable_set(:@course, Course.new)
    end

    it "should allow setting course visibility with flag" 


    it "should allow setting syllabus visibility with flag" 


  end

  context "changed_settings" do
    let(:controller) { CoursesController.new }

    it "should have changed settings for a new course" 


    it "should have changed settings for an updated course" 

  end

  describe "quotas" do
    context "with :manage_storage_quotas" do
      before :once do
        @account = Account.default
        account_admin_user :account => @account
      end

      before :each do
        user_session @user
      end

      describe "create" do
        it "should set storage_quota" 


        it "should set storage_quota_mb" 

      end

      describe "update" do
        before :once do
          @course = @account.courses.create!
        end

        it "should set storage_quota" 


        it "should set storage_quota_mb" 

      end
    end

    context "without :manage_storage_quotas" do
      describe "create" do
        before :once do
          @account = Account.default
          role = custom_account_role 'lamer', :account => @account
          @account.role_overrides.create! :permission => 'manage_courses', :enabled => true,
                                          :role => role
          user_factory
          @account.account_users.create!(user: @user, role: role)
        end

        before :each do
          user_session @user
        end

        it "should ignore storage_quota" 


        it "should ignore storage_quota_mb" 

      end

      describe "update" do
        before :once do
          @account = Account.default
          course_with_teacher(:account => @account, :active_all => true)
        end
        before(:each) { user_session(@teacher) }

        it "should ignore storage_quota" 


        it "should ignore storage_quota_mb" 

      end
    end
  end

  describe "DELETE 'test_student'" do
    before :once do
      @account = Account.default
      course_with_teacher(:account => @account, :active_all => true)
      @quiz = @course.quizzes.create!
      @quiz.workflow_state = "available"
      @quiz.save
    end

    it "removes existing quiz submissions created by the test student" 


    it "removes submissions created by the test student" 


    it "removes provisional grades for by the test student" 


    it "decrements needs grading counts" 

  end

  describe 'GET #permissions' do
    before do
      course_with_teacher(active_all: true)
      user_session(@teacher)
    end

    it 'returns a json representation for provided permission keys' 

  end

  describe "POST start_offline_web_export" do
    it "starts a web zip export" 

  end

  describe '#users' do
    let(:course) { Course.create! }

    let(:teacher) { teacher_in_course(course: course, active_all: true).user }

    let(:student1) { student_in_course(course: course, active_all: true).user }

    let(:student2) { student_in_course(course: course, active_all: true).user }

    let!(:group1) do
      group = course.groups.create!(name: "group one")
      group.users << student1
      group.users << student2
      group.group_memberships.last.update!(workflow_state: 'deleted')
      group.reload
    end

    let!(:group2) do
      group = course.groups.create!(name: "group one")
      group.users << student1
      group.users << student2
      group.group_memberships.first.update!(workflow_state: 'deleted')
      group.reload
    end

    it 'only returns group_ids for active group memberships when requested' 

  end
end

