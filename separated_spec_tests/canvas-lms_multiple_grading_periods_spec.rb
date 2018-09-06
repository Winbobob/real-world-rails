#
# Copyright (C) 2015 - present Instructure, Inc.
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

require_relative './common'
require_relative './helpers/gradebook_common'

describe "interaction with grading periods" do
  include_context "in-process server selenium tests"
  include GradebookCommon

  let(:group_helper) { Factories::GradingPeriodGroupHelper.new }
  let(:get_gradebook) { get "/courses/#{@course.id}/gradebook" }
  let(:now) { Time.zone.now }

  context "gradebook" do
    before :once do
      gradebook_data_setup(grading_periods: [:future, :current])
    end

    before :each do
      user_session(@teacher)
    end

    after :each do
      clear_local_storage
    end

    it "should display the correct grading period based on the GET param" 


    it "should display All Grading Periods when grading period id is set to 0" 


    it "should display the current grading period without a GET param" 


    context "using grading period dropdown" do
      it 'should display current grading period on load', test_id: 2528634, priority: "2" 


      it 'filters assignments when different grading periods selected', test_id: 2528635, priority: "2" 


      it 'displays all assignments when all grading periods selected', test_id: 2528636, priority: "2" 

    end
  end

  context 'grading schemes' do
    let(:account) { Account.default }
    let(:admin) { account_admin_user(:account => account) }
    let(:test_course) { account.courses.create!(name: 'New Course') }

    it 'should disable adding during edit mode on course page', priority: "1", test_id: 545585 do
      user_session(admin)
      get "/courses/#{test_course.id}/grading_standards"
      f('button.add_standard_button').click
      expect(f('input.scheme_name')).not_to be_nil
      expect(f('button.add_standard_button')).to have_class('disabled')
    end

    it 'should disable adding during edit mode on account page', priority: "1" 


    context 'assignment index page' do
      let(:account) { Account.default }
      let(:teacher) { user_factory(active_all: true) }
      let!(:enroll_teacher) { test_course.enroll_user(teacher, 'TeacherEnrollment', enrollment_state: 'active') }
      let!(:grading_period_group) { group_helper.legacy_create_for_course(test_course) }
      let!(:course_grading_period_current) do
        grading_period_group.grading_periods.create!(
          title: 'Course Grading Period 1',
          start_date: 1.day.ago(now),
          end_date: 4.weeks.from_now(now)
        )
      end
      let!(:course_grading_period_past) do
        grading_period_group.grading_periods.create!(
          title: 'Course Grading Period 2',
          start_date: 4.weeks.ago(now),
          end_date: 1.day.ago(now)
        )
      end
      let!(:assignment) do
        test_course.assignments.create!(
          title: 'Assignment 1',
          due_at: 1.day.ago(now),
          points_possible: 10,
          workflow_state: 'published'
        )
      end

      it 'should list an assignment from a previous grading period', priority: "2", test_course: 381145 do
        user_session(teacher)
        get "/courses/#{test_course.id}/assignments"
        expect(f("#assignment_#{assignment.id} a.ig-title")).to include_text('Assignment 1')
      end

      it 'should list an assignment from a current grading period when due date is updated', priority: "2", test_course: 576764 do
        assignment.update_attributes(due_at: 3.days.from_now(now))
        user_session(teacher)
        get "/courses/#{test_course.id}/assignments"
        expect(f("#assignment_#{assignment.id} a.ig-title")).to include_text('Assignment 1')
      end
    end
  end

  context 'student view' do
    let(:account) { Account.default }
    let(:test_course) { account.courses.create!(name: 'New Course') }
    let(:student) { user_factory(active_all: true) }
    let(:teacher) { user_factory(active_all: true) }
    let!(:enroll_teacher) { test_course.enroll_teacher(teacher) }
    let!(:enroll_student) { test_course.enroll_user(student, 'StudentEnrollment', enrollment_state: 'active') }
    let!(:grading_period_group) { group_helper.legacy_create_for_course(test_course) }
    let!(:course_grading_period_1) do
      grading_period_group.grading_periods.create!(
        title: 'Course Grading Period 1',
        start_date: 1.day.ago(now),
        end_date: 3.weeks.from_now(now)
      )
    end
    let!(:course_grading_period_2) do
      grading_period_group.grading_periods.create!(
        title: 'Course Grading Period 2',
        start_date: 4.weeks.from_now(now),
        end_date: 7.weeks.from_now(now)
      )
    end
    let!(:assignment1) { test_course.assignments.create!(title: 'Assignment 1', due_at: 3.days.from_now(now), points_possible: 10) }
    let!(:assignment2) { test_course.assignments.create!(title: 'Assignment 2', due_at: 6.weeks.from_now(now), points_possible: 10) }
    let!(:grade_assignment1) { assignment1.grade_student(student, grade: 8, grader: teacher) }

    before(:each) do
      test_course.offer!
      user_session(student)
      get "/courses/#{test_course.id}/grades"
    end

    it 'should display the current grading period and assignments in grades page', priority: "1", test_id: 202326 do
      expect(f("#grading_period_select_menu option[selected]")).to include_text('Course Grading Period 1')
      expect(f("#submission_#{assignment1.id} th a")).to include_text('Assignment 1')
    end

    it 'should update assignments when a different period is selected in grades page', priority: "1", test_id: 562596 do
      fj("#grading_period_select_menu option:nth-child(3)").click
      expect_new_page_load { f('#apply_select_menus').click }
      expect(fj("#submission_#{assignment2.id} th a")).to include_text('Assignment 2')
    end

    it 'should update assignments when a all periods are selected in grades page', priority: "1", test_id: 571756 do
      fj("#grading_period_select_menu option:nth-child(1)").click
      expect_new_page_load { f('#apply_select_menus').click }
      expect(fj("#submission_#{assignment1.id} th a")).to include_text('Assignment 1')
      expect(fj("#submission_#{assignment2.id} th a")).to include_text('Assignment 2')
    end
  end
end
