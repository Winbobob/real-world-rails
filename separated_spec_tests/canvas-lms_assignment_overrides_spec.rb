#
# Copyright (C) 2011 Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper.rb')

describe AssignmentOverridesController, type: :request do
  def validate_override_json(override, json)
    expect(json['id']).to eq override.id
    expect(json['assignment_id']).to eq override.assignment_id
    expect(json['title']).to eq override.title

    if override.due_at_overridden
      expect(json['due_at']).to eq override.due_at.iso8601
      expect(json['all_day']).to eq override.all_day
      expect(json['all_day_date']).to eq override.all_day_date.to_s
    else
      expect(json).not_to have_key 'due_at'
      expect(json).not_to have_key 'all_day'
      expect(json).not_to have_key 'all_day_date'
    end

    if override.unlock_at_overridden
      expect(json['unlock_at']).to eq override.unlock_at.iso8601
    else
      expect(json).not_to have_key 'unlock_at'
    end

    if override.lock_at_overridden
      expect(json['lock_at']).to eq override.lock_at.iso8601
    else
      expect(json).not_to have_key 'lock_at'
    end

    case override.set
    when Array
      expect(json['student_ids']).to eq override.set.map(&:id)
      expect(json).not_to have_key 'group_id'
      expect(json).not_to have_key 'course_section_id'
    when Group
      expect(json['group_id']).to eq override.set_id
      expect(json).not_to have_key 'student_ids'
      expect(json).not_to have_key 'course_section_id'
    when CourseSection
      expect(json['course_section_id']).to eq override.set_id
      expect(json).not_to have_key 'student_ids'
      expect(json).not_to have_key 'group_id'
    end
  end

  def expect_errors(errors)
    assert_status(400)
    json = JSON.parse(response.body)
    expect(json).to eq({"errors" => errors})
  end

  def expect_error(error)
    expect_errors([error])
  end

  context "index" do
    before :once do
      course_with_teacher(:active_all => true)
      assignment_model(:course => @course)
      assignment_override_model(:assignment => @assignment)
      @override.set = @course.default_section
      @override.save!
    end

    it "should include visible overrides" 


    it "should exclude deleted overrides" 


    it "should include overrides outside the user's sections if user is admin" 


    it "should have formatted overrides" 

  end

  context "show" do
    before :once do
      course_with_teacher(:active_all => true)
      assignment_model(:course => @course, :group_category => 'category')
      assignment_override_model(:assignment => @assignment)
      @override.set = @course.default_section
      @override.save!
    end

    def raw_api_show_override(course, assignment, override)
      raw_api_call(:get, "/api/v1/courses/#{course.id}/assignments/#{assignment.id}/overrides/#{override.id}.json",
                   :controller => 'assignment_overrides', :action => 'show', :format => 'json',
                   :course_id => course.id.to_s, :assignment_id => assignment.id.to_s, :id => override.id.to_s)
    end

    def api_show_override(course, assignment, override)
      api_call(:get, "/api/v1/courses/#{course.id}/assignments/#{assignment.id}/overrides/#{override.id}.json",
               :controller => 'assignment_overrides', :action => 'show', :format => 'json',
               :course_id => course.id.to_s, :assignment_id => assignment.id.to_s, :id => override.id.to_s)
    end

    describe 'as an account admin not enrolled in the class' do
      before :each do
        account_admin_user(:account => Account.site_admin, :active_all => true)
      end

      it 'it works' 

    end

    it "should return the override json" 


    it "should 404 for non-visible override" 


    it "should exclude due_at/all_day/all_day_date/lock_at/unlock_at when not overridden" 


    it "should include unlock_at when overridden" 


    it "should include lock_at when overridden" 


    it "should include due_at/all_day/all_day_date when due_at is overridden" 


    it "should include proper set fields when set is a group" 


    it "should include proper set fields when set is adhoc" 

  end

  context "group alias" do
    before :once do
      course_with_teacher(:active_all => true)
      assignment_model(:course => @course, :group_category => 'category')
      group_model(:context => @course, :group_category => @assignment.group_category)
      assignment_override_model(:assignment => @assignment)
      @override.set = @group
      @override.save!
      @group.add_user(@teacher, 'accepted')
    end

    it "should redirect in nominal case" 


    it "should 404 for non-visible group" 


    it "should 404 for unconnected group/assignment" 

  end

  context "section alias" do
    before :once do
      course_with_teacher(:active_all => true)
      assignment_model(:course => @course)
      assignment_override_model(:assignment => @assignment)
      @override.set = @course.default_section
      @override.save!
    end

    it "should redirect in nominal case" 


    it "should 404 for non-visible section" 


    it "should 404 for unconnected section/assignment" 

  end

  context "create" do
    def raw_api_create_override(course, assignment, data)
      raw_api_call(:post, "/api/v1/courses/#{course.id}/assignments/#{assignment.id}/overrides.json",
        { :controller => 'assignment_overrides', :action => 'create', :format => 'json',
          :course_id => course.id.to_s, :assignment_id => assignment.id.to_s },
        data)
    end

    def api_create_override(course, assignment, data)
      @user = @teacher
      api_call(:post, "/api/v1/courses/#{course.id}/assignments/#{assignment.id}/overrides.json",
        { :controller => 'assignment_overrides', :action => 'create', :format => 'json',
          :course_id => course.id.to_s, :assignment_id => assignment.id.to_s },
        data)
    end

    before :once do
      course_with_teacher(:active_all => true)
      assignment_model(:course => @course)
    end

    it "should error when missing set info" 


    context "adhoc" do
      specs_require_sharding

      def mock_sharding_data
        @shard1.activate { @user = User.create!(name: "McShardalot")}
        @course.enroll_student @user
      end

      def validate_global_id
        @override = @assignment.assignment_overrides.reload.first
        expect(@override).not_to be_nil
        expect(@override.set).to eq [@student]
      end

      before :once do
        @student = student_in_course(:course => @course, :user => user_with_pseudonym).user
        @title = 'adhoc title'
        @user = @teacher
      end

      it "should create an adhoc assignment override" 


      it "should create an adhoc assignment override with global id for student" 


      it "should create an adhoc assignment override with global id for course" 


      it "should create an adhoc assignment override with global id for assignment" 


      it "should set the adhoc override title" 


      it "should recognize sis ids for an adhoc assignment override" 


      it "should error with wrong data type for student_ids" 


      it "should error unless all student ids are found for an adhoc assignment override" 


      it "should not error if the assignment is a group assignment" 


      context "title" do
        before :once do
          names = ["Adam Aardvark", "Ben Banana", "Chipmunk Charlie", "Donald Duck", "Erik Erikson", "Freddy Frog"]
          @students = names.map do |name|
            student_in_course(course: @course, :user => user_with_pseudonym(name: name)).user
          end
          @course.reload
        end

        it "should concat students names if there are fewer than 4" 


        it "should add an others count if there are more than 4" 


        it "should alphabetize the students names" 


        it "should prefer a given title" 

      end
    end

    context "group" do
      before :once do
        @assignment.group_category = @course.group_categories.create!(name: "foo")
        @assignment.save!
        @group = group_model(:context => @course, :group_category => @assignment.group_category)
      end

      it "should create a group assignment override" 


      it "should error on invalid group_id" 


      it "should error if the assignment is not a group assignment" 

    end

    context "section" do
      it "should create a section assignment override" 


      it "should error on invalid course_section_id" 


      it "should not error if the assignment is a group assignment" 

    end

    context "set precedence" do
      it "should ignore group_id if there are student_ids" 


      it "should ignore course_section_id if there are student_ids" 


      it "should ignore course_section_id if there is a group_id" 

    end

    it "should error if you try and duplicate a set" 


    it "should error if you try and duplicate a student in an adhoc set" 


    context "overridden due_at" do
      it "should set the override due_at" 


      it "should set a nil override due_at" 


      it "should error on invalid due_at" 

    end

    context "overridden unlock_at" do
      it "should set the override unlock_at" 


      it "should set a nil override unlock_at" 


      it "should error on invalid unlock_at" 

    end

    context "overridden lock_at" do
      it "should set the override lock_at" 


      it "should set a nil override lock_at" 


      it "should error on invalid lock_at" 

    end

    it "should return the override json" 

  end

  context "update" do
    def raw_api_update_override(course, assignment, override, data)
      raw_api_call(:put, "/api/v1/courses/#{course.id}/assignments/#{assignment.id}/overrides/#{override.id}.json",
        { :controller => 'assignment_overrides', :action => 'update', :format => 'json',
          :course_id => course.id.to_s, :assignment_id => assignment.id.to_s, :id => override.id.to_s },
        data)
    end

    def api_update_override(course, assignment, override, data)
      @user = @teacher
      api_call(:put, "/api/v1/courses/#{course.id}/assignments/#{assignment.id}/overrides/#{override.id}.json",
        { :controller => 'assignment_overrides', :action => 'update', :format => 'json',
          :course_id => course.id.to_s, :assignment_id => assignment.id.to_s, :id => override.id.to_s },
        data)
    end

    before :once do
      course_with_teacher(:active_all => true)
      assignment_model(:course => @course)
      assignment_override_model(:assignment => @assignment)
    end

    it "should not error without set info" 


    it "should not change values not specified" 


    context "adhoc override" do
      before :once do
        @student = student_in_course(:course => @course).user
        @title = 'adhoc title'
        @user = @teacher

        @override.title = @title
        @override_student = @override.assignment_override_students.build
        @override_student.user = @student
        @override.save!
      end

      it "should ignore group_id and section_id" 


      it "should allow changing the students in the set" 


      it "should not change the title when only changing the due date" 


      it "should relock modules when changing overrides" 


      it "recomputes grades when changing overrides" 


      it "runs DueDateCacher after changing overrides" 


      it "should allow changing the title" 


      it "should error if you try and duplicate a student in an adhoc set" 

    end

    context "group override" do
      before :once do
        @assignment.group_category = @course.group_categories.create!(name: "foo")
        @assignment.save!
        @group = group_model(:context => @course, :group_category => @assignment.group_category)

        @override.reload
        @override.set = @group
        @override.save!
      end

      it "should ignore student_ids, group_id, and section_id" 


      it "should not allow changing the title" 

    end

    context "section override" do
      before :once do
        @override.set = @course.default_section
        @override.save!
      end

      it "should ignore student_ids, group_id, and section_id" 


      it "should not allow changing the title" 

    end

    context "overridden due_at" do
      before :once do
        @override.set = @course.default_section
        @override.save!

        @due_at = 2.days.ago
      end

      it "should set the override due_at" 


      it "should set a nil override due_at" 


      it "should clear a previous override if unspecified" 


      it "should error on invalid due_at" 

    end

    context "overridden unlock_at" do
      before :once do
        @override.set = @course.default_section
        @override.save!

        @unlock_at = 2.days.ago
        @unlock_at -= (@unlock_at.to_f % 1) # shave of usecs
      end

      it "should set the override unlock_at" 


      it "should set a nil override unlock_at" 


      it "should clear a previous override if unspecified" 


      it "should error on invalid unlock_at" 

    end

    context "overridden lock_at" do
      before :once do
        @override.set = @course.default_section
        @override.save!

        @lock_at = 2.days.ago
        @lock_at -= (@lock_at.to_f % 1) # shave of usecs
      end

      it "should set the override lock_at" 


      it "should set a nil override lock_at" 


      it "should clear a previous override if unspecified" 


      it "should error on invalid lock_at" 

    end

    it "should return the override json" 

  end

  context "destroy" do
    before :once do
      course_with_teacher(:active_all => true)
      assignment_model(:course => @course, :group_category => 'category')
      assignment_override_model(:assignment => @assignment)
      @override.set = @course.default_section
      @override.save!
    end

    it "should delete the override" 


    it "should return the override details" 


    it "should 404 for non-visible override" 

  end

  context 'batch operations' do
    before :once do
      course_with_teacher(:active_all => true)
      @a, @b = 2.times.map { assignment_model(:course => @course) }
      @a1, @a2 = 2.times.map do
        student_in_course
        create_adhoc_override_for_assignment(@a, @student)
      end
      @b1, @b2, @b3 = 3.times.map do
        create_section_override_for_assignment(@b, course_section: @course.course_sections.create!)
      end
      @user = @teacher
    end

    def args_for(assignment, override = nil, attrs = {})
      args = {assignment_id: assignment.id}
      args[:id] = override.id if override.present?
      args.deep_merge(attrs)
    end

    describe "batch_retrieve" do
      def call_batch_retrieve(overrides_array, opts = {})
        api_call(:get, "/api/v1/courses/#{@course.id}/assignments/overrides.json", {
                    controller: 'assignment_overrides', action: 'batch_retrieve', format: 'json',
                    course_id: @course.id.to_s
                  },
                  { assignment_overrides: overrides_array },
                  {},
                  opts)
      end

      def matched_ids(json)
        json.map {|override_json| override_json.try(:[], 'id')}
      end

      it "should fail if no overrides requested" 


      it "should fail if overrides incorrectly specified" 


      it "should fail if override ids incorrectly specified" 


      it "should retrieve multiple overrides in order" 


      it "accepts a map that looks like an array" 


      it "should apply visibility on overrides" 


      it "should omit non-existent overrides" 


      it "should omit non-existent assignments" 

    end

    describe "batch_update" do
      def call_batch_update(overrides_array, opts = {})
        api_call(:put, "/api/v1/courses/#{@course.id}/assignments/overrides.json", {
                    controller: 'assignment_overrides', action: 'batch_update', format: 'json',
                    course_id: @course.id.to_s
                  },
                  {assignment_overrides: overrides_array},
                  {}, # headers
                  opts)
      end

      it "should fail unless override ids are specified" 



      it "should fail for user without permissions" 


      it "should fail if ids not present" 


      it "should fail if attributes are invalid" 


      it "should fail if records not found" 


      it "should fail and not update if updates are invalid" 


      it "should succeed if formatted correctly" 

    end

    describe "batch_create" do
      def call_batch_create(overrides_array, opts = {})
        api_call(:post, "/api/v1/courses/#{@course.id}/assignments/overrides.json", {
                    controller: 'assignment_overrides', action: 'batch_create', format: 'json',
                    course_id: @course.id.to_s
                  },
                  {assignment_overrides: overrides_array},
                  {}, # headers
                  opts)
      end

      it "should fail if override ids are specified" 


      it "should succeed if formatted correctly" 

    end
  end
end

