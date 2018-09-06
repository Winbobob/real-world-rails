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

require File.expand_path(File.dirname(__FILE__) + "/../spec_helper.rb")

describe GradebookGradingPeriodAssignments do
  before(:once) do
    @example_course = Course.create!
  end

  describe "#to_h" do
    before(:once) do
      @student1 = student_in_course(course: @example_course, active_all: true).user
      @student2 = student_in_course(course: @example_course, active_all: true).user
      @assignment1_in_gp1 = @example_course.assignments.create!(due_at: 3.months.ago)
      @assignment2_in_gp2 = @example_course.assignments.create!(due_at: 1.day.from_now)
      @assignment3_in_gp2 = @example_course.assignments.create!(due_at: 2.days.from_now)
      @assignment4 = @example_course.assignments.create!(due_at: 6.months.from_now)
    end

    let(:hash) { GradebookGradingPeriodAssignments.new(@example_course, {}).to_h }

    context "with grading periods" do
      before(:once) do
        @group = Factories::GradingPeriodGroupHelper.new.create_for_account(@example_course.account)
        @group.enrollment_terms << @example_course.enrollment_term
        @period1, @period2, @period3 = Factories::GradingPeriodHelper.new.create_presets_for_group(
          @group, :past, :current, :future
        )
        [@assignment1_in_gp1, @assignment2_in_gp2, @assignment3_in_gp2, @assignment4].each do |assignment|
          DueDateCacher.recompute(assignment)
        end
      end

      it "includes the grading period ids as keys on the hash" 


      it "lists the related assignment ids as strings for the grading periods" 


      it "includes all assignments due in a given grading period" 


      it "includes assignments with due dates in multiple grading periods" 


      it "excludes assignments due outside of any grading period" 


      it "excludes grading periods without assignments" 


      it "excludes deleted submissions" 


      it "excludes submissions for deleted assignments" 


      it "excludes assignments from other courses" 


      context 'with students that are not active' do
        before(:once) do
          @course = Course.create!
          @student_enrollment = student_in_course(course: @course, active_all: true)
          @assignment = @course.assignments.create!(due_at: @period2.end_date)
          @settings = {}
        end

        let(:hash) { GradebookGradingPeriodAssignments.new(@course, @settings).to_h }


        describe 'concluded students' do
          before(:once) do
            @student_enrollment.conclude
          end

          it 'does not include assignments assigned exclusively to concluded students' 


          it 'ignores deleted enrollments' 


          it 'ignores enrollments in other courses' 


          it 'ignores non-student enrollments' 


          it 'optionally includes assignments assigned exclusively to concluded students' 


          it 'optionally excludes assignments assigned exclusively to concluded students' 

        end

        describe 'deactivated students' do
          before(:once) do
            @student_enrollment.deactivate
          end

          it 'does not include assignments assigned exclusively to deactivated students' 


          it 'ignores deleted enrollments' 


          it 'ignores enrollments in other courses' 


          it 'ignores non-student enrollments' 


          it 'optionally includes assignments assigned exclusively to deactivated students' 


          it 'optionally excludes assignments assigned exclusively to deactivated students' 

        end
      end
    end

    it "returns an empty hash when grading periods are not in use" 

  end

  it "raises an exception if context is not a course" 


  it "raises an exception if context has no id" 

end

