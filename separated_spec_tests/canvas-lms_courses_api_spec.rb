#
# Copyright (C) 2011 - 2014 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../file_uploads_spec_helper')

class TestCourseApi
  include Api::V1::Course
  def feeds_calendar_url(feed_code); "feed_calendar_url(#{feed_code.inspect})"; end

  def course_url(course, opts = {}); return "course_url(Course.find(#{course.id}), :host => #{HostUrl.context_host(@course1)})"; end

  def api_user_content(syllabus, course); return "api_user_content(#{syllabus}, #{course.id})"; end

  attr_accessor :master_courses
  def master_courses?
    master_courses
  end
end

describe Api::V1::Course do
  describe '#course_json' do
    before :once do
      @test_api = TestCourseApi.new
      course_with_teacher(:active_all => true, :user => user_with_pseudonym)
      @me = @user
      @course1 = @course
      course_with_student(:user => @user, :active_all => true)
      @course2 = @course
      @course2.update_attribute(:sis_source_id, 'TEST-SIS-ONE.2011')
      @user.pseudonym.update_attribute(:sis_user_id, 'user1')
    end

    let(:teacher_enrollment) { @course1.teacher_enrollments.first }

    it 'should support optionally providing the url' 


    it 'should only include needs_grading_count if requested' 


    it 'should only include is_favorite if requested' 


    it 'should honor needs_grading_count for teachers' 


    it 'should return storage_quota_used_mb if requested' 


    it 'should not honor needs_grading_count for designers' 


    it 'should include apply_assignment_group_weights' 


    it "should not show details if user is restricted from access by course dates" 


    it "should include course progress" 


    it "should include course progress error unless course is module based" 


    it "should include the total amount of invited and active students if 'total_students' flag is given" 


    it "counts students with multiple enrollments once in 'total students'" 


    it "excludes the student view student in 'total students'" 


    it "includes the course nickname if one is set" 


    describe "total_scores" do
      before(:each) do
        @enrollment.scores.create!(
          current_score: 95.0, final_score: 85.0,
          unposted_current_score: 94.0, unposted_final_score: 84.0
        )
        @course.grading_standard_enabled = true
        @course.save!
      end

      let(:json) { @test_api.course_json(@course1, @me, {}, ['total_scores'], [@enrollment]) }

      let(:expected_result_without_unposted) do
        {
          "type" => "student",
          "role" => student_role.name,
          "role_id" => student_role.id,
          "user_id" => @me.id,
          "enrollment_state" => "active",
          "computed_current_score" => 95.0,
          "computed_final_score" => 85.0,
          "computed_current_grade" => "A",
          "computed_final_grade" => "B"
        }
      end

      let(:expected_result_with_unposted) do
        expected_result_without_unposted.merge({
          "unposted_current_score" => 94.0,
          "unposted_final_score" => 84.0,
          "unposted_current_grade" => "A",
          "unposted_final_grade" => "B"
        })
      end

      it "should include computed scores" 


      it "should include unposted scores if user has :manage_grades" 


      it "should include unposted scores if user has :view_all_grades" 


      it "should not include unposted scores if user does not have permission" 

    end

    describe "current_grading_period_scores" do
      before(:each) do
        @course.grading_standard_enabled = true
        create_grading_periods_for(@course, grading_periods: [:current, :future])

        current_assignment = @course.assignments.create!(
          title: "Current",
          due_at: 2.days.ago,
          points_possible: 10
        )
        current_assignment.grade_student(@student, grader: @teacher, score: 2)
        unposted_current_assignment = @course.assignments.create!(
          title: "Current",
          due_at: 2.days.ago,
          points_possible: 10,
          muted: true
        )
        unposted_current_assignment.grade_student(@student, grader: @teacher, score: 9)

        future_assignment = @course.assignments.create!(
          title: "Future",
          due_at: 4.months.from_now,
          points_possible: 10,
        )
        future_assignment.grade_student(@student, grader: @teacher, score: 7)

        @course.save!
        @me = @teacher
      end

      let(:json) do
        @test_api.course_json(@course, @me, {}, ['total_scores', 'current_grading_period_scores'], [@enrollment])
      end

      let(:student_enrollment) { json['enrollments'].first }

      let(:expected_fields_without_unposted) do
        {
          "type" => "student",
          "role" => student_role.name,
          "role_id" => student_role.id,
          "user_id" => @student.id,
          "enrollment_state" => "active",
          "computed_current_score" => 45.0,
          "computed_final_score" => 30.0,
          "computed_current_grade" => "F",
          "computed_final_grade" => "F",
          "current_period_computed_current_score" => 20.0,
          "current_period_computed_final_score" => 10.0,
          "current_period_computed_current_grade" => "F",
          "current_period_computed_final_grade" => "F"
        }
      end

      let(:unposted_fields) do
        {
          "unposted_current_score" => 60.0,
          "unposted_final_score" => 60.0,
          "unposted_current_grade" => "F",
          "unposted_final_grade" => "F",
          "current_period_unposted_current_score" => 55.0,
          "current_period_unposted_final_score" => 55.0,
          "current_period_unposted_current_grade" => "F",
          "current_period_unposted_final_grade" => "F"
        }
      end

      let(:expected_fields_with_unposted) { expected_fields_without_unposted.merge(unposted_fields) }

      it "should always include computed scores" 


      it "should include unposted scores if user has :manage_grades" 


      it "should include unposted scores if user has :view_all_grades" 


      it "should not include unposted scores if user does not have permission" 

    end

    context "master course stuff" do
      before do
        @test_api.master_courses = true
      end

      let(:json) { @test_api.course_json(@course1, @me, {}, [], []) }

      it "should return blueprint status" 


      it "should return blueprint restrictions" 


      it "should return blueprint restrictions by type" 

    end
  end

  describe '#add_helper_dependant_entries' do
    let(:hash) { Hash.new }
    let(:course) { double( :feed_code => 573, :id => 42, :syllabus_body => 'syllabus text' ).as_null_object }
    let(:course_json) { double.as_null_object() }
    let(:api) { TestCourseApi.new }

    let(:result) do
      result_hash = api.add_helper_dependant_entries(hash, course, course_json)
      class << result_hash
        def method_missing(method_name, *args)
          self[method_name.to_s]
        end
      end
      result_hash
    end

    subject { result }

    it { is_expected.to eq hash }

    describe '#calendar' do
      subject { super().calendar }
      it { is_expected.to eq({ 'ics' => "feed_calendar_url(573).ics" }) }
    end

    describe 'when the include options are all set off' do
      let(:course_json){ double( :include_syllabus => false, :include_url => false ) }

      describe '#syllabus_body' do
        subject { super().syllabus_body }
        it { is_expected.to be_nil }
      end

      describe '#html_url' do
        subject { super().html_url }
        it { is_expected.to be_nil }
      end
    end

    describe 'when everything is included' do
      let(:course_json){ double( :include_syllabus => true, :include_url => true ) }

      describe '#syllabus_body' do
        subject { super().syllabus_body }
        it { is_expected.to eq "api_user_content(syllabus text, 42)" }
      end

      describe '#html_url' do
        subject { super().html_url }
        it { is_expected.to eq "course_url(Course.find(42), :host => localhost)" }
      end
    end
  end
end

describe CoursesController, type: :request do
  let(:user_api_fields) { %w(id name sortable_name short_name) }

  before :once do
    course_with_teacher(:active_all => true, :user => user_with_pseudonym(:name => 'UWP'))
    @me = @user
    @course1 = @course
    course_with_student(:user => @user, :active_all => true)
    @course2 = @course
    @course2.update_attribute(:sis_source_id, 'TEST-SIS-ONE.2011')
    @course2.update_attributes(:default_view => 'assignments')
    @user.pseudonym.update_attribute(:sis_user_id, 'user1')
  end

  before :each do
    @course_dates_stubbed = true
    allow_any_instance_of(Course).to receive(:start_at).and_wrap_original { |original| original.call unless @course_dates_stubbed }
    allow_any_instance_of(Course).to receive(:end_at).and_wrap_original { |original| original.call unless @course_dates_stubbed }
  end

  describe "observer viewing a course" do
    before :once do
      @observer_enrollment = course_with_observer(active_all: true)
      @observer = @user
      @observer_course = @course
      @observed_student = create_users(1, return_type: :record).first
      @student_enrollment =
        @observer_course.enroll_student(@observed_student,
                                        :enrollment_state => 'active')
      @assigned_observer_enrollment =
        @observer_course.enroll_user(@observer, "ObserverEnrollment",
                                     :associated_user_id => @observed_student.id)
      @assigned_observer_enrollment.accept
    end

    it "should include observed users in the enrollments in a specific course if requested" 


    it "should include observed users in the enrollments if requested" 


    it "should not include observed users in the enrollments if not requested" 

  end

  describe "permissions for courses" do
    describe "undelete_courses" do
      before do
        @path = "/api/v1/accounts/#{@course.account.id}/courses"
        @params = { :controller => 'courses', :action => 'batch_update', :format => 'json', :account_id => Account.default.to_param }
      end

      context "given I have permission" do
        before do
          account_admin_user
        end

        it "returns 200 success" 

      end

      context "given I don't have permission" do
        before do
          user_model
        end

        it "returns 401 unauthorized access" 

      end
    end
  end

  it "should return course list" 


  it "returns course list ordered by name (including nicknames)" 


  it "should exclude master courses if requested" 


  describe "user index" do
    specs_require_sharding
    before :once do
      account_admin_user
    end
    it "should return a course list for an observed students" 


    it "should fail if trying to view courses for student that is not observee" 


    it "should return courses from observed user's shard if different than observer" 


    it "should return courses for a user if requestor is administrator" 


    it "should return courses for self" 


    it "should check include permissions against the caller" 


    it "should return course progress for the subject" 


    it "should use the caller's course nickname, not the subject's" 

  end

  it 'should paginate the course list' 


  it 'should not include permissions' 


  describe "course creation" do
    context "an account admin" do
      before :once do
        @account = Account.default
        account_admin_user
        @resource_path = "/api/v1/accounts/#{@account.id}/courses"
        @resource_params = { :controller => 'courses', :action => 'create', :format => 'json', :account_id => @account.id.to_s }
      end

      before do
        @course_dates_stubbed = false
      end

      it "should create a new course" 


      it "should allow enrollment_term_id on course create" 


      it 'should process html content in syllabus_body on create' 


      it "should offer a course if passed the 'offer' parameter" 


      it "doesn't offer a course if passed a false 'offer' parameter" 


      it "should allow setting sis_course_id without offering the course" 


      context "sis reactivation" do
        it "should allow reactivating deleting courses using sis_course_id" 


        it "should raise an error trying to reactivate an active course" 


        it "should carry on if there's no course to reactivate" 

      end

      it "should set the apply_assignment_group_weights flag" 


      it "should set the storage quota" 


      context "without :manage_storage_quotas" do
        before :once do
          @role = custom_account_role 'lamer', :account => @account
          @account.role_overrides.create! :permission => 'manage_courses', :enabled => true,
                                          :role => @role
          user_factory
          @account.account_users.create!(user: @user, role: @role)
        end

        it "should ignore storage_quota" 


        it "should ignore storage_quota_mb" 

      end
    end

    context "a user without permissions" do
      it "should return 401 Unauthorized if a user lacks permissions" 

    end
  end

  describe "course update" do
    before :once do
      account_admin_user
      @term = @course.root_account.enrollment_terms.create
      @path   = "/api/v1/courses/#{@course.id}"
      @params = { :controller => 'courses', :action => 'update', :format => 'json', :id => @course.to_param }
      @new_values = { 'course' => {
        'name' => 'New Name',
        'course_code' => 'NEW-001',
        'sis_course_id' => 'NEW12345',
        'integration_id' => nil,
        'start_at' => '2012-03-01T00:00:00Z',
        'end_at' => '2012-03-30T23:59:59Z',
        'license' => 'public_domain',
        'is_public' => true,
        'term_id' => @term.id,
        'public_syllabus' => true,
        'public_description' => 'new description',
        'allow_wiki_comments' => true,
        'allow_student_forum_attachments' => true,
        'open_enrollment' => true,
        'self_enrollment' => true,
        'hide_final_grades' => false,
        'apply_assignment_group_weights' => true,
        'restrict_enrollments_to_course_dates' => true,
        'default_view' => 'syllabus',
        'course_format' => 'on_campus',
        'time_zone' => 'Pacific/Honolulu'
      }, 'offer' => true }
    end

    before do
      @course_dates_stubbed = false
    end

    context "an account admin" do
      it "should be able to update a course" 


      it "should not be able to update default_view to arbitrary values" 


      it "should not be able to update default_view to 'wiki' without a front page" 


      it "should be able to update default_view to 'wiki' with a front page" 


      it "should not change dates that aren't given" 


      it "should accept enrollment_term_id for updating the term" 


      it "should allow a date to be deleted" 


      it "should allow updating only the offer parameter" 


      it "should be able to update the storage_quota" 


      it "should update the apply_assignment_group_weights flag from true to false" 


      it "should update the grading standard with account level standard" 


      it "should update the grading standard with course level standard" 


      it "should update a sub account grading standard" 


      it "should update the grading standard with account standard from sub account" 


      it "should not update grading standard from sub account not on account chain" 


      it "should not delete existing grading standard when invalid standard provided" 


      it "should remove a grading standard if an empty value is passed" 


      it "should not remove a grading standard if no value is passed" 


      context "when an assignment is due in a closed grading period" do
        before(:once) do
          @course.update_attributes(group_weighting_scheme: "equal")
          @grading_period_group = Factories::GradingPeriodGroupHelper.new.create_for_account(@course.root_account)
          term = @course.enrollment_term
          term.grading_period_group = @grading_period_group
          term.save!
          Factories::GradingPeriodHelper.new.create_for_group(@grading_period_group, {
            start_date: 2.weeks.ago, end_date: 2.days.ago, close_date: 1.day.ago
          })
          @group = @course.assignment_groups.create!(name: 'group')
          @assignment = @course.assignments.create!({
            title: 'assignment', assignment_group: @group, due_at: 1.week.ago
          })
        end

        it "can change apply_assignment_group_weights with a term change" 


        it "can change apply_assignment_group_weights without a term change" 


        it "can change group_weighting_scheme with a term change" 


        it "can change group_weighting_scheme without a term change" 


        it 'cannot change group_weighting_scheme if any effective due dates in the whole course are in a closed grading period' 

      end
    end

    context "a designer" do
      before(:once) do
        course_with_designer(:course => @course, :active_all => true)
        @standard = @course.account.grading_standards.create!(:title => "account standard", :standard_data => {:a => {:name => 'A', :value => '95'}, :b => {:name => 'B', :value => '80'}, :f => {:name => 'F', :value => ''}})
      end

      it "should require :manage_grades rights if the grading standard is changing" 


      it "should not require :manage_grades rights if the grading standard is not changing" 


      it "should not require :manage_grades rights if the grading standard isn't changing (null)" 

    end

    context "a teacher" do
      before :once do
        user_factory
        enrollment = @course.enroll_teacher(@user)
        enrollment.accept!
        @new_values['course'].delete('sis_course_id')
      end

      it "should be able to update a course" 


      it 'should process html content in syllabus_body on update' 


      it "should not be able to update the storage quota (bytes)" 


      it "should not be able to update the storage quota (mb)" 


      it "should not be able to update the sis id" 


      context "when an assignment is due in a closed grading period" do
        before :once do
          @course.update_attributes(group_weighting_scheme: "equal")
          @grading_period_group = Factories::GradingPeriodGroupHelper.new.create_for_account(@course.root_account)
          term = @course.enrollment_term
          term.grading_period_group = @grading_period_group
          term.save!
          Factories::GradingPeriodHelper.new.create_for_group(@grading_period_group, {
            start_date: 2.weeks.ago, end_date: 2.days.ago, close_date: 1.day.ago
          })
          @group = @course.assignment_groups.create!(name: 'group')
          @assignment = @course.assignments.create!({
            title: 'assignment', assignment_group: @group, due_at: 1.week.ago
          })
        end

        it "cannot change apply_assignment_group_weights with a term change" 


        it "cannot change apply_assignment_group_weights without a term change" 


        it "cannot change group_weighting_scheme with a term change" 


        it "cannot change group_weighting_scheme without a term change" 


        it "succeeds when apply_assignment_group_weights is not changed" 


        it "succeeds when group_weighting_scheme is not changed" 


        it "ignores deleted assignments" 

      end
    end

    context "an unauthorized user" do
      before { user_factory }

      it "should return 401 unauthorized" 

    end
  end

  describe "course deletion" do
    before :once do
      account_admin_user
      @path = "/api/v1/courses/#{@course.id}"
      @params = { :controller => 'courses', :action => 'destroy', :format => 'json', :id => @course.id.to_s }
    end
    context "an authorized user" do
      it "should be able to delete a course" 


      it "should not clear sis_id for course" 


      it "should conclude when completing a course" 


      it "should return 400 if params[:event] is missing" 


      it "should return 400 if an unknown event type is used" 

    end
    context "an unauthorized user" do
      it "should return 401" 

    end
  end

  describe "reset content" do
    before :once do
      @user = @teacher
      @path = "/api/v1/courses/#{@course.id}/reset_content"
      @params = { :controller => 'courses', :action => 'reset_content', :format => 'json', :course_id => @course.id.to_s }
    end
    context "an authorized user" do
      it "should be able to reset a course" 

    end
    context "an unauthorized user" do
      it "should return 401" 

    end
  end

  describe "batch edit" do
    before :once do
      @account = Account.default
      account_admin_user
      theuser = @user
      @path = "/api/v1/accounts/#{@account.id}/courses"
      @params = { :controller => 'courses', :action => 'batch_update', :format => 'json', :account_id => @account.to_param }
      @course1 = course_model :sis_source_id => 'course1', :account => @account, :workflow_state => 'created'
      @course2 = course_model :sis_source_id => 'course2', :account => @account, :workflow_state => 'created'
      @course3 = course_model :sis_source_id => 'course3', :account => @account, :workflow_state => 'created'
      @user = theuser
    end

    context "an authorized user" do
      let(:course_ids){ [@course1.id, @course2.id, @course3.id] }
      it "should delete multiple courses" 


      it "should conclude multiple courses" 


      it "should publish multiple courses" 


      it "should accept sis ids" 


      it 'should undelete courses' 


      it "should not conclude deleted courses" 


      it "should not publish deleted courses" 


      it "should update progress" 


      it "should return 400 if :course_ids is missing" 


      it "should return 400 if :event is missing" 


      it "should return 400 if :event is invalid" 


      it "should return 403 if the list of courses is too long" 


      it "should deal gracefully with an invalid course id" 


      it "should not update courses in another account" 


      it "should succeed when publishing already published courses" 


      it "should succeed when concluding already concluded courses" 


      it "should be able to unconclude courses" 


      it "should report a failure if no updates succeeded" 


      it "should report a failure if an exception is raised outside course update" 

    end

    context "an unauthorized user" do
      it "should return 401" 

    end
  end

  it "includes section enrollments if requested" 


  it 'includes account if requested' 


  it 'includes subaccount_name if requested for backwards compatibility' 


  it "should include term name in course list if requested" 


  describe "term dates" do
    before do
      @course2.enrollment_term.set_overrides(@course1.account, 'StudentEnrollment' =>
          {start_at: '2014-01-01T00:00:00Z', end_at: '2014-12-31T00:00:00Z'})
    end

    it "should return overridden term dates from index" 


    it "should return overridden term dates from show" 

  end

  it "should return public_syllabus if requested" 


  it "should return public_syllabus_to_auth if requested" 



  describe "scores" do
    before(:once) do
      @course2.grading_standard_enabled = true
      @course2.save
    end

    def courses_api_index_call(includes: ['total_scores'])
      api_call(
        :get, "/api/v1/courses.json",
        { controller: 'courses', action: 'index', format: 'json' },
        { include: includes }
      )
    end

    def enrollment(json_response)
      course2 = json_response.find { |course| course['id'] == @course2.id }
      course2['enrollments'].first
    end

    context "include total scores" do
      before(:once) do
        student_enrollment = @course2.all_student_enrollments.first
        student_enrollment.scores.create!(current_score: 80, final_score: 70, unposted_current_score: 10)
      end

      it "includes scores in course list if requested" 


      it "does not include unposted scores for a self-viewing user" 


      it "does not include scores in course list, even if requested, if final grades are hidden" 

    end

    context "include current grading period scores" do
      let(:grading_period_keys) do
        [ 'multiple_grading_periods_enabled',
          'has_grading_periods',
          'totals_for_all_grading_periods_option',
          'current_period_computed_current_score',
          'current_period_computed_final_score',
          'current_period_computed_current_grade',
          'current_period_computed_final_grade',
          'current_grading_period_title',
          'current_grading_period_id' ]
      end

      before(:once) do
        create_grading_periods_for(
          @course2, grading_periods: [:old, :current, :future]
        )
      end

      it "includes current grading period scores if 'total_scores' " \
      "and 'current_grading_period_scores' are requested" do
        json_response = courses_api_index_call(includes: ['total_scores', 'current_grading_period_scores'])
        enrollment_json = enrollment(json_response)
        expect(enrollment_json).to include(*grading_period_keys)
        current_grading_period_title = 'Course Period 2: current period'
        expect(enrollment_json['current_grading_period_title']).to eq(current_grading_period_title)
      end

      it "ignores soft-deleted grading periods when determining the current grading period" 


      it "does not include current grading period scores if 'total_scores' are " \
      "not requested, even if 'current_grading_period_scores' are requested" do
        json_response = courses_api_index_call(includes: ['current_grading_period_scores'])
        enrollment_json = enrollment(json_response)
        expect(enrollment_json).to_not include(*grading_period_keys)
      end

      it "does not include current grading period scores if final grades are hidden, " \
      " even if 'total_scores' and 'current_grading_period_scores' are requested" do
        @course2.hide_final_grades = true
        @course2.save
        json_response = courses_api_index_call(includes: ['total_scores', 'current_grading_period_scores'])
        enrollment_json = enrollment(json_response)
        expect(enrollment_json).not_to include(*grading_period_keys)
      end

      it "returns true for 'has_grading_periods' on the enrollment " \
      "JSON if the course has grading periods" do
        json_response = courses_api_index_call(includes: ['total_scores', 'current_grading_period_scores'])
        enrollment_json = enrollment(json_response)
        expect(enrollment_json['has_grading_periods']).to be true
        expect(enrollment_json['multiple_grading_periods_enabled']).to be true
      end

      it "returns 'has_grading_periods' and 'has_weighted_grading_periods' keys at the course-level " \
      "on the JSON response if 'current_grading_period_scores' are requested" do
        course_json_response = courses_api_index_call(includes: ['total_scores', 'current_grading_period_scores']).first
        expect(course_json_response).to have_key 'has_grading_periods'
        expect(course_json_response).to have_key 'multiple_grading_periods_enabled'
        expect(course_json_response).to have_key 'has_weighted_grading_periods'
      end

      it "does not return 'has_grading_periods' and 'has_weighted_grading_periods' keys at the course-level " \
      "on the JSON response if 'current_grading_period_scores' are not requested" do
        course_json_response = courses_api_index_call.first
        expect(course_json_response).not_to have_key 'has_grading_periods'
        expect(course_json_response).not_to have_key 'multiple_grading_periods_enabled'
        expect(course_json_response).not_to have_key 'has_weighted_grading_periods'
      end

      context "computed scores" do
        before(:once) do
          assignment_in_current_period = @course2.assignments.create!(
            title: "In current grading period - graded",
            due_at: 2.days.from_now,
            points_possible: 10
          )
          assignment_in_current_period.grade_student(@student, grader: @teacher, score: 9)
          @course2.assignments.create!(
            title: "In current grading period - not graded",
            due_at: 2.days.from_now,
            points_possible: 10
          )
        end

        context "all assignments for the course fall within the current grading period" do
          it "current grading period scores match computed scores" 


          it "current grading period grades match computed grades" 

        end

        context "assignments span across many grading periods" do
          before(:once) do
            assignment_in_future_grading_period = @course2.assignments.create!(
              title: "In future grading period",
              due_at: 3.months.from_now,
              points_possible: 10
            )
            assignment_in_future_grading_period.grade_student(@student, grader: @teacher, score: 10)
          end

          it "current grading period scores and grades do not match computed scores and grades" 


          it "current grading period scores are correct" 


          it "current grading period grades are correct" 

        end
      end
    end
  end

  it "should only return teacher enrolled courses on ?enrollment_type=teacher" 


  describe "enrollment_role" do
    before :once do
      @role = Account.default.roles.build :name => 'SuperTeacher'
      @role.base_role_type = 'TeacherEnrollment'
      @role.save!
      @course3 = course_factory
      @course3.enroll_user(@me, 'TeacherEnrollment', { :role => @role, :active_all => true })
    end

    it "should return courses with all teacher types on ?enrollment_type=teacher" 


    it "should return only courses with vanilla TeacherEnrollments on ?enrollment_role=TeacherEnrollment" 


    it "should return courses by custom role" 

  end

  describe "enrollment_state" do
    before :once do
      @course2.start_at = 1.day.from_now
      @course2.conclude_at = 2.days.from_now
      @course2.restrict_enrollments_to_course_dates = true
      @course2.save! # pending_active

      @course3 = course_factory(active_all: true)
      @course3.enroll_user(@me, 'StudentEnrollment') #invited

      @course4 = course_factory(active_all: true)
      @course4.enroll_user(@me, 'StudentEnrollment')
      @course4.start_at = 2.days.ago
      @course4.conclude_at = 1.day.ago
      @course4.restrict_enrollments_to_course_dates = true
      @course4.save! # completed
    end

    it "should return courses with active enrollments" 


    it "should return courses with invited or pending enrollments" 


    it "should return courses with completed enrollments" 


    it "should return active observed student enrollments if requested" 

  end

  describe "course state" do
    before :once do
      @role = Account.default.roles.build :name => 'SuperTeacher'
      @role.base_role_type = 'TeacherEnrollment'
      @role.save!
      @course3 = course_factory
      @course3.enroll_user(@me, 'TeacherEnrollment', { :role => @role, :active_all => true })
      @course4 = course_factory
      @course4.enroll_user(@me, 'TaEnrollment')
      @course4.workflow_state = 'created'
      @course4.save
    end

    it "should return only courses with state available on ?state[]=available" 


    it "should return only courses with state unpublished on ?state[]=unpublished" 


    it "should return only courses with state unpublished and available on ?state[]=unpublished, available" 


    it "should return courses by custom role and state unpublished" 


    it "should not return courses with invited StudentEnrollment or ObserverEnrollment when state[]=unpublished" 


    it "should return courses with active StudentEnrollment or ObserverEnrollment when state[]=unpublished" 

  end

  context "course list + sharding" do
    specs_require_sharding

    before :once do
      @shard1.activate { @student = User.create!(name: 'outofshard') }
      enrollment = @course1.enroll_student(@student)
    end

    it "returns courses for out-of-shard users" 


    it "returns courses relative to root account shard when looking at other users" 

  end

  describe "root account filter" do
    before :once do
      @course1 = course_with_student(account: Account.default, active_all: true).course
      @course2 = course_with_student(account: account_model(name: 'other root account'), user: @student, active_all: true).course
    end

    it "should not filter by default" 


    it "should accept current_domain_only=true" 


    it "should accept root_account_id=self" 


    it "should accept root_account_id=id" 


    it "should return an empty result if the given root account does not exist" 

  end

  describe "/students" do
    it "should return the list of students for the course" 


    it "should not include user sis id or login id for non-admins" 


    it "should include user sis id and login id if account admin" 


    it "should include user sis id and login id if can manage_students in the course" 


    it "should include user sis id and login id if site admin" 


    it "should allow specifying course sis id" 


    it "should not be paginated (for legacy reasons)" 

  end

  describe "users" do
    before :once do
      @section1 = @course1.default_section
      @section2 = @course1.course_sections.create!(:name => 'Section B')
      @ta = user_factory(:name => 'TAPerson')
      @ta.communication_channels.create!(:path => 'ta@ta.com') { |cc| cc.workflow_state = 'confirmed' }
      @ta_enroll1 = @course1.enroll_user(@ta, 'TaEnrollment', :section => @section1)
      @ta_enroll2 = @course1.enroll_user(@ta, 'TaEnrollment', :section => @section2, :allow_multiple_enrollments => true)

      @student1 = user_factory(:name => 'SSS1')
      @student2 = user_factory(:name => 'SSS2')
      @student1_enroll = @course1.enroll_user(@student1, 'StudentEnrollment', :section => @section1)
      @student2_enroll = @course1.enroll_user(@student2, 'StudentEnrollment', :section => @section2)

      @test_student = @course1.student_view_student
    end

    describe "search users" do
      let(:api_url) { "/api/v1/courses/#{@course1.id}/users.json" }
      let(:api_route) do
        {
          :controller => 'courses',
          :action => 'users',
          :course_id => @course1.id.to_s,
          :format => 'json'
        }
      end

      it "returns an error when search_term is fewer than 3 characters" 


      it "returns a list of users" 


      it "returns concluded enrollments if ?enrollment_state[]=concluded" 


      it "returns enrollments when filtering by enrollment_state" 


      it "returns active and invited enrollments if no enrollment state is given" 


      it "accepts a list of enrollment_types" 


      it "respects limit option (as pagination)" 


      it "should respect includes" 


      context "sharding" do
        specs_require_sharding

        it "should load the user's enrollment for an out-of-shard user" 

      end
    end

    describe "/users" do
      let(:api_url) {"/api/v1/courses/#{@course1.id}/users.json"}
      let(:api_route) do
        {
          controller: 'courses',
          action: 'users',
          course_id: @course1.id.to_s,
          format: 'json'
        }
      end

      it "returns an empty array for a page past the end" 


      it "returns a 404 for an otherwise invalid page" 


      it "returns a list of users" 


      it "returns a list of users filtered by id if user_ids is given" 


      it "excludes the test student by default" 


      context "inactive enrollments" do
        before do
          @inactive_user = user_with_pseudonym(:name => "Inactive User")
          student_in_course(:course => @course1, :user => @inactive_user)
          @inactive_enroll = @inactive_user.enrollments.first
          @inactive_enroll.deactivate
        end

        it "excludes users with inactive enrollments for students" 


        it "includes users with inactive enrollments for teachers" 


        it 'does not include inactive enrollments by default' 

      end

      it "includes the test student if told to do so" 


      it "returns a list of users with emails (unless unconfirmed)" 


      it "returns a list of users and enrollments with enrollments option" 


      it "doesn't return enrollments from another course" 


      it "optionally filters users by enrollment_type" 


      it "should accept an array of enrollment_types" 


      describe "enrollment_role" do
        before :once do
          role = Account.default.roles.build :name => 'EliteStudent'
          role.base_role_type = 'StudentEnrollment'
          role.save!
          @student3 = user_factory(:name => 'S3')
          @student3_enroll = @course1.enroll_user(@student3, 'StudentEnrollment', { :role => role })
        end

        it "should return all student types with ?enrollment_type=student" 


        it "should return only base student types with ?enrollment_role=StudentEnrollment" 


        it "should return users with a custom role type" 


        it "should accept an array of enrollment roles" 

      end

      describe "enrollment_role_id" do
        before :once do
          @role = Account.default.roles.build :name => 'EliteStudent'
          @role.base_role_type = 'StudentEnrollment'
          @role.save!
          @student3 = user_factory(:name => 'S3')
          @student3_enroll = @course1.enroll_user(@student3, 'StudentEnrollment', { :role => @role })
        end

        it "should return only base student types with ?enrollment_role_id=(built_in_role id)" 


        it "should return users with a custom role type" 


        it "should accept an array of enrollment roles" 

      end

      it "maintains query parameters in link headers" 


      it "should not include sis user id or login id for non-admins" 


      it "should include user sis id and login id if account admin" 


      it "should include user sis id and login id if can manage_students in the course" 


      it "should include user sis id and login id if site admin" 


      describe "localized sorting" do
        before do
          skip("require pg_collkey") unless ActiveRecord::Base.connection.extension_installed?(:pg_collkey)
        end

        it "should use course-level locale setting for sorting" 

      end

      describe "as a student" do
        before :once do
          @other_user = user_with_pseudonym(:name => 'Waldo', :username => 'dontfindme@example.com')
          @other_user.pseudonym.update_attribute(:sis_user_id, 'mysis_8675309')
          @course1.enroll_student(@other_user).accept!

          @user = user_factory
          @course1.enroll_student(@user).accept!
        end

        it "should not return email addresses" 


        it "should search by name" 


        it "should not search by email address" 


        it "should not search by sis id" 

      end

      it "should allow specifying course sis id" 


      it "should paginate unique users correctly" 


      it "should allow jumping to a user's page based on id" 


      it "includes custom links if requested" 

    end

    it "should include observed users in the enrollments if requested" 

  end

  describe "user" do
    it "should allow searching for user by sis id" 


    it "shouldn't show other course enrollments to other students" 

  end

  it "should return the needs_grading_count for all assignments" 


  it "should return the course syllabus" 


  describe "#show" do
    it "should get individual course data" 


    it "should map 'created' to 'unpublished'" 


    it "should map 'claimed' to 'unpublished'" 


    it "should allow sis id in hex packed format" 


    it "should not find courses in other root accounts" 


    it 'should include permissions' 


    it 'should include permission create_discussion_topic' 


    it 'should include permission create_announcement' 


    it 'should include grading_standard_id' 


    it 'includes tabs if requested' 


    context "when scoped to account" do
      before :once do
        @admin = account_admin_user(:account => @course.account, :active_all => true)
        user_with_pseudonym(:user => @admin)
      end

      it "should 401 for unauthorized users" 


      it "should 404 for bad account id" 


      context "when course is active" do

        it "should find the course" 


        it "should scope to specified account" 


        it "should find courses in sub accounts" 


        it "should not find courses in sibling accounts" 

      end

      context "when course is deleted" do
        before :once do
          @course.destroy
        end

        it "should return 404" 


        it "should find a course if include all specified" 

      end
    end
  end

  context "course files" do
    include_examples "file uploads api with folders"
    include_examples "file uploads api with quotas"

    before :each do
      @context = @course
    end

    def preflight(preflight_params, opts = {})
      @user = @teacher
      api_call(:post, "/api/v1/courses/#{@course.id}/files",
        { :controller => "courses", :action => "create_file", :format => "json", :course_id => @course.to_param, },
        preflight_params,
        {},
        opts)
    end

    def has_query_exemption?
      false
    end

    def context
      @course
    end

    it "should require the correct permission to upload" 


    it "should create the file in unlocked state if :usage_rights_required is disabled" 


    it "should create the file in locked state if :usage_rights_required is enabled" 

  end

  describe "/settings" do
    before :once do
      course_with_teacher(:active_all => true)
    end

    it "should render settings json" 


    it "should update settings" 

  end

  describe "/recent_students" do
    before :once do
      course_with_teacher(:active_all => true)
      @student1 = student_in_course(:active_all => true, :name => "Sheldon Cooper").user
      @student2 = student_in_course(:active_all => true, :name => "Leonard Hofstadter").user
      @student3 = student_in_course(:active_all => true, :name => "Howard Wolowitz").user
      pseudonym(@student1) # no login info
      pseudonym(@student2).tap{|p| p.current_login_at = 1.days.ago; p.save!}
      pseudonym(@student3).tap{|p| p.current_login_at = 2.days.ago; p.save!}
    end

    it "should include the last_login information" 


    it "should sort by last_login" 

  end

  describe "/preview_html" do
    before :once do
      course_with_teacher(:active_all => true)
    end

    it "should sanitize html and process links" 


    it "should require permission to preview" 

  end

  it "should return the activity stream" 


  it "should return the activity stream summary" 


  it "should update activity time" 

end

def each_copy_option
  [[:assignments, :assignments], [:external_tools, :context_external_tools], [:files, :attachments],
   [:topics, :discussion_topics], [:calendar_events, :calendar_events], [:quizzes, :quizzes],
   [:modules, :context_modules], [:outcomes, :created_learning_outcomes]].each{|o| yield o}
end

describe ContentImportsController, type: :request do
  before :once do
    course_with_teacher(:active_all => true, :name => 'origin story')
    @copy_from = @course
    @copy_from.sis_source_id = 'from_course'

    # create one of everything that can be copied
    group = @course.assignment_groups.create!(:name => 'group1')
    @course.assignments.create!(:title => 'Assignment 1', :points_possible => 10, :assignment_group => group)
    @copy_from.discussion_topics.create!(:title => "Topic 1", :message => "<p>watup?</p>")
    @copy_from.syllabus_body = "haha"
    @copy_from.wiki_pages.create!(:title => "some page", :body => 'hi')
    @copy_from.context_external_tools.create!(:name => "new tool", :consumer_key => "key", :shared_secret => "secret", :domain => 'example.com')
    Attachment.create!(:filename => 'wut.txt', :display_name => "huh?", :uploaded_data => StringIO.new('uh huh.'), :folder => Folder.unfiled_folder(@copy_from), :context => @copy_from)
    @copy_from.calendar_events.create!(:title => 'event', :description => 'hi', :start_at => 1.day.from_now)
    @copy_from.context_modules.create!(:name => "a module")
    @copy_from.quizzes.create!(:title => 'quiz')
    @copy_from.root_outcome_group.add_outcome(@copy_from.created_learning_outcomes.create!(:short_description => 'oi', :context => @copy_from))
    @copy_from.save!

    course_with_teacher(:active_all => true, :name => 'whatever', :user => @user)
    @copy_to = @course
    @copy_to.sis_source_id = 'to_course'
    @copy_to.save!
  end

  def run_copy(to_id=nil, from_id=nil, options={})
    to_id ||= @copy_to.to_param
    from_id ||= @copy_from.to_param
    data = api_call(:post, "/api/v1/courses/#{to_id}/course_copy",
            { :controller => 'content_imports', :action => 'copy_course_content', :course_id => to_id, :format => 'json' },
    {:source_course => from_id}.merge(options))

    cm = ContentMigration.order(:id).last
    expect(data).to eq({
      'id' => cm.id,
      'progress' => nil,
      'status_url' => "http://www.example.com/api/v1/courses/#{@copy_to.to_param}/course_copy/#{cm.id}",
      'created_at' => cm.created_at.as_json,
      'workflow_state' => 'created',
    })

    status_url = data['status_url']

    api_call(:get, status_url, { :controller => 'content_imports', :action => 'copy_course_status', :course_id => @copy_to.to_param, :id => data['id'].to_param, :format => 'json' })
    (JSON.parse(response.body)).tap do |res|
      expect(res['workflow_state']).to eq 'started'
      expect(res['progress']).to eq 0
    end

    run_jobs
    cm.reload
    expect(cm.old_warnings_format).to eq []
    expect(cm.content_export.error_messages).to eq []

    api_call(:get, status_url, { :controller => 'content_imports', :action => 'copy_course_status', :course_id => @copy_to.to_param, :id => data['id'].to_param, :format => 'json' })
    (JSON.parse(response.body)).tap do |res|
      expect(res['workflow_state']).to eq 'completed'
      expect(res['progress']).to eq 100
    end
  end

  def run_unauthorized(to_id, from_id)
    status = raw_api_call(:post, "/api/v1/courses/#{to_id}/course_copy",
            { :controller => 'content_imports', :action => 'copy_course_content', :course_id => to_id, :format => 'json' },
    {:source_course => from_id})
    expect(status).to eq 401
  end

  def run_not_found(to_id, from_id)
    status = raw_api_call(:post, "/api/v1/courses/#{to_id}/course_copy",
            { :controller => 'content_imports', :action => 'copy_course_content', :course_id => to_id, :format => 'json' },
    {:source_course => from_id})
    assert_status(404)
  end

  def run_only_copy(option)
    run_copy(nil, nil, {:only => [option]})
  end

  def run_except_copy(option)
    run_copy(nil, nil, {:except => [option]})
  end

  def check_counts(expected_count, skip = nil)
    each_copy_option do |option, association|
      next if skip && option == skip
      next if !Qti.qti_enabled? && association == :quizzes
      expect(@copy_to.send(association).count).to eq expected_count
    end
  end

  it "should copy a course with canvas id" 


  it "should log copied event to course activity" 


  it "should copy a course using sis ids" 


  it "should not allow copying into an unauthorized course" 


  it "should not allow copying from an unauthorized course" 


  it "should return 404 for a source course that isn't found" 


  it "should return 404 for a destination course that isn't found" 


  it "should return 404 for an import that isn't found" 


  it "shouldn't allow both only and except options" 


  it "should only copy course settings" 


  it "should only copy wiki pages" 


  each_copy_option do |option, association|
    it "should only copy #{option}" 

  end

  it "should skip copy course settings" 

  it "should skip copy wiki pages" 

  each_copy_option do |option, association|
    it "should skip copy #{option}" 

  end

  it "should create and retrieve link validation results" 

end

describe CoursesController, type: :request do
  before(:once) do
    @now = Time.zone.now
    @test_course = Course.create!
    @teacher = course_with_teacher(course: @test_course, active_all: true).user
    @test_student = student_in_course(course: @test_course, active_all: true).user
    @assignment1 = @test_course.assignments.create!(due_at: 5.days.ago(@now))
    @assignment2 = @test_course.assignments.create!(due_at: 10.days.from_now(@now))
    @effective_due_dates_path = "/api/v1/courses/#{@test_course.id}/effective_due_dates"
    @options = { controller: "courses", action: "effective_due_dates", format: "json", course_id: @test_course.id }
    # api_call sets up session based on @user; i'd rather set it here explicitly than make our
    # course_with_teacher and student_in_course calls order-dependent
    @user = @teacher
  end

  describe "#effective_due_dates" do
    context "permissions" do
      it "allows teachers to access the information" 


      it "does not allow teachers to from other courses to access the information" 


      it "allows TAs to access the information" 


      it "allows admins to access the information" 


      it "does not allow students to access the information" 

    end

    it "returns a key for each assignment in the course" 


    it "returns a subset of assignments if specific assignment ids are requested" 


    it "returns all assignments if the assignment_ids param is not an array" 


    it "each assignment only contains keys for students that are assigned to it" 


    it "returns the effective due at along with grading period information" 

  end
end

describe CoursesController, type: :request do
  describe "course#user(s)" do
    let_once(:account) { Account.default }
    let_once(:test_course) { account.courses.create! }
    let_once(:grading_period) do
      group = account.grading_period_groups.create!(title: "Score Test Group")
      group.enrollment_terms << test_course.enrollment_term
      Factories::GradingPeriodHelper.new.create_presets_for_group(group, :current)
      group.grading_periods.first
    end
    let_once(:student) { student_in_course(course: test_course, active_all: true) }
    let_once(:teacher) { teacher_in_course(course: test_course, active_all: true) }

    before(:once) do
      student.scores.create!(grading_period_id: grading_period.id,
                             current_score: 100, final_score: 50,
                             unposted_current_score: 70, unposted_final_score: 60)
      student.scores.create!(current_score: 80, final_score: 74,
                             unposted_current_score: 75, unposted_final_score: 86)
    end

    context "users endpoint with mgp" do
      let(:users_path) {"/api/v1/courses/#{test_course.id}/users?include[]=enrollments" }
      let(:users_options) do
        {
          controller: "courses",
          action: "users",
          format: "json",
          course_id: test_course.id,
          include: ['enrollments']
        }
      end

      it "uses the total score by default" 


      it "uses the current grading period score if requested" 

    end

    context "user endpoint with mgp" do
      let(:user_path) do
        "/api/v1/courses/#{test_course.id}/users/#{student.user.id}?include[]=enrollments"
      end
      let(:user_options) do
        {
          controller: "courses",
          action: "user",
          format: "json",
          course_id: test_course.id,
          id: student.user.id,
          include: ['enrollments']
        }
      end

      it "uses the total score by default" 


      it "uses the current grading period score if requested" 

    end
  end
end

