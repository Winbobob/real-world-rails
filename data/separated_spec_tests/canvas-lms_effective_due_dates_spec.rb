#
# Copyright (C) 2016 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe Course do
  before(:once) do
    @test_course = Course.create!
    course_with_teacher(course: @test_course, active_all: true)
    @teacher = @user
  end

  describe 'for_course' do
    it 'raises error if context is not a course' 


    it 'raises error if context has no id' 


    it 'saves context' 

  end

  describe '#filter_students_to' do
    let(:edd) { EffectiveDueDates.for_course(@test_course) }

    it 'defaults to no filtered students' 


    it 'saves an array of students' 


    it 'saves a list of students' 


    it 'saves a list of student ids' 


    it 'does nothing if no students are passed' 


    it 'allows chaining' 

  end

  describe '#to_hash' do
    before(:once) do
      @now = Time.zone.now.change(sec: 0)
      @student1_enrollment = student_in_course(course: @test_course, active_all: true)
      @student1 = @student1_enrollment.user
      @student2 = student_in_course(course: @test_course, active_all: true).user
      @student3 = student_in_course(course: @test_course, active_all: true).user
      @other_course = Course.create!
      @student_in_other_course = student_in_course(course: @other_course, active_all: true).user
      @assignment1 = @test_course.assignments.create!(due_at: 2.weeks.from_now(@now))
      @assignment2 = @test_course.assignments.create!
      @assignment3 = @test_course.assignments.create!
      @deleted_assignment = @test_course.assignments.create!
      @deleted_assignment.destroy
      @assignment_in_other_course = @other_course.assignments.create!
    end

    it 'properly converts timezones' 


    it 'returns the effective due dates per assignment per student' 


    it 'returns the effective due dates per assignment for select students when filtered' 


    it 'maps id if the assignments are already loaded' 


    it 'uses sql if the assignments are still a relation' 


    it 'memoizes the result' 


    it 'can be passed a list of keys to only return those attributes' 


    describe 'initializes with' do
      it 'no arguments and defaults to all active course assignments' 


      it 'a list of ActiveRecord Assignment models' 


      it 'an array of ActiveRecord Assignment models' 


      it 'a list of ids' 


      it 'an array of ids' 


      it 'a single ActiveRecord relation' 


      it 'nil' 


      it 'new Assignment objects that do not have an ID' 

    end

    it 'ignores students who are not in the course' 


    it 'ignores assignments that are not in this course' 


    it 'ignores assignments that are soft-deleted' 


    it 'ignores enrollments that rejected the course invitation' 


    it 'includes deactivated enrollments' 


    it 'includes concluded enrollments' 


    it 'ignores enrollments that are not students' 


    it 'ignores soft deleted students' 


    context 'when only visible to overrides' do
      before(:once) do
        @assignment1.only_visible_to_overrides = true
        @assignment1.save!
      end

      it 'ignores inactive overrides' 


      it 'ignores noop overrides' 


      it 'includes overrides with null due dates' 


      it 'includes overrides without due_at_overridden, and uses the due_at from the assignment' 


      it 'uses the due_at from the assignment when the assignment is only visible to overrides and no overrides for the student have due_at_overridden' 


      it 'uses the due_at from the assignment when the assignment is visible to everyone and no overrides for the student have due_at_overridden' 


      it 'does not consider the due_at from overrides without due_at_overridden when the override due_at is nil' 


      it 'does not consider the due_at from overrides without due_at_overridden even if the due date is more lenient than other dates' 


      it 'applies adhoc overrides' 


      it 'ignores soft-deleted adhoc overrides' 


      it 'correctly matches adhoc overrides for different assignments' 


      it 'correctly matches adhoc overrides for different students' 


      it 'applies group overrides' 


      it 'ignores overrides for soft-deleted groups' 


      it 'only applies group overrides to students that have accepted the group invitation' 


      it 'applies section overrides' 


      it 'ignores section overrides for TAs' 


      it 'ignores overrides for soft-deleted sections' 


      it 'ignores not-assigned students with existing graded submissions' 


      it 'uses assigned date instead of submission date even if submission was late' 


      it 'prioritizes the override due date if it exists over the Everyone Else date' 


      # this might look like a strange test to have, but it is a result of how we are joining different tables in sql.
      it 'prioritizes the override due date even if it is earlier than the Everyone Else date and the student has a graded submission that does not qualify' 


      it 'prioritizes the Everyone Else due date if it exists over the submission NULL date' 


      it 'ignores not-assigned students with ungraded submissions' 


      it 'picks the due date that gives the student the most amount of time to submit' 


      it 'treats null due dates as the most permissive due date for a student' 


      it 'returns all students in the course if the assignment is assigned to everybody' 


      context 'with grading periods' do
        before(:once) do
          @gp_group = Factories::GradingPeriodGroupHelper.new.create_for_account(@test_course.account)
          @gp_group.enrollment_terms << @test_course.enrollment_term
        end

        it 'uses account grading periods if no course grading periods exist' 


        it 'uses only course grading periods if any exist (legacy)' 


        it 'ignores account grading periods for unrelated enrollment terms' 


        it 'uses the effective due date to find a closed grading period' 


        it 'truncates seconds when comparing override due dates to grading period dates' 


        it 'ignores soft-deleted grading period groups' 


        it 'ignores soft-deleted grading periods' 


        describe 'in_closed_grading_period attribute' do
          it 'is true if the associated grading period is closed' 


          it 'is false if the associated grading period is open' 


          it 'is false if the due date does not fall in a grading period' 


          it 'is true if the due date is null and the last grading period is closed' 


          it 'is false if the due date is null and the last grading period is open' 

        end
      end
    end
  end

  context 'grading periods' do
    before(:once) do
      @now = Time.zone.now.change(sec: 0)
      @test_course = Course.create!
      @student1 = student_in_course(course: @test_course, active_all: true).user
      @student2 = student_in_course(course: @test_course, active_all: true).user
      @gp_group = Factories::GradingPeriodGroupHelper.new.create_for_account(@test_course.account)
      @gp_group.enrollment_terms << @test_course.enrollment_term
      @grading_period = Factories::GradingPeriodHelper.new.create_for_group(
        @gp_group,
        start_date: 20.days.ago(@now),
        end_date: 15.days.ago(@now),
        close_date: 10.days.ago(@now)
      )
      @assignment1 = @test_course.assignments.create!(due_at: 2.weeks.from_now(@now))
      @assignment2 = @test_course.assignments.create!
    end

    describe '#any_in_closed_grading_period?' do
      it 'returns false if there are no grading periods' 


      context 'with grading periods' do
        it 'returns true if any students in any assignments have a due date in a closed grading period' 


        it 'returns false if no student in any assignments has a due date in a closed grading period' 


        it 'memoizes the result' 

      end
    end

    describe '#grading_period_id_for' do
      it 'returns the grading_period_id for the given student and assignment' 


      it 'returns nil if there if the given student and assignment do not fall in a grading period' 


      it 'returns nil if the assignment is not assigned to the student' 

    end

    describe '#in_closed_grading_period?' do
      it 'returns false if there are no grading periods' 


      it 'returns false if assignment id is nil' 


      context 'with grading periods' do
        before do
          @assignment2.due_at = 1.day.ago(@now)
          @assignment2.only_visible_to_overrides = false
          @assignment2.save!
          override = @assignment2.assignment_overrides.create!(due_at: 19.days.ago(@now), due_at_overridden: true)
          override.assignment_override_students.create!(user: @student2)

          @edd = EffectiveDueDates.for_course(@test_course)
        end

        it 'returns true if any students in the given assignment have a due date in a closed grading period' 


        it 'accepts assignment id as the argument' 


        it 'returns false if no student in the given assignment has a due date in a closed grading period' 


        it 'returns true if the specified student has a due date for this assignment' 


        it 'raises error if the specified student was filtered out of the query' 


        it 'returns true if the specified student was included in the query and has a due date for this assignment' 


        it 'returns false if the specified student has a due date in an open grading period' 


        it 'returns false if the specified student does not have a due date for this assignment' 

      end
    end
  end
end

