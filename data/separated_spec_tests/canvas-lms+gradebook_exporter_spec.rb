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

require_relative '../spec_helper'
require 'csv'

describe GradebookExporter do
  before(:once) do
    @course = course_model(grading_standard_id: 0)
    course_with_teacher(course: @course, active_all: true)
  end

  describe "#to_csv" do
    def exporter(opts = {})
      GradebookExporter.new(@course, @teacher, opts)
    end

    describe "custom columns" do
      before(:once) do
        first_column = @course.custom_gradebook_columns.create! title: "Custom Column 1"
        second_column = @course.custom_gradebook_columns.create! title: "Custom Column 2"
        third_column = @course.custom_gradebook_columns.create!({title: "Custom Column 3", workflow_state: "hidden"})

        student1_enrollment = student_in_course(course: @course, active_all: true).user
        student2_enrollment = student_in_course(course: @course, active_all: true).user

        first_column.custom_gradebook_column_data.create!({content: 'Row1 Custom Column 1', user_id: student1_enrollment.id})
        first_column.custom_gradebook_column_data.create!({content: 'Row2 Custom Column 1', user_id: student2_enrollment.id})
        second_column.custom_gradebook_column_data.create!({content: 'Row1 Custom Column 2', user_id: student1_enrollment.id})
        second_column.custom_gradebook_column_data.create!({content: 'Row2 Custom Column 2', user_id: student2_enrollment.id})
        third_column.custom_gradebook_column_data.create!({content: 'Row1 Custom Column 3', user_id: student1_enrollment.id})
        third_column.custom_gradebook_column_data.create!({content: 'Row2 Custom Column 3', user_id: student2_enrollment.id})
      end

      it "have the correct custom column data in proper order" 

    end

    describe "default output with blank course" do
      before(:once) do
        @course.custom_gradebook_columns.create! title: "Custom Column 1"
        @course.custom_gradebook_columns.create! title: "Custom Column 2"
        @course.custom_gradebook_columns.create!({title: "Custom Column 3", workflow_state: "hidden"})
      end

      subject(:csv) { exporter.to_csv }

      it { is_expected.to be_a String }

      it "is a csv with two rows" 


      it "is a csv with rows of equal length" 


      it "has headers in a default order" 


      describe "byte-order mark" do
        it "is included when the user has it enabled" 


        it "is excluded when the user has it disabled" 

      end

      context "when muted assignments are present" do
        before(:each) do
          @course.assignments.create!(muted: true, points_possible: 10)
          @exporter_options = {}
        end

        let(:csv) do
          unparsed_csv = GradebookExporter.new(@course, @teacher, @exporter_options).to_csv
          CSV.parse(unparsed_csv)
        end

        let(:header_row_length) { csv.first.length }
        let(:muted_row_length) { csv.second.length }

        it "the length of the 'muted' row matches the length of the header row" 


        it "the length of the 'muted' row matches the length of the header row when include_sis_id is true" 


        it "the length of the 'muted' row matches the length of the header row when include_sis_id " \
          "is true and the account is a trust account" do
          expect(@course.root_account).to receive(:trust_exists?).and_return(true)
          @exporter_options[:include_sis_id] = true
          expect(header_row_length).to eq muted_row_length
        end
      end
    end

    context "internationalization" do
      it "can use localized column separators" 


      it "can automatically determine the column separator to use when asked to autodetect" 


      it "uses comma as the column separator when not asked to autodetect" 


      it "prepends byte order mark with UTF-8 encoding when the user enables it" 


      it "omits byte order mark with US-ASCII encoding even when the user enables it" 


      describe "grades" do
        before :each do
          @assignment = @course.assignments.create!(title: 'Verkefni 1', points_possible: 10, grading_type: 'gpa_scale')
          student = student_in_course(course: @course, active_all: true).user
          @assignment.grade_student(student, grader: @teacher, score: 7.5)
        end

        context 'when forcing the field separator to be a semicolon' do
          before :each do
            @teacher.enable_feature!(:use_semi_colon_field_separators_in_gradebook_exports)
            @csv = exporter(locale: :is).to_csv
            @icsv = CSV.parse(@csv, col_sep: ";", headers: true)
          end

          it "localizes numbers" 


          it "does not localize grading scheme grades for assignments" 


          it "does not localize grading scheme grades for the total" 

        end

        context 'when not forcing the field separator to be a semicolon' do
          before :each do
            @teacher.disable_feature!(:use_semi_colon_field_separators_in_gradebook_exports)
          end

          context 'when autodetecting field separator to use' do
            before :each do
              @teacher.enable_feature!(:autodetect_field_separators_for_gradebook_exports)
              @csv = exporter(locale: :is).to_csv
              @icsv = CSV.parse(@csv, col_sep: ";", headers: true)
            end

            it "localizes numbers" 


            it "does not localize grading scheme grades for assignments" 


            it "does not localize grading scheme grades for the total" 

          end

          context 'when not autodetecting field separator to use' do
            before :each do
              @teacher.disable_feature!(:autodetect_field_separators_for_gradebook_exports)
              @csv = exporter(locale: :is).to_csv
              @icsv = CSV.parse(@csv, col_sep: ",", headers: true)
            end

            it "localizes numbers" 


            it "does not localize grading scheme grades for assignments" 


            it "does not localize grading scheme grades for the total" 

          end
        end
      end
    end

    context "a course has assignments with due dates" do
      before(:each) do
        @no_due_date_assignment = @course.assignments.create! title: "no due date",
          points_possible: 10

        @past_assignment = @course.assignments.create! due_at: 5.weeks.ago,
          title: "past",
          points_possible: 10

        @current_assignment = @course.assignments.create! due_at: 1.weeks.from_now,
          title: "current",
          points_possible: 10

        @future_assignment = @course.assignments.create! due_at: 8.weeks.from_now,
          title: "future",
          points_possible: 10

        student_in_course active_all: true

        @no_due_date_assignment.grade_student @student, grade: 1, grader: @teacher
        @past_assignment.grade_student @student, grade: 2, grader: @teacher
        @current_assignment.grade_student @student, grade: 3, grader: @teacher
        @future_assignment.grade_student @student, grade: 4, grader: @teacher

        @group = Factories::GradingPeriodGroupHelper.new.legacy_create_for_course(@course)

        @first_period = @group.grading_periods.create!(
          start_date: 6.weeks.ago, end_date: 3.weeks.ago, title: "past grading period"
        )
        @last_period = @group.grading_periods.create!(
          start_date: 3.weeks.ago, end_date: 3.weeks.from_now, title: "present day, present time"
        )
      end

      describe "with grading periods" do
        describe "assignments in the selected grading period are exported" do
          before(:each) do
            @csv = exporter(grading_period_id: @last_period.id).to_csv
            @rows = CSV.parse(@csv, headers: true)
            @headers = @rows.headers
          end

          it "exports selected grading period's assignments" 


          it "exports assignments without due dates if exporting last grading period" 


          it "does not export assignments without due date" 


          it "does not export assignments in other grading periods" 


          it "does not export future assignments" 


          it "exports the entire gradebook when grading_period_id is 0" 

        end
      end
    end

    describe "with inactive students" do
      before :once do
        assmt = @course.assignments.create!(title: "assmt", points_possible: 10)

        student1_enrollment = student_in_course(course: @course, active_all: true)
        @student1 = student1_enrollment.user
        student2_enrollment = student_in_course(course: @course, active_all: true)
        @student2 = student2_enrollment.user

        assmt.grade_student(@student1, grade: 1, grader: @teacher)
        assmt.grade_student(@student2, grade: 2, grader: @teacher)

        student1_enrollment.deactivate
        student2_enrollment.deactivate

        @teacher.preferences[:gradebook_settings] = {
          @course.id => {
            'show_inactive_enrollments' => 'true',
            'show_concluded_enrollments' => 'false'
          }
        }
        @teacher.save!
      end

      it "includes inactive students" 


      it "includes grades for inactive students if show inactive enrollments" 


      it "does not include inactive students if show inactive enrollments is set to false" 

    end

    it 'handles gracefully any assignments with nil position' 

  end

  context "a course with a student whose name starts with an equals sign" do
    let(:student) do
      user = user_factory(name: "=sum(A)", active_user: true)
      course_with_student(course: @course, user: user)
      user
    end
    let(:course) { @course }
    let(:assignment) { @course.assignments.create!(title: "Assignment", points_possible: 4) }

    it "quotes the name that starts with an equals so it's not considered a formula" 

  end

  context "when a course has unposted assignments" do
    let(:posted_assignment) { @course.assignments.create!(title: "Posted", points_possible: 10) }
    let(:unposted_assignment) { @course.assignments.create!(title: "Unposted", points_possible: 10, muted: true) }

    before(:each) do
      @course.assignments.create!(title: "Ungraded", points_possible: 10)

      student_in_course active_all: true

      posted_assignment.grade_student @student, grade: 9, grader: @teacher
      unposted_assignment.grade_student @student, grade: 3, grader: @teacher
    end

    it "calculates assignment group scores correctly" 


    it "calculates totals correctly" 

  end

  context "with weighted assignment groups" do
    before(:once) do
      student_in_course active_all: true
      @course.update_attributes(group_weighting_scheme: 'percent')

      first_group = @course.assignment_groups.create!(name: "First Group", group_weight: 0.5)
      @course.assignment_groups.create!(name: "Second Group", group_weight: 0.5)

      @assignment = @course.assignments.create!(title: 'Assignment 1', points_possible: 10,
                                                grading_type: 'gpa_scale', assignment_group: first_group)
      @assignment.grade_student(@student, grade: 8, grader: @teacher)
    end

    it "emits rows of equal length when no assignments are muted" 


    it "emits rows of equal length when an assignment is muted" 

  end

  describe "#show_overall_totals" do
    let(:enrollment) { @student.enrollments.find_by(course: @course) }

    before(:once) do
      student_in_course(course: @course, active_all: true)
    end

    # this test is needed to guarantee the stubbing in the following specs on
    # enrollment reflects reality and isn't a false positive.
    it 'includes the student enrollment in the course' 


    context "when a grading period is present" do
      let(:group) { Factories::GradingPeriodGroupHelper.new.legacy_create_for_course(@course) }
      let(:grading_period) do
        group.grading_periods.create!(
          start_date: 1.week.ago, end_date: 1.week.from_now, title: "test period"
        )
      end
      let(:exporter) { GradebookExporter.new(@course, @teacher, { grading_period_id: grading_period.id }) }

      before(:each) do
        allow(exporter).to receive(:enrollments_for_csv).and_return([enrollment])
      end

      it 'includes the computed current score for the grading period' 


      it 'includes the unposted current score for the grading period' 


      it 'includes the computed final score for the grading period' 


      it 'includes the unposted final score for the grading period' 


      it 'includes the computed current grade for the grading period' 


      it 'includes the unposted current grade for the grading period' 


      it 'includes the computed final grade for the grading period' 


      it 'includes the unposted final grade for the grading period' 

    end

    context "when no grading period is supplied" do
      let(:exporter) { GradebookExporter.new(@course, @teacher) }

      before(:each) do
        allow(exporter).to receive(:enrollments_for_csv).and_return([enrollment])
      end

      it 'includes the computed current score for the course' 


      it 'includes the unposted current score for the course' 


      it 'includes the computed final score for the course' 


      it 'includes the unposted final score for the course' 


      it 'includes the computed current grade for the course' 


      it 'includes the unposted current grade for the course' 


      it 'includes the computed final grade for the course' 


      it 'includes the unposted final grade for the course' 

    end
  end
end

