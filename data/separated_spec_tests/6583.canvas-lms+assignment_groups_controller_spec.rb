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

require_relative '../spec_helper'
require_relative '../apis/api_spec_helper'

describe AssignmentGroupsController do
  def course_group
    @group = @course.assignment_groups.create(:name => 'some group')
  end

  def course_group_with_integration_data
    @course.assignment_groups.create(:name => 'some group', :integration_data => {'something'=> 'else'})
  end

  describe 'GET index' do
    let(:assignments_ids) do
      json_response = json_parse(response.body)
      json_response.first['assignments'].map { |assignment| assignment['id'] }
    end

    describe 'filtering by grading period and overrides' do
      let!(:assignment) { course.assignments.create!(name: "Assignment without overrides", due_at: Date.new(2015, 1, 15)) }
      let!(:assignment_with_override) do
        course.assignments.create!(name: "Assignment with override", due_at: Date.new(2015, 1, 15))
      end
      let!(:feb_override) do
        # mass assignment is disabled for AssigmentOverride
        student_override = assignment_with_override.assignment_overrides.new.tap do |override|
          override.title = 'feb override'
          override.due_at = Time.zone.local(2015, 2, 15)
        end
        student_override.save!
        student_override.assignment_override_students.create!(user: student)
      end

      let(:student) do
        dora = User.create!(name: "Dora")
        course_with_student(course: course, user: dora, active_enrollment: true)
        dora
      end

      let(:jan_grading_period) do
        grading_period_group.grading_periods.create!(
          start_date: Date.new(2015, 1, 1),
          end_date: Date.new(2015, 1, 31),
          title: 'Jan Period'
        )
      end

      let(:feb_grading_period) do
        grading_period_group.grading_periods.create!(
          start_date: Date.new(2015, 2, 1),
          end_date: Date.new(2015, 2, 28),
          title: 'Feb Period'
        )
      end

      let(:grading_period_group) { Factories::GradingPeriodGroupHelper.new.legacy_create_for_course(course) }
      let(:course) do
        course = sub_account.courses.create!
        course.offer!
        course
      end
      let(:root_account) { Account.default }
      let(:sub_account) { root_account.sub_accounts.create! }

      context 'given an assignment group with and without integration data' do
        before(:once) do
          account_admin_user(account: root_account)
        end

        let(:index_params) do
          {
            params: {
              course_id: @course.id,
              exclude_response_fields: ['description'],
              include: ['assignments', 'assignment_visibility', 'overrides']
            },
            format: :json
          }
        end

        it 'should return an empty hash when created without integration data' 


        it 'should return the assignment group with integration data when it was created with it' 

      end

      context 'given a root account with a grading period and a sub account with a grading period' do
        before(:once) do
          account_admin_user(account: root_account)
        end

        let(:index_params) do
          {
            course_id: course.id,
            exclude_response_fields: ['description'],
            include: ['assignments', 'assignment_visibility', 'overrides']
          }
        end

        it 'when there is an assignment with overrides, filter grading periods by the override\'s due_at' 


        it 'it should include an assignment if any of its overrides fall within the given grading period' 


        it 'if scope_assignments_to_student is passed in and the requesting user ' \
        'is a student, it should only include an assignment if its effective due ' \
        'date for the requesting user falls within the given grading period' do
          user_session(student)
          get :index, params: index_params.merge(grading_period_id: jan_grading_period.id, scope_assignments_to_student: true), format: :json
          expect(assignments_ids).to_not include assignment_with_override.id
          expect(assignments_ids).to include assignment.id
        end

        it 'if scope_assignments_to_student is passed in and the requesting user ' \
        'is a fake student, it should only include an assignment if its effective due ' \
        'date for the requesting user falls within the given grading period' do
          fake_student = course.student_view_student
          override = assignment_with_override.assignment_overrides.first
          override.assignment_override_students.create!(user: fake_student)
          user_session(fake_student)
          get :index, params: index_params.merge(grading_period_id: jan_grading_period.id, scope_assignments_to_student: true), format: :json
          expect(assignments_ids).to_not include assignment_with_override.id
          expect(assignments_ids).to include assignment.id
        end

        it 'if scope_assignments_to_student is passed in and the requesting user ' \
        'is not a student or fake student, it should behave as though ' \
        'scope_assignments_to_student was not passed in' do
          user_session(@admin)
          get :index, params: index_params.merge(grading_period_id: jan_grading_period.id, scope_assignments_to_student: true), format: :json
          expect(assignments_ids).to include assignment_with_override.id
          expect(assignments_ids).to include assignment.id
        end
      end
    end

    describe 'filtering assignments by submission type' do
      before(:once) do
        course_with_teacher(active_all: true)
        @vanilla_assignment = @course.assignments.create!(name: "Boring assignment")
        @discussion_assignment = @course.assignments.create!(
          name: "Discussable assignment",
          submission_types: "discussion_topic"
        )
      end

      it 'should filter assignments by the submission_type' 

    end

    context 'given a course with a teacher and a student' do
      before :once do
        course_with_teacher(active_all: true)
        student_in_course(active_all: true)
      end

      it 'requires authorization' 


      context 'differentiated assignments' do
        before do
          user_session(@teacher)
          course_group
          @group = course_group
          @assignment = @course.assignments.create!(
            title: 'assignment',
            assignment_group: @group,
            only_visible_to_overrides: true,
            workflow_state: 'published'
          )
        end

        it 'does not check visibilities on individual assignemnts' 

      end
    end

    describe 'passing include_param submission', type: :request do
      before(:once) do
        student_in_course(active_all: true)
        @assignment = @course.assignments.create!(
          title: 'assignment',
          assignment_group: @group,
          workflow_state: 'published',
          submission_types: "online_url",
          points_possible: 25
        )
        @submission = bare_submission_model(@assignment, @student, {
          score: '25',
          grade: '25',
          grader_id: @teacher.id,
          submitted_at: Time.zone.now
        })
      end

      it 'returns assignment and submission' 


      it 'only makes the call to get effective due dates once when assignments are included' 

    end
  end

  describe "POST 'reorder'" do
    before :once do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
    end

    it 'requires authorization' 


    it 'does not allow students to reorder' 


    it 'reorders assignment groups' 


  end

  describe "POST 'reorder_assignments'" do
    before :once do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
      @group1 = @course.assignment_groups.create!(name: 'group 1')
      @group2 = @course.assignment_groups.create!(name: 'group 2')
      @assignment1 = @course.assignments.create!(title: 'assignment 1', assignment_group: @group1)
      @assignment2 = @course.assignments.create!(title: 'assignment 2', assignment_group: @group1)
      @assignment3 = @course.assignments.create!(title: 'assignment 3', assignment_group: @group2)
      @order = "#{@assignment1.id},#{@assignment2.id},#{@assignment3.id}"
    end

    it 'requires authorization' 


    it 'does not allow students to reorder' 


    it 'moves the assignment from its current assignment group to another assignment group' 


    it 'moves an associated Quiz to the correct assignment group along with the assignment' 


    it 'marks downstream_changes for master courses' 


    context 'with grading periods' do
      before :once do
        group = Factories::GradingPeriodGroupHelper.new.create_for_account(@course.root_account)
        term = @course.enrollment_term
        term.grading_period_group = group
        term.save!
        Factories::GradingPeriodHelper.new.create_for_group(group, {
          start_date: 2.weeks.ago, end_date: 2.days.ago, close_date: 1.day.ago
        })
        Factories::GradingPeriodHelper.new.create_for_group(group, {
          start_date: 2.days.ago, end_date: 2.days.from_now, close_date: 3.days.from_now
        })
        @assignment1.update_attributes(due_at: 1.week.ago)
      end

      it 'does not allow assignments in closed grading periods to be moved into different assignment groups' 


      it 'allows assignments with no effective due date in a closed grading period to be moved into different groups' 


      it 'allows assignments not in closed grading periods to be moved into different assignment groups' 


      it 'allows assignments in closed grading periods to be reordered within the same assignment group' 


      it 'allows assignments in closed grading periods when the user is a root admin' 


      it 'ignores deleted assignments' 

    end
  end

  describe "GET 'show'" do
    before :once do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
      course_group
    end

    it 'requires authorization' 


    it 'assigns variables' 

  end

  describe "POST 'create'" do
    before :once do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
    end

    let(:name){ 'some test group' }

    it 'requires authorization' 


    it 'does not allow students to create' 


    it 'creates a new group with valid integration_data' 


    it 'creates a new group with no integration_data' 


    it 'creates a new group where integration_data is not present' 


    it 'returns a 400 when trying to create a new group with invalid integration_data' 


    it 'creates a new group when integration_data is not present' 

  end

  describe "PUT 'update'" do
    before :once do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
      course_group
    end

    let(:name){ 'new group name' }

    it 'requires authorization' 


    it 'does not allow students to update' 


    it 'updates group' 


    it 'updates group with existing integration_data' 


    it 'updates a group with no integration_data' 


    it 'updates a group where integration_data is not present' 


    it 'returns a 400 when trying to update a group with invalid integration_data' 


    it 'retains integration_data when updating a group' 

  end

  describe "DELETE 'destroy'" do
    before :once do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
      course_group
    end

    it 'requires  authorization' 


    it 'does not allow students to delete' 


    it 'deletes group' 


    it 'delete assignments in the group' 


    it 'moves assignments to a different group if specified' 


    it 'does not allow users to delete assignment groups with frozen assignments' 


    it 'returns JSON if requested' 

  end
end

