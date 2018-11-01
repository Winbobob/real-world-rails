#
# Copyright (C) 2011-2016 Instructure, Inc.
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

module AssignmentGroupsApiSpecHelper
  def setup_groups
    @group1 = @course.assignment_groups.create!(name: 'group1')
    @group1.update_attribute(:position, 10)
    @group1.update_attribute(:group_weight, 40)
    @group2 = @course.assignment_groups.create!(name: 'group2')
    @group2.update_attribute(:position, 7)
    @group2.update_attribute(:group_weight, 60)
  end

  def setup_four_assignments(assignment_opts = {})
    @a1 = @course.assignments.create!(
      {
        title: "test1",
        assignment_group: @group1,
        points_possible: 10,
        description: 'Assignment 1'
      }.merge(assignment_opts)
    )
    @a2 = @course.assignments.create!(
      {
        title: "test2",
        assignment_group: @group1,
        points_possible: 12,
        description: 'Assignment 2'
      }.merge(assignment_opts)
    )
    @a3 = @course.assignments.create!(
      {
        title: "test3",
        assignment_group: @group2,
        points_possible: 8,
        description: 'Assignment 3'
      }.merge(assignment_opts)
    )
    @a4 = @course.assignments.create!(
      {
        title: "test4",
        assignment_group: @group2,
        points_possible: 9,
        description: 'Assignment 4'
      }.merge(assignment_opts)
    )
  end

  def setup_grading_periods
    setup_groups
    @group1_assignment_today = @course.assignments.create!(assignment_group: @group1, due_at: Time.zone.now)
    @group1_assignment_future = @course.assignments.create!(assignment_group: @group1, due_at: 3.months.from_now)
    @group2_assignment_today = @course.assignments.create!(assignment_group: @group2, due_at: Time.zone.now)
    gpg = Factories::GradingPeriodGroupHelper.new.legacy_create_for_course(@course)
    @gp_current = gpg.grading_periods.create!(
      title: 'current',
      weight: 50,
      start_date: 1.month.ago,
      end_date: 1.month.from_now
    )
    @gp_future = gpg.grading_periods.create!(
      title: 'future',
      weight: 50,
      start_date: 2.months.from_now,
      end_date: 4.months.from_now
    )
  end
end

describe AssignmentGroupsController, type: :request do
  include Api
  include Api::V1::Assignment
  include AssignmentGroupsApiSpecHelper

  before :once do
    course_with_teacher(active_all: true)
  end

  it "sorts the returned list of assignment groups" 


  it "should include full assignment jsonification when specified" 


  it "optionally includes 'grades_published' for moderated assignments" 


  context "exclude response fields" do
    before(:once) do
      setup_groups
      setup_four_assignments
    end

    it "excludes the descriptions of assignments if 'description' is included " \
    "in the exclude_response_fields param" do
      json = api_call(:get,
                      "/api/v1/courses/#{@course.id}/assignment_groups.json?" \
                      "include[]=assignments&exclude_response_fields[]=description",
                      { controller: 'assignment_groups', action: 'index',
                        format: 'json', course_id: @course.id.to_s,
                        include: ['assignments'],
                        exclude_response_fields: ['description']
      })

      json.each do |group|
        group["assignments"].each { |a| expect(a).not_to have_key "description" }
      end
    end

    it "excludes the needs_grading_count of assignments if " \
    "'needs_grading_count' is included in the exclude_response_fields param" do
      json = api_call(:get,
                      "/api/v1/courses/#{@course.id}/assignment_groups.json?" \
                      "include[]=assignments&exclude_response_fields[]=needs_grading_count",
                      { controller: 'assignment_groups', action: 'index',
                        format: 'json', course_id: @course.id.to_s,
                        include: ['assignments'],
                        exclude_response_fields: ['needs_grading_count']
      })

      json.each do |group|
        group["assignments"].each { |a| expect(a).not_to have_key "needs_grading_count" }
      end
    end
  end

  context "differentiated assignments" do
    it "should only return visible assignments when differentiated assignments is on" 


    it "should allow designers to see unpublished assignments" 


    it "should include assignment_visibility when requested" 

  end

  context "grading periods" do
    before :once do
      setup_grading_periods
    end

    describe "#index" do
      let(:api_path) { "/api/v1/courses/#{@course.id}/assignment_groups" }
      let(:api_settings) do
        {
          controller: 'assignment_groups', action: 'index', format: 'json',
          course_id: @course.id.to_s, grading_period_id: @gp_future.id.to_s,
          include: ['assignments']
        }
      end

      it "should only return assignments within the grading period" 


      it "should not return assignments outside the grading period" 

    end

    describe "#show" do
      it "should only return assignments and submissions within the grading period" 

    end

  end

  context 'when module_ids are requested' do
    before :each do
      @mods = Array.new(2) { |i| @course.context_modules.create! name: "Mod#{i}" }
      g = @course.assignment_groups.create! name: 'assignments'
      a = @course.assignments.create! assignment_group: g, title: 'blah'
      @mods.each { |m| m.add_item type: 'assignment', id: a.id }

      json = api_call(:get,
        "/api/v1/courses/#{@course.id}/assignment_groups.json?include[]=assignments&include[]=module_ids",
        { controller: 'assignment_groups', action: 'index',
          format: 'json', course_id: @course.id.to_s,
          include: %w[assignments module_ids]})

      @assignment_json = json.first["assignments"].first
    end

    it 'includes module_ids' 


    it 'includes module_positions' 

  end

  it "should not include all dates" 


  it "should include all dates" 


  it "should exclude deleted assignments" 


  it "should return weights that aren't being applied" 


  it "should not explode on assignments with <objects> with percentile widths" 


  it "should not return unpublished assignments to students" 

end


describe AssignmentGroupsApiController, type: :request do
  include Api
  include Api::V1::Assignment
  include AssignmentGroupsApiSpecHelper

  let(:name)             { "Awesome group name" }
  let(:position)         { 1 }
  let(:integration_data) { {"my existing" => "data", "more" => "data"} }

  let(:params) do
    {
      'name'             => name,
      'position'         => position,
      'integration_data' => integration_data
    }
  end

  let(:invalid_integration_data) { 'invalid integration data format' }

  let(:assignment_group) do
    rules_in_db = "drop_lowest:1\ndrop_highest:1\nnever_drop:1\nnever_drop:2\n"
    @course.assignment_groups.create!(name: 'group', rules: rules_in_db)
  end

  context '#show' do
    before :once do
      course_with_teacher(active_all: true)
      rules_in_db = "drop_lowest:1\ndrop_highest:1\nnever_drop:1\nnever_drop:2\n"
      @group = @course.assignment_groups.create!(name: 'group', rules: rules_in_db)
    end

    it 'should succeed' 


    it 'should fail if the assignment group does not exist' 


    context 'with assignments' do
      before(:once) do
        @assignment = @course.assignments.create!({
          title: "test",
          assignment_group: @group,
          points_possible: 10
        })
      end

      it 'should include assignments' 


      it 'should include submission when flag is present' 

    end

    it 'should only return assignments in the given grading period with MGP on' 


    it 'should not return an error when there are grading periods and no grading_period_id is passed in' 


    it "should include assignment_visibility when requested and with DA on" 


    it "should not include assignment_visibility when requested as a student" 


    it 'should return never_drop rules as strings with Accept header' 


    it 'should return never_drop rules as ints without Accept header' 

  end

  context '#create' do
    before do
      course_with_teacher(active_all: true)
    end

    it 'should create an assignment_group' 


    it 'does not create an assignment_group with invalid integration_data' 


    it 'responds with a 400 when invalid integration_data is included' 

  end

  context '#update' do
    let(:assignment_group) do
      @course.assignment_groups.create!(params)
    end

    let(:updated_name)             { "Newer Awesome group name" }
    let(:updated_position)         { 2 }
    let(:updated_integration_data) { {"new" => "datum", "v2" => "fractal"} }

    let(:updated_params) do
      {
        'name'             => updated_name,
        'position'         => updated_position,
        'integration_data' => updated_integration_data
      }
    end

    let(:put_url) { "/api/v1/courses/#{@course.id}/assignment_groups/#{assignment_group.id}" }

    let(:api_details) do
      {
        controller: 'assignment_groups_api',
        action: 'update',
        format: 'json',
        course_id: @course.id.to_s,
        assignment_group_id: assignment_group.id.to_s
      }
    end

    before :once do
      course_with_teacher(active_all: true)
      @assignment_group = @course.assignment_groups.create!(name: 'Some group',
                                                            position: 1,
                                                            integration_data: {"oh" => 'hello'})
    end

    it 'should update an assignment group' 


    it 'should update an assignment group when integration_data is nil' 


    it 'should update an assignment group when integration_data is {}' 


    it 'should update an assignment group without integration_data' 


    it 'does not update when integration_data is malformed' 


    it 'returns a 400 when integration data is malformed' 


    it 'should update rules properly' 


    context "when an assignment is due in a closed grading period" do
      let(:call_update) do
        -> (params, expected_status) do
          api_call_as_user(
            @current_user,
            :put, "/api/v1/courses/#{@course.id}/assignment_groups/#{@assignment_group.id}",
            {
              controller: 'assignment_groups_api',
              action: 'update',
              format: 'json',
              course_id: @course.id.to_s,
              assignment_group_id: @assignment_group.id.to_s
            },
            params,
            { 'Accept' => 'application/json+canvas-string-ids' },
            { expected_status: expected_status }
          )
        end
      end

      before :once do
        @grading_period_group = Factories::GradingPeriodGroupHelper.new.create_for_account(@course.root_account)
        @grading_period_group.enrollment_terms << @course.enrollment_term
        Factories::GradingPeriodHelper.new.create_for_group(@grading_period_group, {
          start_date: 2.weeks.ago, end_date: 2.days.ago, close_date: 1.day.ago
        })
        @assignment_group.update_attributes(group_weight: 50)
      end

      context "as a teacher" do
        before :each do
          @current_user = @teacher
          student_in_course(course: @course, active_all: true)
          @assignment = @course.assignments.create!({
            title: 'assignment',
            assignment_group: @assignment_group,
            due_at: 1.week.ago,
            workflow_state: 'published'
          })
        end

        it "cannot change group_weight" 


        it "cannot change rules" 


        it "succeeds when group_weight is not changed" 


        it "succeeds when rules have not changed" 


        it "ignores deleted assignments" 

      end

      context "as an admin" do
        it "can change group_weight" 

      end
    end
  end

  context '#destroy' do
    before :once do
      course_with_teacher(active_all: true)
      @assignment_group = @course.assignment_groups.create!(name: 'Some group', position: 1)
    end

    it 'should destroy an assignment group' 


    it 'should destroy assignments' 


    it 'should move assignments to a specified assignment group' 

  end
end

