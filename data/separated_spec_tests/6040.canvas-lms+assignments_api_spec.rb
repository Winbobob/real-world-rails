#
# Copyright (C) 2011 - 2016 Instructure, Inc.
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

require_relative '../api_spec_helper'
require_relative '../locked_spec'
require_relative '../../sharding_spec_helper'
require_relative '../../lti_spec_helper'
require_relative '../../lti2_spec_helper'

describe AssignmentsApiController, type: :request do
  include Api
  include Api::V1::Assignment
  include Api::V1::Submission
  include LtiSpecHelper

  context 'locked api item' do
    include_examples 'a locked api item'

    let(:item_type) { 'assignment' }

    let_once(:locked_item) do
      @course.assignments.create!(:title => 'Locked Assignment')
    end

    def api_get_json
      api_get_assignment_in_course(locked_item, @course)
    end
  end

  def create_submitted_assignment_with_user(user=@user)
    now = Time.zone.now
    assignment = @course.assignments.create!(
      :title => "dawg you gotta submit this",
      :submission_types => "online_url")
    submission = bare_submission_model assignment,
                                       user,
                                       score: '99',
                                       grade: '99',
                                       grader_id: @teacher.id,
                                       submitted_at: now,
                                       grade_matches_current_submission: true
    return assignment,submission
  end

  def create_override_for_assignment(assignment=@assignment)
      override = @assignment.assignment_overrides.build
      override.title = "I am overridden and being returned in the API!"
      override.set = @section
      override.set_type = 'CourseSection'
      override.due_at = Time.zone.now + 2.days
      override.unlock_at = Time.zone.now + 1.days
      override.lock_at = Time.zone.now + 3.days
      override.due_at_overridden = true
      override.lock_at_overridden = true
      override.unlock_at_overridden = true
      override.save!
      override
  end

  describe "GET /courses/:course_id/assignments (#index)" do
    before :once do
      course_with_teacher(:active_all => true)
    end

    it "returns unauthorized for users who cannot :read the course" 


    it "includes in_closed_grading_period in returned json" 


    it "includes due_date_required in returned json" 


    it "includes name_length_required in returned json with default value" 


    it "includes name_length_required in returned json with custom value" 


    it 'returns all assignments using paging' 


    it "sorts the returned list of assignments" 


    it "sorts the returned list of assignments by name" 


    it "returns assignments by assignment group" 


    it "should search for assignments by title" 


    it "should allow filtering based on assignment_ids[] parameter" 


    it "should fail if given an assignment_id that does not exist" 


    it "should fail when given an assignment_id without permissions" 


    it "should fail if given too many assignment_ids" 


    it "should return the assignments list with API-formatted Rubric data" 


    it "should return learning outcome info with rubric criterions if available" 


    it "should exclude deleted assignments in the list return" 


    describe "assignment bucketing" do
      before :once do
        course_with_student(:active_all => true)
        @student1 = @user
        @section = @course.course_sections.create!(name: "test section")
        student_in_section(@section, user: @student1)

        @student2 = create_users(1, return_type: :record).first
        @course.enroll_student(@student2, :enrollment_state => 'active')
        @section2 = @course.course_sections.create!(name: "second test section")
        student_in_section(@section2, user: @student2)

        # names based on student 1's due dates
        @past_assignment = @course.assignments.create!(title: "past", only_visible_to_overrides: true, due_at: (Time.now - 10.days))
        create_section_override_for_assignment(@past_assignment, {course_section: @section, due_at: (Time.now - 10.days)})

        @overdue_assignment = @course.assignments.create!(title: "overdue", only_visible_to_overrides: true, submission_types: "online")
        create_section_override_for_assignment(@overdue_assignment, {course_section: @section, due_at: (Time.now - 10.days)})

        @far_future_assignment = @course.assignments.create!(title: "far future", only_visible_to_overrides: true)
        create_section_override_for_assignment(@far_future_assignment, {course_section: @section, due_at: (Time.now + 30.days)})

        @upcoming_assignment = @course.assignments.create!(title: "upcoming", only_visible_to_overrides: true)
        create_section_override_for_assignment(@upcoming_assignment, {course_section: @section, due_at: (Time.now + 1.days)})

        @undated_assignment = @course.assignments.create!(title: "undated", only_visible_to_overrides: true)
        override = create_section_override_for_assignment(@undated_assignment, {course_section: @section, due_at: nil})
        override.due_at = nil
        override.save

        # student2 overrides
        create_section_override_for_assignment(@past_assignment, {course_section: @section2, due_at: (Time.now - 10.days)})
        create_section_override_for_assignment(@far_future_assignment, {course_section: @section2, due_at: (Time.now - 10.days)})
      end

      before :each do
        user_session(@student1)
      end

      it "returns an error with an invalid bucket" 


      def assignment_index_bucketed_api_call(bucket)
        api_call(:get, "/api/v1/courses/#{@course.id}/assignments.json",
          { :controller => 'assignments_api',
            :action => 'index',
            :format => 'json',
            :course_id => @course.id.to_s,
            :bucket => bucket
          }
        )
      end

      def assert_call_gets_assignments(bucket, assignments)
        assignments_json = assignment_index_bucketed_api_call(bucket)
        expect(assignments_json.map{|a| a["id"]}.sort).to eq assignments.map(&:id).sort
        if assignments_json.any?
          expect(assignments_json.first["bucket"]).to eq bucket
        end
      end

      def assert_calls_get_assignments(expectations)
        expectations.each do |bucket, assignments|
          assert_call_gets_assignments(bucket.to_s, assignments)
        end
      end

      context "as a student" do
        it "should bucket assignments properly" 


        it "should apply overrides properly to different students" 

      end

      context "as a teacher" do
        it "should use default assignment dates" 

      end

      context "as an observer" do
        before :once do
          @observer = User.create
          @user = @observer
        end

        before :each do
          user_session(@observer)
        end

        it "should get the same results as a student when only observing one student" 


        it "should treat multi-student observers like course observers" 


        it "should use sections dates when observing a whole course" 

      end
    end

    describe "enable draft" do
      before :once do
        course_with_teacher(:active_all => true)
        @assignment = @course.assignments.create :name => 'some assignment'
        @assignment.workflow_state = 'unpublished'
        @assignment.save!
      end

      it "should include published flag for accounts that do have enabled_draft" 


      it "includes in_closed_grading_period in returned json" 

    end

    describe "updating an assignment with locked ranges" do
      before :once do
        course_with_teacher(:active_all => true)
      end

      it 'should not allow updating due date to invalid lock range' 


      it 'should allow updating due date to invalid lock range if lock range is also updated' 


      it "should allow assignment update due_date within locked range" 


      it "should not allow assignment update due_date before locked range" 


      it "should allow assignment update due_date with no locked ranges" 


      it "should not allow assignment update due_date after locked range" 


      it "should not skip due date validation just because it somehow passed in no overrides" 


      it "should allow assignment update due_date on locked range" 

    end

    describe "differentiated assignments" do
      def setup_DA
        @course_section = @course.course_sections.create
        @student1, @student2, @student3 = create_users(3, return_type: :record)
        @assignment = @course.assignments.create!(title: "title", only_visible_to_overrides: true)
        @course.enroll_student(@student2, :enrollment_state => 'active')
        @section = @course.course_sections.create!(name: "test section")
        @section2 = @course.course_sections.create!(name: "second test section")
        student_in_section(@section, user: @student1)
        create_section_override_for_assignment(@assignment, {course_section: @section})
        @assignment2 = @course.assignments.create!(title: "title2", only_visible_to_overrides: true)
        create_section_override_for_assignment(@assignment2, {course_section: @section2})
        @course.reload
      end

      before :once do
        course_with_teacher(active_all: true)
        @assignment = @course.assignments.create(name: 'differentiated assignment')
        section = @course.course_sections.create!(name: "second test section")
        create_section_override_for_assignment(@assignment, {course_section: section})
        assignment_override_model(assignment: @assignment, set_type: 'Noop', title: 'Just a Tag')
      end

      before :each do
        user_session(@teacher)
      end

      it "should include overrides if overrides flag is included in the params" 


      it "should include the only_visible_to_overrides flag if differentiated assignments is on" 


      it "should include visibility data if included" 


      it "should show all assignments" 


      context "as a student" do
        before :once do
          course_factory(active_all: true)
          setup_DA
        end

        it "should show visible assignments" 


        it "should not show non-visible assignments" 


        it "should not show assignments assigned to  the user has an inactive sectionenrollments for" 

      end

      context "as an observer" do
        before :once do
          course_factory(active_all: true)
          setup_DA
          @observer = User.create
          @observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment', :section => @course.course_sections.first, :enrollment_state => 'active', :allow_multiple_enrollments => true)
        end

        it "should show assignments visible to observed student" 


        it "should not show assignments not visible to observed student" 


        it "should show assignments visible to any of the observed students" 

      end
    end

    it "includes submission info with include flag" 


    it "includes all_dates with include flag" 


    it "doesn't include all_dates if there are too many" 



    it "returns due dates as they apply to the user" 


    it "returns original assignment due dates" 


    describe "draft state" do

      before :once do
        course_with_student(:active_all => true)
        @published = @course.assignments.create!({:name => "published assignment"})
        @published.workflow_state = 'published'
        @published.save!

        @unpublished = @course.assignments.create!({:name => "unpublished assignment"})
        @unpublished.workflow_state = 'unpublished'
        @unpublished.save!
      end

      it "only shows published assignments to students" 


      it "shows unpublished assignments to teachers" 

    end

    it 'returns the url attribute for external tools' 

  end

  describe "GET /users/:user_id/courses/:course_id/assignments (#user_index)" do

    it "returns data for user calling on self" 


    it "returns assignments for authorized observer" 


    it "returns unauthorized for users who cannot :read the course" 


    it "returns data for for teacher who can read target student data" 


    it "returns data for ta who can read target student data" 


    it "returns unauthorized for ta who cannot read target student data" 

  end

  describe "POST 'duplicate'" do
    before :once do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
    end

    it "students cannot duplicate" 


    it "should duplicate if teacher" 


    it "should require non-quiz" 


    it "should duplicate discussion topic" 


    it "should duplicate wiki page assignment" 


    it "should require non-deleted assignment" 


    it "should require existing assignment" 

  end

  describe "POST /courses/:course_id/assignments (#create)" do
    def create_assignment_json(group, group_category)
      { 'name' => 'some assignment',
        'position' => '1',
        'points_possible' => '12',
        'due_at' => '2011-01-01T00:00:00Z',
        'lock_at' => '2011-01-03T00:00:00Z',
        'unlock_at' => '2010-12-31T00:00:00Z',
        'description' => 'assignment description',
        'assignment_group_id' => group.id,
        'submission_types' => [
          'online_upload'
        ],
        'notify_of_update' => true,
        'allowed_extensions' => [
          'docx','ppt'
        ],
        'grade_group_students_individually' => true,
        'automatic_peer_reviews' => true,
        'peer_reviews' => true,
        'peer_reviews_assign_at' => '2011-01-02T00:00:00Z',
        'peer_review_count' => 2,
        'group_category_id' => group_category.id,
        'turnitin_enabled' => true,
        'vericite_enabled' => true,
        'grading_type' => 'points'
      }
    end

    before :once do
      course_with_teacher(:active_all => true)
    end

    it 'serializes post_to_sis when true' 


    it "serializes post_to_sis when false" 


    it "accepts a value for post_to_sis" 


    it "should not overwrite post_to_sis with default if missing in update params" 


    it "returns unauthorized for users who do not have permission" 


    it "allows authenticated users to create assignments" 


    it "should not allow assignment titles longer than 255 characters" 


    it "does not allow modifying turnitin_enabled when not enabled on the context" 


    it "does not allow modifying vericite_enabled when not enabled on the context" 


    it "should process html content in description on create" 


    it "sets the lti_context_id if provided" 


    context 'set the configuration LTI 1 tool if provided' do
      let(:tool) { @course.context_external_tools.create!(name: "a", url: "http://www.google.com", consumer_key: '12345', shared_secret: 'secret') }
      let(:a) { Assignment.last }

      before do
        api_create_assignment_in_course(@course, {
          'description' => 'description',
          'similarityDetectionTool' => tool.id,
          'configuration_tool_type' => 'ContextExternalTool',
          'submission_type' => 'online',
          'submission_types' => submission_types
        })
      end

      context 'with online_upload' do
        let(:submission_types) { ['online_upload'] }
        it "sets the configuration LTI 1 tool if one is provided" 

      end

      context 'with online_text_entry' do
        let(:submission_types) { ['online_text_entry'] }
        it "sets the configuration LTI 1 tool if one is provided" 

      end
    end

    it "does set the visibility settings" 


    it 'gives plagiarism platform settings priority of plagiarism plugins for Vericite' 


    it 'gives plagiarism platform settings priority of plagiarism plugins for TII' 


    context 'LTI 2.x' do
      include_context 'lti2_spec_helper'

      let(:root_account) { Account.create!(name: 'root account') }
      let(:course) { Course.create!(name: 'test course', account: account) }
      let(:teacher) { teacher_in_course(course: course) }

      before { account.update_attributes(root_account: root_account) }

      it "checks for tool installation in entire account chain" 


      context 'sets the configuration LTI 2 tool' do
        shared_examples_for 'sets the tools_settings_tool' do
          let(:submission_types) { raise 'Override in spec' }
          let(:context) { raise 'Override in spec' }

          it 'sets the tool correctly' 

        end

        context 'in account context' do
          context 'with online_upload' do
            it_behaves_like 'sets the tools_settings_tool' do
              let(:submission_types) { ['online_upload'] }
              let(:context) { @course.account }
            end
          end

          context 'with online_text_entry' do
            it_behaves_like 'sets the tools_settings_tool' do
              let(:submission_types) { ['online_text_entry'] }
              let(:context) { @course.account }
            end
          end
        end

        context 'in course context' do
          context 'with online_upload' do
            it_behaves_like 'sets the tools_settings_tool' do
              let(:submission_types) { ['online_upload'] }
              let(:context) { @course }
            end
          end

          context 'with online_text_entry' do
            it_behaves_like 'sets the tools_settings_tool' do
              let(:submission_types) { ['online_text_entry'] }
              let(:context) { @course }
            end
          end
        end
      end
    end

    it "does not set the configuration tool if the submission type is not online with uploads" 


    it "should allow valid submission types as an array" 


    it "should allow valid submission types as a string (quick add dialog)" 


    it "should not allow unpermitted submission types" 


    it "calls DueDateCacher only once" 


    it "allows creating an assignment with overrides via the API" 


    it 'accepts configuration argument to split needs grading by section' 


    context "adhoc overrides" do
      def adhoc_override_api_call(rest_method, endpoint, action, opts={})
        overrides = [{
                      'student_ids' => opts[:student_ids] || [],
                      'title' => opts[:title] || 'adhoc override',
                      'due_at' => opts[:adhoc_due_at] || (5.days.from_now).iso8601
                    }]

        overrides.concat(opts[:additional_overrides]) if opts[:additional_overrides]
        overrides_hash = Hash[(0...overrides.size).zip overrides]

        api_params = {
            :controller => 'assignments_api',
            :action => action,
            :format => 'json',
            :course_id => @course.id.to_s
          }
        api_params.merge!(opts[:additional_api_params]) if opts[:additional_api_params]

        api_call(rest_method, "/api/v1/courses/#{@course.id}/#{endpoint}",
          api_params,
          {
            :assignment => {
              'name' => 'some assignment',
              'assignment_overrides' => overrides_hash,
            }
          }
        )
      end

      def api_call_to_create_adhoc_override(opts={})
        adhoc_override_api_call(:post, 'assignments.json', 'create', opts)
      end

      def api_call_to_update_adhoc_override(opts={})
        opts[:additional_api_params] = {id: @assignment.id.to_s}
        adhoc_override_api_call(:put, "assignments/#{@assignment.id}", 'update', opts)
      end

      it 'allows the update of an adhoc override with one more student' 


      it 'allows the update of an adhoc override with one less student' 


      it 'allows the update of an adhoc override with different student' 

    end

    context "notifications" do
      before :once do
        student_in_course(:course => @course, :active_enrollment => true)
        course_with_ta(:course => @course, :active_enrollment => true)
        @course.course_sections.create!

        @notification = Notification.create! :name => "Assignment Created"

        @student.register!
        @student.communication_channels.create(:path => "student@instructure.com").confirm!
        @student.email_channel.notification_policies.create!(notification: @notification,
          frequency: 'immediately')
      end

      it "takes overrides into account in the assignment-created notification " +
        "for assignments created with overrides" do
        @ta.register!
        @ta.communication_channels.create(:path => "ta@instructure.com").confirm!
        @ta.email_channel.notification_policies.create!(notification: @notification,
                                                        frequency: 'immediately')

        @override_due_at = Time.parse('2002 Jun 22 12:00:00')

        @user = @teacher
        json = api_call(:post,
                 "/api/v1/courses/#{@course.id}/assignments.json",
                 {
                   :controller => 'assignments_api',
                   :action => 'create', :format => 'json',
                   :course_id => @course.id.to_s },
                 { :assignment => {
                     'name' => 'some assignment',
                     'assignment_overrides' => {
                         '0' => {
                           'course_section_id' => @student.enrollments.first.course_section.id,
                           'due_at' => @override_due_at.iso8601
                         }
                     }
                   }
                   })
        assignment = Assignment.find(json['id'])
        assignment.publish if assignment.unpublished?

        expect(@student.messages.detect{|m| m.notification_id == @notification.id}.body).
          to be_include 'Jun 22'
        expect(@ta.messages.detect{|m| m.notification_id == @notification.id}.body).
          to be_include 'Multiple Dates'
      end

      it "should only notify students with visibility on creation" 


      it "should send notification of creation on save and publish" 


      it "should send notification on due date update (even if other overrides are passed in)" 


      it "should use new overrides for notifications of creation on save and publish" 


      it "should update only_visible_to_overrides to false if updating overall date" 

    end

    it "should not allow an assignment_group_id that is not a number" 


    context "discussion topic assignments" do
      it "should prevent creating assignments with group category IDs and discussions" 

    end

    context "with grading periods" do
      def call_create(params, expected_status)
        api_call_as_user(
          @current_user,
          :post, "/api/v1/courses/#{@course.id}/assignments",
          {
            controller: "assignments_api",
            action: "create",
            format: "json",
            course_id: @course.id.to_s
          },
          {
            assignment: create_assignment_json(@group, @group_category)
             .merge(params)
             .except("muted")
          },
          {},
          { expected_status: expected_status }
        )
      end

      before :once do
        grading_period_group = Factories::GradingPeriodGroupHelper.new.create_for_account(@course.root_account)
        term = @course.enrollment_term
        term.grading_period_group = grading_period_group
        term.save!
        Factories::GradingPeriodHelper.new.create_for_group(grading_period_group, {
          start_date: 2.weeks.ago, end_date: 2.days.ago, close_date: 1.day.ago
        })
        course_with_student(course: @course)
        account_admin_user(account: @course.root_account)
        @group = @course.assignment_groups.create!(name: "Example Group")
        @group_category = @course.group_categories.create!(name: "Example Group Category")
      end

      context "when the user is a teacher" do
        before :each do
          @current_user = @teacher
        end

        it "allows setting the due date in an open grading period" 


        it "does not allow setting the due date in a closed grading period" 


        it "allows setting the due date in a closed grading period when only visible to overrides" 


        it "does not allow a nil due date when the last grading period is closed" 


        it "does not allow setting an override due date in a closed grading period" 


        it "does not allow a nil override due date when the last grading period is closed" 


        it "allows a due date in a closed grading period when the assignment is not graded" 


        it "allows a nil due date when not graded and the last grading period is closed" 

      end

      context "when the user is an admin" do
        before :each do
          @current_user = @admin
        end

        it "allows setting the due date in a closed grading period" 


        it "allows a nil due date when the last grading period is closed" 


        it "allows setting an override due date in a closed grading period" 


        it "allows a nil override due date when the last grading period is closed" 

      end
    end

    context "sis validations enabled" do
      before(:each) do
        a = @course.account
        a.enable_feature!(:new_sis_integrations)
        a.settings[:sis_syncing] = {value: true}
        a.settings[:sis_require_assignment_due_date] = {value: true}
        a.save!
      end

      it 'saves with a section override with a valid due_date' 


      it 'does not save with a section override without a due date' 


      it 'saves with an empty section override' 


      it 'does not save without a due date' 


      it 'saves with an assignment with a valid due_date' 


      it 'saves with an assignment with a valid title' 


      it 'does not save with an assignment with an invalid title length' 

    end
  end

  describe "PUT /courses/:course_id/assignments/:id (#update)" do
    before :once do
      course_with_teacher(:active_all => true)
    end

    it "returns unauthorized for users who do not have permission" 


    it "should update published/unpublished" 


    it "updates using lti_context_id" 



    it "should 400 with invalid date times" 


    it "should allow clearing dates" 


    describe 'final_grader_id' do
      before(:once) do
        course_with_teacher(active_all: true)
        course_with_teacher(active_all: true)
      end

      it 'allows updating final_grader_id for a participating instructor with "Select Final Grade" permissions' 


      it 'does not allow updating final_grader_id if the user does not have "Select Final Grade" permissions' 


      it 'does not allow updating final_grader_id if the user is not active in the course' 


      it 'does not allow updating final_grader_id if the course has no user with the supplied ID' 


      it 'skips final_grader_id validation if the field has not changed' 

    end

    it 'allows updating grader_count' 


    it 'allows updating graders_anonymous_to_graders' 


    it 'allows updating grader_comments_visible_to_graders' 


    it 'allows updating grader_names_visible_to_final_grader' 


    it "should not allow updating an assignment title to longer than 255 characters" 


    it "disallows updating deleted assignments" 


    it 'allows trying to update points (that get ignored) on an ungraded assignment when locked' 


    context "without overrides or frozen attributes" do
      before :once do
        @start_group = @course.assignment_groups.create!({:name => "start group"})
        @group = @course.assignment_groups.create!({:name => "new group"})
        @assignment = @course.assignments.create!(:title => "some assignment",
                                                  :points_possible => 15,
                                                  :description => "blah",
                                                  :position => 2,
                                                  :peer_review_count => 2,
                                                  :peer_reviews => true,
                                                  :peer_reviews_due_at => Time.now,
                                                  :grading_type => 'percent',
                                                  :due_at => nil)
        @assignment.update_attribute(:muted, false)
        @assignment.assignment_group = @start_group
        @assignment.group_category = @assignment.context.group_categories.create!(name: "foo")
        @assignment.save!

        @new_grading_standard = grading_standard_for(@course)
      end

      before :each do
        @json = api_update_assignment_call(@course,@assignment,{
          'name' => 'some assignment',
          'points_possible' => '12',
          'assignment_group_id' => @group.id,
          'peer_reviews' => false,
          'grading_standard_id' => @new_grading_standard.id,
          'group_category_id' => nil,
          'description' => 'assignment description',
          'grading_type' => 'letter_grade',
          'due_at' => '2011-01-01T00:00:00Z',
          'position' => 1,
          'muted' => true
        })
        @assignment.reload
      end

      it "returns, but does not update, the assignment's id" 


      it "updates the assignment's assignment group id" 


      it "updates the title/name of the assignment" 


      it "returns, but doesn't update, the assignment's course_id" 


      it "updates the assignment's description" 


      it "updates the assignment's muted property" 


      it "updates the assignment's position" 


      it "updates the assignment's points possible" 


      it "updates the assignment's grading_type" 


      it "updates the assignments grading_type when outcome not provided" 


      it "updates the assignments grading_type when type is empty" 


      it "returns, but does not change, the needs_grading_count" 


      it "updates the assignment's due_at" 


      it "updates the assignment's submission types" 


      it "updates the group_category_id" 


      it "returns the html_url, which is a URL to the assignment" 


      it "updates the peer reviews info" 


      it "updates the grading standard" 

    end

    it "should process html content in description on update" 


    context "with assignment overrides on the assignment" do
      describe 'updating assignment overrides' do
        before :once do
          student_in_course(:course => @course, :active_enrollment => true)
          @assignment = @course.assignments.create!
          @group_category = @assignment.context.group_categories.create!(name: "foo")
          @assignment.group_category = @group_category
          @assignment.save!
          @group = group_model(:context => @course, :group_category => @assignment.group_category)
          @adhoc_due_at = 5.days.from_now
          @section_due_at = 7.days.from_now
          @group_due_at = 3.days.from_now
          @user = @teacher
        end

        let(:update_assignment) do
          api_update_assignment_call(@course,@assignment,{
            'name' => 'Assignment With Overrides',
            'assignment_overrides' => {
              '0' => {
                'student_ids' => [@student.id],
                'title' => 'adhoc override',
                'due_at' => @adhoc_due_at.iso8601
              },
              '1' => {
                'course_section_id' => @course.default_section.id,
                'due_at' => @section_due_at.iso8601
              },
              '2' => {
                'title' => 'Group override',
                'set_id' => @group_category.id,
                'group_id' => @group.id,
                'due_at' => @group_due_at.iso8601
              },
              '3' => {
                'title' => 'Helpful Tag',
                'noop_id' => 999
              }
            }
          })
          @assignment.reload
        end

        let(:update_assignment_only) do
          api_update_assignment_call(@course,@assignment,{
            'name' => 'Assignment With Overrides',
            'due_at' => 1.week.from_now.iso8601,
            'assignment_overrides' => {
              '0' => {
                'student_ids' => [@student.id],
                'title' => 'adhoc override',
                'due_at' => @adhoc_due_at.iso8601
              },
              '1' => {
                'course_section_id' => @course.default_section.id,
                'due_at' => @section_due_at.iso8601
              },
              '2' => {
                'title' => 'Group override',
                'set_id' => @group_category.id,
                'group_id' => @group.id,
                'due_at' => @group_due_at.iso8601
              },
              '3' => {
                'title' => 'Helpful Tag',
                'noop_id' => 999
              }
            }
          })
          @assignment.reload
        end

        describe "DueDateCacher" do
          it "is called only once when there are changes to overrides" 


          it "is not called when there are no changes to overrides or assignment" 


          it "is called only once when there are changes to the assignment but not to the overrides" 

        end

        it "updates any ADHOC overrides" 


        it "updates any CourseSection overrides" 


        it "updates any Group overrides" 


        it "updates any Noop overrides" 


        it 'overrides the assignment for the user' 


        it 'updates overrides for inactive students' 


        it 'updates overrides for concluded students' 


        it 'does not create overrides when student_ids is invalid' 


        it 'does not override the assignment for the user if passed false for override_dates' 


        it 'does not override the assignment if restricted by master course' 

      end

      describe "deleting all CourseSection overrides from assignment" do
        it "works when :assignment_overrides key is nil" 

      end
    end

    context "broadcasting while updating overrides" do
      before :once do
        @notification = Notification.create! :name => "Assignment Changed"
        student_in_course(:course => @course, :active_all => true)
        @student.communication_channels.create(:path => "student@instructure.com").confirm!
        @student.email_channel.notification_policies.create!(notification: @notification,
                                                             frequency: 'immediately')
        @assignment = @course.assignments.create!
        Assignment.where(:id => @assignment).update_all(:created_at => Time.zone.now - 1.day)
        @adhoc_due_at = 5.days.from_now
        @section_due_at = 7.days.from_now
        @params = {
          'name' => 'Assignment With Overrides',
          'assignment_overrides' => {
            '0' => {
              'student_ids' => [@student.id],
              'title' => 'adhoc override',
              'due_at' => @adhoc_due_at.iso8601
            },
            '1' => {
              'course_section_id' => @course.default_section.id,
              'due_at' => @section_due_at.iso8601
            }
          }
        }
      end

      it "should not send assignment_changed if notify_of_update is not set" 


      it "should send assignment_changed if notify_of_update is set" 

    end

    context "when turnitin is enabled on the context" do
      before :once do
        @assignment = @course.assignments.create!
        acct = @course.account
        acct.turnitin_account_id = 0
        acct.turnitin_shared_secret = "blah"
        acct.settings[:enable_turnitin] = true
        acct.save!
      end

      it "should allow setting turnitin_enabled" 


      it "should allow setting valid turnitin_settings" 


      it "should not allow setting invalid turnitin_settings" 

    end

    context "when a non-admin tries to update a frozen assignment" do
      before :once do
        @assignment = create_frozen_assignment_in_course(@course)
      end

      before :each do
        allow(PluginSetting).to receive(:settings_for_plugin).and_return({"title" => "yes"}).at_least(:once)
      end

      it "doesn't allow the non-admin to update a frozen attribute" 


      it "does allow editing a non-frozen attribute" 

    end

    context "when an admin tries to update a completely frozen assignment" do
      it "allows the admin to update the frozen assignment" 

    end

    context "differentiated assignments" do
      before :once do
        @assignment = @course.assignments.create(:name => 'test', :only_visible_to_overrides => false)
        @flag_before = @assignment.only_visible_to_overrides
      end

      it "should update the only_visible_to_overrides flag if differentiated assignments is on" 

    end

    context "when an admin tried to update a grading_standard" do
      before(:once) do
        account_admin_user(user: @user)
        @assignment = @course.assignments.create({:name => "some assignment"})
        @assignment.save!
        @account_standard = @course.account.grading_standards.create!(:title => "account standard", :standard_data => {:a => {:name => 'A', :value => '95'}, :b => {:name => 'B', :value => '80'}, :f => {:name => 'F', :value => ''}})
        @course_standard = @course.grading_standards.create!(:title => "course standard", :standard_data => {:a => {:name => 'A', :value => '95'}, :b => {:name => 'B', :value => '80'}, :f => {:name => 'F', :value => ''}})
      end

      it "allows setting an account grading standard" 


      it "allows setting a course level grading standard" 


      it "should update a sub account level grading standard" 


      it "should not update grading standard from sub account not on account chain" 


      it "should not delete grading standard if invalid standard provided" 


      it "should remove a standard if empty value passed" 

    end

    context "discussion topic assignments" do
      it "should prevent setting group category ID on assignments with discussions" 

    end

    context "with grading periods" do
      def create_assignment(attr)
        @course.assignments.create!({ name: "Example Assignment", submission_types: "points" }.merge(attr))
      end

      def override_for_date(date)
        override = @assignment.assignment_overrides.build
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
          :put, "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}",
          {
            controller: "assignments_api",
            action: "update",
            format: "json",
            course_id: @course.id.to_s,
            id: @assignment.to_param
          },
          { assignment: params },
          {},
          { expected_status: expected_status }
        )
      end

      before :once do
        grading_period_group = Factories::GradingPeriodGroupHelper.new.create_for_account(@course.root_account)
        term = @course.enrollment_term
        term.grading_period_group = grading_period_group
        term.save!
        Factories::GradingPeriodHelper.new.create_for_group(grading_period_group, {
          start_date: 2.weeks.ago, end_date: 2.days.ago, close_date: 1.day.ago
        })
        course_with_student(course: @course)
        account_admin_user(account: @course.root_account)
      end

      context "when the user is a teacher" do
        before :each do
          @current_user = @teacher
        end

        it "allows changing the due date to another date in an open grading period" 


        it "allows changing the due date when the assignment is only visible to overrides" 


        it "allows disabling only_visible_to_overrides when due in an open grading period" 


        it "allows enabling only_visible_to_overrides when due in an open grading period" 


        it "allows disabling post_to_sis when due in a closed grading period" 


        it "allows enabling post_to_sis when due in a closed grading period" 


        it "does not allow disabling only_visible_to_overrides when due in a closed grading period" 


        it "does not allow enabling only_visible_to_overrides when due in a closed grading period" 


        it "allows disabling only_visible_to_overrides when changing due date to an open grading period" 


        it "does not allow changing the due date on an assignment due in a closed grading period" 


        it "does not allow changing the due date to a date within a closed grading period" 


        it "does not allow unsetting the due date when the last grading period is closed" 


        it "succeeds when the assignment due date is set to the same value" 


        it "succeeds when the assignment due date is not changed" 


        it "allows changing the due date when the assignment is not graded" 


        it "allows unsetting the due date when not graded and the last grading period is closed" 


        it "allows changing the due date on an assignment with an override due in a closed grading period" 


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
          @current_user = @admin
        end

        it "allows disabling only_visible_to_overrides when due in a closed grading period" 


        it "allows enabling only_visible_to_overrides when due in a closed grading period" 


        it "allows changing the due date on an assignment due in a closed grading period" 


        it "allows changing the due date to a date within a closed grading period" 


        it "allows unsetting the due date when the last grading period is closed" 


        it "allows changing the due date on an assignment with an override due in a closed grading period" 


        it "allows adding an override with a due date in a closed grading period" 


        it "allows changing the due date of an override due in a closed grading period" 


        it "allows changing the due date of an override to a date within a closed grading period" 


        it "allows unsetting the due date of an override when the last grading period is closed" 


        it "allows deleting by omission an override due in a closed grading period" 

      end
    end
  end

  describe "DELETE /courses/:course_id/assignments/:id (#delete)" do
    before :once do
      course_with_student(:active_all => true)
      @assignment = @course.assignments.create!(
        :title => "Test Assignment",
        :description => "public stuff"
      )
    end
    context "user does not have the permission to delete the assignment" do
      it "does not delete the assignment" 

    end
    context "when user requesting the deletion has permission to delete" do
      it "deletes the assignment " 


      it "deletes by lti_context_id" 


    end

  end

  describe "GET /courses/:course_id/assignments/:id (#show)" do

    before :once do
      course_with_student(:active_all => true)
    end

    describe 'with a normal assignment' do

      before :once do
        @assignment = @course.assignments.create!(
          :title => "Locked Assignment",
          :description => "secret stuff"
        )
      end

      before :each do
        allow_any_instantiation_of(@assignment).to receive(:overridden_for).
          and_return @assignment
        allow_any_instantiation_of(@assignment).to receive(:locked_for?).and_return(
          {:asset_string => '', :unlock_at => 1.hour.from_now }
        )
      end

      it "looks up an assignment by lti_context_id" 


      it "does not return the assignment's description if locked for user" 


      it "returns the mute status of the assignment" 


      it "translates assignment descriptions" 


      it "returns the discussion topic url" 


      it "fulfills module progression requirements" 


      it "returns the dates for assignment as they apply to the user" 


      it "returns original assignment due dates" 


      it "returns has_overrides correctly" 


      it "returns all_dates when requested" 


      it "does not fulfill requirements when description isn't returned" 


      it "still includes a description when a locked assignment is viewable" 


      it "includes submission info when requested with include flag" 


      context "AssignmentFreezer plugin disabled" do

        before do
          @user = @teacher
          @assignment = create_frozen_assignment_in_course(@course)
          allow(PluginSetting).to receive(:settings_for_plugin).and_return(nil)
          @json = api_get_assignment_in_course(@assignment,@course)
        end

        it "excludes frozen and frozen_attributes fields" 


      end

      context "AssignmentFreezer plugin enabled" do

        context "assignment frozen" do
          before :once do
            @user = @teacher
            @assignment = create_frozen_assignment_in_course(@course)
          end

          before :each do
            allow(PluginSetting).to receive(:settings_for_plugin).and_return({"title" => "yes"})
            @json = api_get_assignment_in_course(@assignment,@course)
          end

          it "tells the consumer that the assignment is frozen" 


          it "returns an list of frozen attributes" 


          it "tells the consumer that the assignment will be frozen when copied" 


          it "returns an empty list when no frozen attributes" 

        end

        context "assignment not frozen" do
          before :once do
            @user = @teacher
            @assignment = @course.assignments.create!({
              :title => "Frozen",
              :description => "frozen!"
            })
          end

          before :each do
            allow(PluginSetting).to receive(:settings_for_plugin).and_return({"title" => "yes"}) #enable plugin
            expect_any_instantiation_of(@assignment).to receive(:overridden_for).and_return @assignment
            expect_any_instantiation_of(@assignment).to receive(:frozen?).at_least(:once).and_return false
            @json = api_get_assignment_in_course(@assignment,@course)
          end

          it "tells the consumer that the assignment is not frozen" 


          it "gives the consumer an empty list for frozen attributes" 


          it "tells the consumer that the assignment will not be frozen when copied" 

        end

        context "assignment with quiz" do
          before do
            @user = @teacher
            @quiz = Quizzes::Quiz.create!(:title => 'Quiz Name', :context => @course)
            @quiz.did_edit!
            @quiz.offer!
            assignment = @quiz.assignment
            @json = api_get_assignment_in_course(assignment, @course)
          end

          it "should have quiz information" 

        end
      end

      context "external tool assignment" do

        before :once do
          @assignment = @course.assignments.create!
          @tool_tag = ContentTag.new({:url => 'http://www.example.com', :new_tab=>false})
          @tool_tag.context = @assignment
          @tool_tag.save!
          @assignment.submission_types = 'external_tool'
          @assignment.save!
        end

        before :each do
          @json = api_get_assignment_in_course(@assignment, @course)
        end

        it 'has the external tool submission type' 


        it 'includes the external tool attributes' 


        it 'includes the assignment_id attribute' 

      end
    end

    context "draft state" do

      before :once do
        @assignment = @course.assignments.create!({
          :name => "unpublished assignment",
          :points_possible => 15
        })
        @assignment.workflow_state = 'unpublished'
        @assignment.save!
      end

      it "returns an authorization error to students if an assignment is unpublished" 


      it "shows an unpublished assignment to teachers" 

    end

    context "differentiated assignments" do
      before :once do
        @user = @teacher
        @assignment1 = @course.assignments.create! :only_visible_to_overrides => true
        @assignment2 = @course.assignments.create! :only_visible_to_overrides => true
        section1 = @course.course_sections.create!
        section2 = @course.course_sections.create!
        @student1 = User.create!(name: "Test Student")
        @student2 = User.create!(name: "Test Student2")
        @student3 = User.create!(name: "Test Student3")
        student_in_section(section1, user: @student1)
        student_in_section(section2, user: @student2)
        student_in_section(section2, user: @student3)
        create_section_override_for_assignment(@assignment1, {course_section: section1})
        create_section_override_for_assignment(@assignment2, {course_section: section2})
        assignment_override_model(assignment: @assignment1, set_type: 'Noop', title: 'Just a Tag')
      end

      def visibility_api_request(assignment)
        api_call(:get,
          "/api/v1/courses/#{@course.id}/assignments/#{assignment.id}.json",
          {
            :controller => 'assignments_api', :action => 'show',
            :format => 'json', :course_id => @course.id.to_s,
            :id => assignment.id.to_s
          },
          :include => ['assignment_visibility']
        )
      end

      it "should include overrides if overrides flag is included in the params" 



      it "returns any assignment" 


      it "includes assignment_visibility" 


      it "assignment_visibility includes the correct user_ids" 


      context "as a student" do
        it "should return a visible assignment" 


        it "should return an error for a non-visible assignment" 


        it "should not include assignment_visibility data when requested" 

      end
    end
  end

  describe "assignment_json" do
    let(:result) { assignment_json(@assignment, @user, {}) }

    before :once do
      course_with_teacher(:active_all => true)
      @assignment = @course.assignments.create!(:title => "some assignment")
    end

    context "when turnitin_enabled is true on the context" do
      before(:once) do
        account = @course.account
        account.turnitin_account_id = 1234
        account.turnitin_shared_secret = 'foo'
        account.turnitin_host = 'example.com'
        account.settings[:enable_turnitin] = true
        account.save!
        @assignment.reload
      end

      it "contains a turnitin_enabled key" 

    end

    context "when turnitin_enabled is false on the context" do
      it "does not contain a turnitin_enabled key" 

    end

    it "contains false for anonymous_grading when the assignment has anonymous grading disabled" 


    it 'is false for anonymize_students when the assignment is not anonymous' 


    context 'when the assignment is anonymous' do
      before(:once) do
        @assignment.anonymous_grading = true
      end

      it 'contains true for anonymous_grading' 


      it 'is true for anonymize_students when the assignment is muted' 


      it 'is false for anonymize_students when the assignment is unmuted' 

    end
  end

  context "update_from_params" do
    before :once do
      course_with_teacher(:active_all => true)
      student_in_course(active_all: true)
      @assignment = @course.assignments.create!(:title => "some assignment")
    end

    def strong_anything
      ArbitraryStrongishParams::ANYTHING
    end

    it 'updates the external tool content_id' 


    it 'sets the context external tool type' 


    it "does not update integration_data when lacking permission" 


    it "updates integration_data with permission" 


    it "unmuting publishes hidden comments" 


    it "does not update anonymous grading if the anonymous marking feature flag is not set" 


    context "when the anonymous marking feature flag is set" do
      before(:once) do
        @course.enable_feature!(:anonymous_marking)
      end

      it "enables anonymous grading if anonymous_grading is true" 


      it "disables anonymous grading if anonymous_grading is false" 


      it "does not update anonymous grading status if anonymous_grading is not present" 


      it 'does not set final_grader_id if the assignment is not moderated' 


      context "when the assignment is moderated" do
        before(:once) do
          @assignment.update!(moderated_grading: true, grader_count: 2)
        end

        it 'nils out the final_grader_id when passed final_grader_id: ""' 


        it 'nils out the final_grader_id when passed final_grader_id: nil' 


        it 'sets the final_grader_id if the user exists' 

      end
    end

    context "with the duplicated_successfully parameter" do
      subject { @assignment }

      let(:params) do
        ActionController::Parameters.new(duplicated_successfully: duplicated_successfully)
      end

      before do
        allow(@assignment).to receive(:finish_duplicating)
        allow(@assignment).to receive(:fail_to_duplicate)
        update_from_params(@assignment, params, @teacher)
      end

      context "when duplicated_successfully is true" do
        let(:duplicated_successfully) { true }

        it { is_expected.to have_received(:finish_duplicating) }
      end

      context "when duplicated_successfully is false" do
        let(:duplicated_successfully) { false }

        it { is_expected.to have_received(:fail_to_duplicate) }
      end
    end

    context "with the cc_imported_successfully parameter" do
      subject { @assignment }

      let(:params) do
        ActionController::Parameters.new(cc_imported_successfully: cc_imported_successfully)
      end

      before do
        allow(@assignment).to receive(:finish_importing)
        allow(@assignment).to receive(:fail_to_import)
        update_from_params(@assignment, params, @teacher)
      end

      context "when cc_imported_successfully is true" do
        let(:cc_imported_successfully) { true }

        it { is_expected.to have_received(:finish_importing) }
      end

      context "when cc_imported_successfully is false" do
        let(:cc_imported_successfully) { false }

        it { is_expected.to have_received(:fail_to_import) }
      end
    end
  end

  context "as an observer viewing assignments" do
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

      @assignment, @submission = create_submitted_assignment_with_user(@observed_student)
    end

    it "includes submissions for observed users when requested with all assignments" 


    it "includes submissions for observed users when requested with a single assignment" 

  end

  context "assignment override preloading" do
    before :once do
      course_with_teacher(:active_all => true)

      student_in_course(:course => @course, :active_all => true)
      @override = assignment_override_model(:course => @course)
      @override_student = @override.assignment_override_students.build
      @override_student.user = @student
      @override_student.save!

      @assignment.only_visible_to_overrides = true
      @assignment.save!
    end

    it "should preload student_ids when including adhoc overrides" 


    it "should preload student_ids when including adhoc overrides on assignment groups api as well" 

  end

  context "when called with parameter calculate_grades" do
    let(:course) { Account.default.courses.create!(workflow_state: 'available') }
    let(:teacher) { course_with_teacher(course: course, active_all: true).user }

    it "calls DueDateCacher with update_grades: false when passed calculate_grades: false" 


    it "calls DueDateCacher with update_grades: true when passed calculate_grades: true" 


    it "calls DueDateCacher with update_grades: true when not passed calculate_grades" 

  end
end

def api_get_assignments_index_from_course(course)
    api_call(:get,
          "/api/v1/courses/#{course.id}/assignments.json",
          {
            :controller => 'assignments_api',
            :action => 'index',
            :format => 'json',
            :course_id => course.id.to_s
          })
end

def api_get_assignments_user_index(user, course, api_user = @user)
  api_call_as_user(api_user, :get,
           "/api/v1/users/#{user.id}/courses/#{course.id}/assignments.json",
           {
               :controller => 'assignments_api',
               :action => 'user_index',
               :format => 'json',
               :course_id => course.id.to_s,
               :user_id => user.id.to_s
           })
end

def create_frozen_assignment_in_course(_course)
    assignment = @course.assignments.create!({
      :title => "some assignment",
      :freeze_on_copy => true
    })
    assignment.copied = true
    assignment.save!
    assignment
end

def raw_api_update_assignment(course,assignment,assignment_params)
  raw_api_call(:put,
        "/api/v1/courses/#{course.id}/assignments/#{assignment.id}.json",
        { :controller => 'assignments_api', :action => 'update',
          :format => 'json',
          :course_id => course.id.to_s,
          :id => assignment.id.to_s },
          {
            'assignment' => assignment_params
          }
        )
  course.reload
  assignment.reload
end

def api_get_assignment_in_course(assignment,course)
  json = api_call(:get,
    "/api/v1/courses/#{course.id}/assignments/#{assignment.id}.json",
    { :controller => "assignments_api", :action => "show",
    :format => "json", :course_id => course.id.to_s,
    :id => assignment.id.to_s })
  assignment.reload
  course.reload
  json
end

def api_update_assignment_call(course,assignment,assignment_params)
  json = api_call(
    :put,
    "/api/v1/courses/#{course.id}/assignments/#{assignment.id}.json",
    {
      :controller => 'assignments_api',
      :action => 'update',
      :format => 'json',
      :course_id => course.id.to_s,
      :id => assignment.id.to_s
    },
    { :assignment => assignment_params }
  )
  assignment.reload
  course.reload
  json
end

def fully_frozen_settings
  {
    "title" => "true",
    "description" => "true",
    "lock_at" => "true",
    "points_possible" => "true",
    "grading_type" => "true",
    "submission_types" => "true",
    "assignment_group_id" => "true",
    "allowed_extensions" => "true",
    "group_category_id" => "true",
    "notify_of_update" => "true",
    "peer_reviews" => "true",
    "workflow_state" => "true"
  }
end

def api_create_assignment_in_course(course,assignment_params)
  api_call(:post,
           "/api/v1/courses/#{course.id}/assignments.json",
           {
             :controller => 'assignments_api',
             :action => 'create',
             :format => 'json',
             :course_id => course.id.to_s
           }, {:assignment => assignment_params })
end

