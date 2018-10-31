#
# Copyright (C) 2017 - present Instructure, Inc.
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

require "spec_helper"

describe GradebookUserIds do
  let_once :has_pg_collkey do
    status = if User.connection.extension_installed?(:pg_collkey)
      begin
        Bundler.require 'icu'
        true
      rescue LoadError
        skip 'requires icu locally SD-2747'
        false
      end
    end

    status || false
  end

  before(:once) do
    @course = Course.create!
    @teacher = teacher_in_course(course: @course, active_all: true).user
    @teacher.preferences[:gradebook_settings] = {}
    @teacher.preferences[:gradebook_settings][@course.id] = {
      show_inactive_enrollments: "false",
      show_concluded_enrollments: "false",
      sort_rows_by_column_id: "student",
      sort_rows_by_setting_key: "name",
      sort_rows_by_direction: "ascending",
      filter_columns_by: {},
      filter_rows_by: {}
    }
    @student1 = student_in_course(
      course: @course,
      active_all: true,
      allow_multiple_enrollments: true
    ).user
    @student1.update!(sortable_name: "Bert")
    @student2 = student_in_course(
      course: @course,
      active_all: true
    ).user
    @student2.update!(sortable_name: "Ernie")
    @student3 = student_in_course(
      course: @course,
      active_all: true
    ).user
    @student3.update!(sortable_name: "Carl")
    @student4 = student_in_course(
      course: @course,
      active_all: true
    ).user
    @student4.update!(sortable_name: "carl")
    inactive_enrollment = student_in_course(
      course: @course,
      active_all: true
    )
    inactive_enrollment.deactivate
    @inactive_student = inactive_enrollment.user
    @inactive_student.update!(sortable_name: "Inactive Student")
    concluded_enrollment = student_in_course(
      course: @course,
      active_all: true,
      name: "Concluded Student"
    )
    concluded_enrollment.conclude
    @concluded_student = concluded_enrollment.user
    @concluded_student.update!(sortable_name: "Concluded Student")
    @fake_student_enrollment = course_with_user('StudentViewEnrollment', course: @course, active_all: true)
    @fake_student = @fake_student_enrollment.user
    @fake_student.update!(sortable_name: "Baker")
  end

  let(:gradebook_user_ids) { GradebookUserIds.new(@course, @teacher) }

  it "only returns users belonging to the selected section" 


  context "with viewing user's privileges limited" do
    let!(:viewable_section) { @course.course_sections.create! }

    before(:each) do
      teacher_in_section(
        viewable_section,
        # we omit allow_multiple_enrollments here to clear this user's existing enrollments
        limit_privileges_to_course_section: true,
        user: @teacher
      )

      student_in_section(
        viewable_section,
        user: @student1
      )
    end

    it "only returns users in the teacher's sections" 


    it "returns visible inactive/concluded users" 

  end

  context 'with pg_collkey installed' do
    before do
      skip 'requires pg_collkey installed SD-2747' unless has_pg_collkey
    end

    it "sorts by sortable name ascending if the user does not have any saved sort preferences" 


    it "sorts by sortable name ascending if the user's sort preferences are not supported" 


    it "does not return duplicate user ids for students with multiple enrollments" 

  end

  context 'with pg_collkey not installed' do
    before do
      skip 'requires pg_collkey to not be installed SD-2747' if has_pg_collkey
    end

    it "sorts by sortable name ascending if the user does not have any saved sort preferences" 


    it "sorts by sortable name ascending if the user's sort preferences are not supported" 


    it "does not return duplicate user ids for students with multiple enrollments" 

  end

  describe "student sortable name sorting" do
    it "excludes fake students if they are deactivated" 


    it "includes inactive student ids if the user preferences include show_inactive_enrollments" 


    it "includes concluded student ids if the user preferences include show_concluded_enrollments" 


    context 'with pg_collkey installed' do
      before do
        skip 'requires pg_collkey installed SD-2747' unless has_pg_collkey
      end

      it "sorts by student sortable name ascending" 


      it "sorts by student sortable name descending" 


      it "includes concluded students ids if the course is concluded" 

    end

    context 'with pg_collkey not installed' do
      before do
        skip 'requires pg_collkey to not be installed SD-2747' if has_pg_collkey
      end

      it "sorts by student sortable name ascending" 


      it "sorts by student sortable name descending" 


      it "includes concluded students ids if the course is concluded" 

    end
  end

  describe "assignment sorting" do
    before(:once) do
      @assignment = @course.assignments.create!(points_possible: 10)
    end

    describe "sort by missing" do
      before(:once) do
        @assignment.grade_student(@student1, grade: 8, grader: @teacher)
        @assignment.grade_student(@student2, grade: 1, grader: @teacher)
        @assignment.grade_student(@student3, grade: 9, grader: @teacher)
        @assignment.grade_student(@student4, grade: 9, grader: @teacher)
        @teacher.preferences[:gradebook_settings][@course.id][:sort_rows_by_column_id] = "assignment_#{@assignment.id}"
        @teacher.preferences[:gradebook_settings][@course.id][:sort_rows_by_setting_key] = "missing"
      end

      it "returns user ids for users with missing submissions first" 


      it "puts fake users at the end, ordered by their sortable_name and user_id" 


      it "excludes fake students if they are deactivated" 


      it "includes inactive student ids if the user preferences include show_inactive_enrollments" 


      it "includes concluded student ids if the user preferences include show_concluded_enrollments" 


      it "includes concluded students ids if the course is concluded" 


      context 'when pg_collkey is installed' do
        before do
          skip 'requires pg_collkey installed SD-2747' unless has_pg_collkey
        end

        it "orders the missing user_ids by their sortable_name and user_id" 


        it "puts non-missing, real users in the middle, ordered by their sortable_name and user_id" 

      end

      context 'when pg_collkey is not installed' do
        before do
          skip 'requires pg_collkey to not be installed SD-2747' if has_pg_collkey
        end

        it "orders the missing user_ids by their sortable_name and user_id" 


        it "puts non-missing, real users in the middle, ordered by their sortable_name and user_id" 

      end
    end

    describe "sort by late" do
      before(:once) do
        @assignment.grade_student(@student1, grade: 8, grader: @teacher)
        @assignment.grade_student(@student2, grade: 1, grader: @teacher)
        @assignment.grade_student(@student3, grade: 9, grader: @teacher)
        @assignment.grade_student(@student4, grade: 9, grader: @teacher)
        @teacher.preferences[:gradebook_settings][@course.id][:sort_rows_by_column_id] = "assignment_#{@assignment.id}"
        @teacher.preferences[:gradebook_settings][@course.id][:sort_rows_by_setting_key] = "late"
      end

      it "returns user ids for users with late submissions first" 


      it "puts fake users at the end, ordered by their sortable_name and user_id" 


      it "excludes fake students if they are deactivated" 


      it "includes inactive student ids if the user preferences include show_inactive_enrollments" 


      it "includes concluded student ids if the user preferences include show_concluded_enrollments" 


      it "includes concluded students ids if the course is concluded" 


      context 'when pg_collkey is installed' do
        before do
          skip 'requires pg_collkey installed SD-2747' unless has_pg_collkey
        end

        it "orders the missing user_ids by their sortable_name and user_id" 


        it "puts non-late, real users in the middle, ordered by their sortable_name and user_id" 

      end

      context 'when pg_collkey is not installed' do
        before do
          skip 'requires pg_collkey to not be installed SD-2747' if has_pg_collkey
        end

        it "orders the missing user_ids by their sortable_name and user_id" 


        it "puts non-late, real users in the middle, ordered by their sortable_name and user_id" 

      end
    end

    describe "sort by grade" do
      before(:once) do
        @assignment.grade_student(@student1, grade: 8, grader: @teacher)
        @assignment.grade_student(@student2, grade: 1, grader: @teacher)
        @assignment.grade_student(@student3, grade: 9, grader: @teacher)
        @assignment.grade_student(@student4, grade: 9, grader: @teacher)
        @teacher.preferences[:gradebook_settings][@course.id][:sort_rows_by_column_id] = "assignment_#{@assignment.id}"
        @teacher.preferences[:gradebook_settings][@course.id][:sort_rows_by_setting_key] = "grade"
      end

      it "includes concluded students ids if the course is concluded" 


      context "ascending" do
        before(:once) do
          @teacher.preferences[:gradebook_settings][@course.id][:sort_rows_by_direction] = "ascending"
        end

        it "excludes fake students if they are deactivated" 


        context 'when pg_collkey is installed' do
          before do
            skip 'requires pg_collkey installed SD-2747' unless has_pg_collkey
          end

          it "returns user ids sorted by grade on the assignment" 


          it "places students without submissions at the end, but before fake students" 


          it "places students that have been graded with nil grades at the end, but before fake students" 


          it "places students that are not assigned at the end, but before fake students" 


          it "returns all students even if only a subset is assigned" 

        end

        context 'when pg_collkey is not installed' do
          before do
            skip 'requires pg_collkey to not be installed SD-2747' if has_pg_collkey
          end

          it "returns user ids sorted by grade on the assignment" 


          it "places students without submissions at the end, but before fake students" 


          it "places students that have been graded with nil grades at the end, but before fake students" 


          it "places students that are not assigned at the end, but before fake students" 

        end
      end

      context "descending" do
        before(:once) do
          @teacher.preferences[:gradebook_settings][@course.id][:sort_rows_by_direction] = "descending"
        end

        it "excludes fake students if they are deactivated" 


        context 'when pg_collkey is installed' do
          before do
            skip 'requires pg_collkey installed SD-2747' unless has_pg_collkey
          end

          it "returns user ids sorted by grade on the assignment" 


          it "places students without submissions at the end, but before fake students" 


          it "places students that have been graded with a nil grade at the end, but before fake students" 


          it "places students that are not assigned at the end, but before fake students" 

        end

        context 'when pg_collkey is not installed' do
          before do
            skip 'requires pg_collkey to not be installed SD-2747' if has_pg_collkey
          end

          it "returns user ids sorted by grade on the assignment" 


          it "places students without submissions at the end, but before fake students" 


          it "places students that have been graded with a nil grade at the end, but before fake students" 


          it "places students that are not assigned at the end, but before fake students" 

        end
      end

      it "includes inactive student ids if the user preferences include show_inactive_enrollments" 


      it "includes concluded student ids if the user preferences include show_concluded_enrollments" 

    end
  end

  describe "score sorting" do
    before(:once) do
      @now = Time.zone.now
      @assignment1 = @course.assignments.create!(points_possible: 10, due_at: 1.month.from_now(@now))
      @second_assignment_group = @course.assignment_groups.create(name: 'second group')
      @assignment2 = @course.assignments.create!(
        points_possible: 100, due_at: 3.months.from_now(@now), assignment_group: @second_assignment_group
      )

      @assignment1.grade_student(@student1, grade: 1, grader: @teacher)
      @assignment1.grade_student(@student2, grade: 10, grader: @teacher)
      @assignment1.grade_student(@student3, grade: 5, grader: @teacher)
      @assignment1.grade_student(@student4, grade: 6, grader: @teacher)

      @assignment2.grade_student(@student1, grade: 5, grader: @teacher)
      @assignment2.grade_student(@student2, grade: 1, grader: @teacher)
      @assignment2.grade_student(@student3, grade: 100, grader: @teacher)
      @assignment2.grade_student(@student4, grade: 99, grader: @teacher)

      @teacher.preferences[:gradebook_settings][@course.id][:sort_rows_by_column_id] = "total_grade"
      @teacher.preferences[:gradebook_settings][@course.id][:sort_rows_by_setting_key] = "grade"
    end

    context 'when pg_collkey is installed' do
      before do
        skip 'requires pg_collkey installed SD-2747' unless has_pg_collkey
      end

      context "with total grade" do
        it "sorts by total grade ascending" 


        it "sorts by total grade descending" 


        it "includes concluded students ids if the course is concluded" 

      end

      context "with assignment group" do
        before(:once) do
          @teacher.preferences[:gradebook_settings][@course.id][:sort_rows_by_column_id] =
            "assignment_group_#{@second_assignment_group.id}"
        end

        it "sorts by assignment group grade ascending" 


        it "sorts by assignment group grade descending" 


        it "includes concluded students ids if the course is concluded" 

      end
    end

    context 'when pg_collkey is not installed' do
      before do
        skip 'requires no pg_collkey installed SD-2747' if has_pg_collkey
      end

      context "with total grade" do
        it "sorts by total grade ascending" 


        it "sorts by total grade descending" 


        it "includes concluded students ids if the course is concluded" 

      end

      context "with assignment groups" do
        before(:once) do
          @teacher.preferences[:gradebook_settings][@course.id][:sort_rows_by_column_id] =
            "assignment_group_#{@second_assignment_group.id}"
        end

        it "sorts by assignment group grade ascending" 


        it "sorts by assignment group grade descending" 


        it "includes concluded students ids if the course is concluded" 

      end
    end

    it "excludes fake students if they are deactivated" 


    it "includes inactive student ids if the user preferences include show_inactive_enrollments" 


    it "includes concluded student ids if the user preferences include show_concluded_enrollments" 


    context "Multiple Grading Periods" do
      before(:once) do
        term = @course.enrollment_term
        set = @course.root_account.grading_period_groups.create!
        set.enrollment_terms << term
        @current_period = set.grading_periods.create!(
          title: "Current Period",
          start_date: 1.month.ago(@now),
          end_date: 2.months.from_now(@now)
        )
        @future_period = set.grading_periods.create!(
          title: "Future Period",
          start_date: 2.months.from_now(@now),
          end_date: 4.months.from_now(@now)
        )
      end

      context "ascending" do
        it "sorts by the current grading period totals if no selected grading period is in user preferences" 


        it "sorts by the current grading period totals if a grading period ID of 'null' is in user preferences" 


        it "sorts by the selected grading period totals if a selected grading period is in user preferences" 


        context 'when pg_collkey is installed' do
          before do
            skip 'requires pg_collkey installed SD-2747' unless has_pg_collkey
          end

          it "sorts by 'All Grading Periods' if a grading period ID of '0' is in user preferences" 

        end

        context 'when pg_collkey is not installed' do
          before do
            skip 'requires no pg_collkey installed SD-2747' if has_pg_collkey
          end

          it "sorts by 'All Grading Periods' if a grading period ID of '0' is in user preferences" 

        end
      end

      context "descending" do
        before(:once) do
          @teacher.preferences[:gradebook_settings][@course.id][:sort_rows_by_direction] = "descending"
        end

        it "sorts by the current grading period totals if no selected grading period is in user preferences" 


        it "sorts by the current grading period totals if a grading period ID of 'null' is in user preferences" 


        it "sorts by the selected grading period totals if a selected grading period is in user preferences" 


        context 'when pg_collkey is installed' do
          before do
            skip 'requires pg_collkey installed SD-2747' unless has_pg_collkey
          end

          it "sorts by 'All Grading Periods' if a grading period ID of '0' is in user preferences" 

        end

        context 'when pg_collkey is not installed' do
          before do
            skip 'requires no pg_collkey installed SD-2747' if has_pg_collkey
          end

          it "sorts by 'All Grading Periods' if a grading period ID of '0' is in user preferences" 

        end
      end
    end
  end
end

