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

require_relative '../sharding_spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/../lti_1_3_spec_helper')

describe UsersController do
  let(:group_helper) { Factories::GradingPeriodGroupHelper.new }

  describe "external_tool" do
    let(:account) { Account.default }

    let :tool do
      tool = account.context_external_tools.new({
        name: "bob",
        consumer_key: "bob",
        shared_secret: "bob",
        tool_id: 'some_tool',
        privacy_level: 'public'
      })
      tool.url = "http://www.example.com/basic_lti?first=john&last=smith"
      tool.resource_selection = {
        :url => "http://#{HostUrl.default_host}/selection_test",
        :selection_width => 400,
        :selection_height => 400
      }
      user_navigation = {
        :text => 'example',
        :labels => {
          'en' => 'English Label',
          'sp' => 'Spanish Label'
        }
      }
      tool.settings[:user_navigation] = user_navigation
      tool.save!
      tool
    end

    let_once(:user) { user_factory(active_all: true) }
    before do
      account.account_users.create!(user: user)
      user_session(user)
    end

    it "removes query string when post_only = true" 


    it "does not remove query string from url" 


    it "uses localized labels" 


    context 'using LTI 1.3 when specified' do
      include_context 'lti_1_3_spec_helper'

      subject do
        get :external_tool, params: {id:tool.id, user_id:user.id}
        JSON::JWT.decode(assigns[:lti_launch].params[:id_token], :skip_verification)
      end

      before do
        tool.use_1_3 = true
        tool.developer_key = DeveloperKey.create!
        tool.save!
      end

      it 'does LTI 1.3 launch' 

    end
  end

  describe "GET oauth" do
    it "sets up oauth for google_drive" 


  end

  describe "GET oauth_success" do
    it "handles google_drive oauth_success for a logged_in_user" 


    it "handles google_drive oauth_success for a non logged in user" 


    it "rejects invalid state" 

  end

  it "should not include deleted courses in manageable courses" 


  it "should sort the results of manageable_courses by name" 


  describe "POST 'create'" do
    it "should not allow creating when self_registration is disabled and you're not an admin'" 


    context 'self registration' do
      before :each do
        Account.default.canvas_authentication_provider.update_attribute(:self_registration, true)
      end

      context 'self registration for observers only' do
        before :each do
          Account.default.canvas_authentication_provider.update_attribute(:self_registration, 'observer')
        end

        it "should not allow teachers to self register" 


        it "should not allow students to self register" 


        it "should allow observers to self register" 


        it "should allow observers to self register with a pairing code" 


        it "should redirect users to the oauth confirmation when registering through oauth" 


        it "should redirect 'new' action to root_url" 

      end

      it "should create a pre_registered user" 


      it "should mark user as having accepted the terms of use if specified" 


      it "should create a registered user if the skip_registration flag is passed in" 


      it "should complain about conflicting unique_ids" 


      it "should not complain about conflicting ccs, in any state" 


      it "should re-use 'conflicting' unique_ids if it hasn't been fully registered yet" 


      it "should validate acceptance of the terms" 


      it "should not validate acceptance of the terms if terms are passive" 


      it "should not validate acceptance of the terms if not required by account" 


      it "should require email pseudonyms by default" 


      it "should require email pseudonyms if not self enrolling" 


      it "should validate the self enrollment code" 


      it "should ignore the password if not self enrolling" 


      context "self enrollment" do
        before(:once) do
          Account.default.allow_self_enrollment!
          course_factory(active_all: true)
          @course.update_attribute(:self_enrollment, true)
        end

        it "should strip the self enrollment code before validation" 


        it "should ignore the password if self enrolling with an email pseudonym" 


        it "should require a password if self enrolling with a non-email pseudonym" 


        it "should auto-register the user if self enrolling" 

      end

      it "should link the user to the observee" 

    end

    context 'account admin creating users' do

      describe 'successfully' do
        let!(:account) { Account.create! }

        before do
          user_with_pseudonym(:account => account)
          account.account_users.create!(user: @user)
          user_session(@user, @pseudonym)
        end

        it "should create a pre_registered user (in the correct account)" 


        it "should create users with non-email pseudonyms" 


        it "should create users with non-email pseudonyms and an email" 


        it "should not require acceptance of the terms" 


        it "should allow setting a password" 


        it "allows admins to force the self-registration workflow for a given user" 


        it "should not throw a 500 error without user params'" 


        it "should not throw a 500 error without pseudonym params'" 


        it "strips whitespace from the unique_id" 

      end

      it "should not allow an admin to set the sis id when creating a user if they don't have privileges to manage sis" 


      it "should notify the user if a merge opportunity arises" 


      it "should not notify the user if the merge opportunity can't log in'" 

    end
  end

  describe "GET 'grades_for_student'" do
    let(:test_course) do
      test_course = course_factory(active_all: true)
      test_course
    end
    let(:student) { user_factory(active_all: true) }
    let!(:student_enrollment) do
      course_with_user('StudentEnrollment', course: test_course, user: student, active_all: true)
    end
    let(:grading_period_group) { group_helper.legacy_create_for_course(test_course) }
    let(:grading_period) do
      grading_period_group.grading_periods.create!(
        title: "Some Semester",
        start_date: 3.months.ago,
        end_date: 2.months.from_now)
    end
    let!(:assignment1) do
      assignment = assignment_model(course: test_course, due_at: Time.zone.now, points_possible: 10)
      assignment.grade_student(student, grade: '40%', grader: @teacher)
    end

    let!(:assignment2) do
      assignment = assignment_model(course: test_course, due_at: 3.months.from_now, points_possible: 100)
      assignment.grade_student(student, grade: '100%', grader: @teacher)
    end

    context "as a student" do
      it "returns the grade for the student, filtered by the grading period" 


      it "does not filter the grades by a grading period if " \
      "'All Grading Periods' is selected" do
        all_grading_periods_id = 0
        user_session(student)
        get('grades_for_student', params: {grading_period_id: all_grading_periods_id,
          enrollment_id: student_enrollment.id})

        expect(response).to be_ok
        expected_response = {'grade' => 94.55, 'hide_final_grades' => false}
        expect(json_parse(response.body)).to eq expected_response
      end

      it "returns unauthorized if a student is trying to get grades for " \
      "another student (and is not observing that student)" do
        snooping_student = user_factory(active_all: true)
        course_with_user('StudentEnrollment', course: test_course, user: snooping_student, active_all: true)
        user_session(snooping_student)
        get('grades_for_student', params: {grading_period_id: grading_period.id,
          enrollment_id: student_enrollment.id})

        expect(response).to_not be_ok
      end
    end

    context "with unposted assignments" do
      before(:each) do
        unposted_assignment = assignment_model(
          course: test_course, due_at: Time.zone.now,
          points_possible: 90, muted: true
        )
        unposted_assignment.grade_student(student, grade: '100%', grader: @teacher)

        user_session(@teacher)
      end

      let(:response) do
        get('grades_for_student', params: {enrollment_id: student_enrollment.id})
      end

      let(:parsed_response) do
        json_parse(response.body)
      end

      context "when the requester can manage grades" do
        before(:each) do
          test_course.root_account.role_overrides.create!(
            permission: 'view_all_grades', role: teacher_role, enabled: false
          )
          RoleOverride.create!(
            permission: 'manage_grades', role: teacher_role, enabled: true
          )
        end

        it "allows access" 


        it "returns the grade" 


        it "returns the unposted_grade" 

      end

      context "when the requester can view all grades" do
        before(:each) do
          test_course.root_account.role_overrides.create!(
            permission: 'view_all_grades', role: teacher_role, enabled: true
          )
          test_course.root_account.role_overrides.create!(
            permission: 'manage_grades', role: teacher_role, enabled: false
          )
        end

        it "allows access" 


        it "returns the grade" 


        it "returns the unposted_grade" 

      end

      context "when the requester does not have permissions to see unposted grades" do
        before(:each) do
          test_course.root_account.role_overrides.create!(
            permission: 'view_all_grades', role: teacher_role, enabled: false
          )
          test_course.root_account.role_overrides.create!(
            permission: 'manage_grades', role: teacher_role, enabled: false
          )
        end

        it "returns unauthorized" 

      end
    end

    context "as an observer" do
      let(:observer) { user_with_pseudonym(active_all: true) }

      it "returns the grade and the total for a student, filtered by grading period" 


      it "does not filter the grades by a grading period if " \
      "'All Grading Periods' is selected" do
        student.linked_observers << observer
        all_grading_periods_id = 0
        user_session(observer)
        get('grades_for_student', params: {grading_period_id: all_grading_periods_id,
          enrollment_id: student_enrollment.id})

        expect(response).to be_ok
        expected_response = {'grade' => 94.55, 'hide_final_grades' => false}
        expect(json_parse(response.body)).to eq expected_response
      end

      it "returns unauthorized if the student is not an observee of the observer" 

    end
  end

  describe "GET 'grades'" do
    context "grading periods" do
      let(:test_course) { course_factory(active_all: true) }
      let(:student1) { user_factory(active_all: true) }
      let(:student2) { user_factory(active_all: true) }
      let(:grading_period_group) { group_helper.legacy_create_for_course(test_course) }
      let!(:grading_period) do
        grading_period_group.grading_periods.create!(
          title: "Some Semester",
          start_date: 3.months.ago,
          end_date: 2.months.from_now)
      end
      let(:assignment_due_in_grading_period) do
        test_course.assignments.create!(
          due_at: 10.days.from_now(grading_period.start_date),
          points_possible: 10
        )
      end
      let(:assignment_due_outside_of_grading_period) do
        test_course.assignments.create!(
          due_at: 10.days.ago(grading_period.start_date),
          points_possible: 10
        )
      end
      let(:teacher) { test_course.teachers.active.first }

      context "as an observer" do
        let(:observer) do
          observer = user_with_pseudonym(active_all: true)
          course_with_user('StudentEnrollment', course: test_course, user: student1, active_all: true)
          course_with_user('StudentEnrollment', course: test_course, user: student2, active_all: true)
          student1.linked_observers << observer
          student2.linked_observers << observer
          observer
        end

        context "with grading periods" do
          it "returns the grading periods" 


          it "returns the grade for the current grading period for observed students" 


          it "returns the course grade for observed students if there is no current grading period" 


          context "selected_period_id" do
            it "returns the id of a current grading period, if one " \
            "exists and no grading period parameter is passed in" do
              user_session(observer)
              get 'grades'

              selected_period_id = assigns[:grading_periods][test_course.id][:selected_period_id]
              expect(selected_period_id).to eq grading_period.global_id
            end

            it "returns 0 (signifying 'All Grading Periods') if no current " \
            "grading period exists and no grading period parameter is passed in" do
              grading_period.start_date = 1.month.from_now
              grading_period.save!
              user_session(observer)
              get 'grades'

              selected_period_id = assigns[:grading_periods][test_course.id][:selected_period_id]
              expect(selected_period_id).to eq 0
            end

            it "returns the grading_period_id passed in, if one is provided along with a course_id" 

          end
        end
      end

      context "as a student" do
        let(:another_test_course) { course_factory(active_all: true) }
        let(:test_student) do
          student = user_factory(active_all: true)
          course_with_user('StudentEnrollment', course: test_course, user: student, active_all: true)
          course_with_user('StudentEnrollment', course: another_test_course, user: student, active_all: true)
          student
        end

        context "with grading periods" do
          it "returns the grading periods" 


          context "selected_period_id" do
            it "returns the id of a current grading period, if one " \
            "exists and no grading period parameter is passed in" do
              user_session(test_student)
              get 'grades'

              selected_period_id = assigns[:grading_periods][test_course.id][:selected_period_id]
              expect(selected_period_id).to eq grading_period.global_id
            end

            it "returns the grade for the current grading period, if one exists " \
              "and no grading period is passed in" do
              assignment = test_course.assignments.create!(
                due_at: 3.days.from_now(grading_period.end_date),
                points_possible: 10
              )
              assignment.grade_student(test_student, grader: test_course.teachers.first, grade: 10)
              user_session(test_student)
              get :grades
              expect(assigns[:grades][:student_enrollments][test_course.id]).to be_nil
            end

            it "returns 0 (signifying 'All Grading Periods') if no current " \
            "grading period exists and no grading period parameter is passed in" do
              grading_period.start_date = 1.month.from_now
              grading_period.save!
              user_session(test_student)
              get 'grades'

              selected_period_id = assigns[:grading_periods][test_course.id][:selected_period_id]
              expect(selected_period_id).to eq 0
            end

            it "returns the grade for 'All Grading Periods' if no current " \
              "grading period exists and no grading period is passed in" do
              grading_period.update!(start_date: 1.month.from_now)
              assignment = test_course.assignments.create!(
                due_at: 3.days.from_now(grading_period.end_date),
                points_possible: 10
              )
              assignment.grade_student(test_student, grader: test_course.teachers.first, grade: 10)
              user_session(test_student)
              get :grades
              expect(assigns[:grades][:student_enrollments][test_course.id]).to eq(100.0)
            end

            it "returns the grading_period_id passed in, if one is provided along with a course_id" 


            context 'across shards' do
              specs_require_sharding

              it 'uses global ids for grading periods' 

            end
          end
        end
      end
    end

    it "does not include designers in the teacher enrollments" 


    it "does not redirect to an observer enrollment with no observee" 


    it "does not include student view students in the grade average calculation" 


    context 'across shards' do
      specs_require_sharding

      it 'loads courses from all shards' 

    end
  end

  describe "GET 'avatar_image'" do
    it "should redirect to no-pic if avatars are disabled" 


    it "should redirect to avatar silhouette if no avatar is set and avatars are enabled" 


    it "should pass along the default fallback to placeholder image" 


    it "should take an invalid id and return silhouette" 


    it "should take an invalid id with a hyphen and return silhouette" 

  end

  describe "GET 'public_feed.atom'" do
    before(:each) do
      course_with_student(:active_all => true)
      assignment_model(:course => @course)
      @course.discussion_topics.create!(:title => "hi", :message => "blah", :user => @student)
      wiki_page_model(:course => @course)
    end

    it "should require authorization" 


    it "should include absolute path for rel='self' link" 


    it "should include an author for each entry" 

  end

  describe "GET 'admin_merge'" do
    let(:account) { Account.create! }

    before do
      account_admin_user
      user_session(@admin)
    end

    describe 'as site admin' do
      before { Account.site_admin.account_users.create!(user: @admin) }

      it 'warns about merging a user with itself' 


      it 'does not issue warning if the users are different' 

    end

    it "should not allow you to view any user by id" 

  end

  describe "GET 'show'" do
    context "sharding" do
      specs_require_sharding

      it "should include enrollments from all shards for the actual user" 


      it "should include enrollments from all shards for trusted account admins" 

    end

    it "should not let admins see enrollments from other accounts" 


    it "should respond to JSON request" 

  end

  describe "PUT 'update'" do
    it "does not leak information about arbitrary users" 

  end

  describe "POST 'masquerade'" do
    specs_require_sharding

    it "should associate the user with target user's shard" 


    it "should not associate the user with target user's shard if masquerading failed" 


    it "should not associate the user with target user's shard for non-db page views" 

  end

  describe 'GET masquerade' do
    let(:user2) do
      user2 = user_with_pseudonym(name: "user2", short_name: "u2")
      user2.pseudonym.sis_user_id = "user2_sisid1"
      user2.pseudonym.integration_id = "user2_intid1"
      user2.pseudonym.unique_id = "user2_login1@foo.com"
      user2.pseudonym.save!
      user2
    end

    before do
      user_session(site_admin_user)
    end

    it 'should set the js_env properly with act as user data' 

  end

  describe 'GET media_download' do
    let(:kaltura_client) do
      kaltura_client = instance_double('CanvasKaltura::ClientV3')
      allow(CanvasKaltura::ClientV3).to receive(:new).and_return(kaltura_client)
      kaltura_client
    end

    let(:media_source_fetcher) {
      media_source_fetcher = instance_double('MediaSourceFetcher')
      expect(MediaSourceFetcher).to receive(:new).with(kaltura_client).and_return(media_source_fetcher)
      media_source_fetcher
    }

    before do
      account = Account.create!
      course_with_student(:active_all => true, :account => account)
      user_session(@student)
    end

    it 'should pass type and media_type params down to the media fetcher' 


    context 'when redirect is set to 1' do
      it 'should redirect to the url' 

    end

    context 'when redirect does not equal 1' do
      it 'should render the url in json' 

    end

    context 'when asset is not found' do
      it 'should render a 404 and error message' 

    end
  end

  describe "login hooks" do
    before :each do
      Account.default.canvas_authentication_provider.update_attribute(:self_registration, true)
    end

    it "should hook on new" 


    it "should hook on failed create" 

  end

  describe "teacher_activity" do
    it "finds submission comment interaction" 


    it "finds ungraded submissions but not if the assignment is deleted" 

  end

  describe '#toggle_hide_dashcard_color_overlays' do
    it 'updates user preference based on value provided' 

  end

  describe '#dashboard_view' do
    before(:each) do
      course_factory
      user_factory(active_all: true)
      user_session(@user)
    end

    it 'sets the proper user preference on PUT requests' 


    it 'does not allow arbitrary values to be set' 

  end

  describe "#invite_users" do
    it 'does not work without ability to manage students or admins on course' 


    it 'does not work without open registration or manage_user_logins rights' 


    it 'works with an admin with manage_login_rights' 


    it 'works with a teacher with open_registration' 


    it 'invites a bunch of users' 


    it 'checks for pre-existing users' 

  end

  describe "#user_dashboard" do
    context "with student planner feature enabled" do
      before(:once) do
        @account = Account.default
        @account.enable_feature! :student_planner
      end

      it "sets ENV.STUDENT_PLANNER_ENABLED to false when user has no student enrollments" 


      it "sets ENV.STUDENT_PLANNER_ENABLED to true when user has a student enrollment" 


      it "sets ENV.STUDENT_PLANNER_COURSES" 


      it "sets ENV.STUDENT_PLANNER_GROUPS" 


    end
  end

  describe "#pandata_events_token" do
    it 'should return bad_request if called without an access token' 

  end

end

