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

require 'spec_helper'

describe DataFixup::PopulateScoresAndMetadataForAssignmentGroupsAndTeacherView do

  before(:once) do
    @active_student_enrollment = course_with_student(active_all: true)
    @active_student = @student

    group = Factories::GradingPeriodGroupHelper.new.create_for_account(@course.root_account)
    group.enrollment_terms << @course.enrollment_term
    period_helper = Factories::GradingPeriodHelper.new
    @first_period = period_helper.create_presets_for_group(group, :past).first
    @first_period.save!
    @second_period = period_helper.create_presets_for_group(group, :current).first
    @second_period.save!


    @concluded_student_enrollment = student_in_course(course: @course, active_all: true)
    @concluded_student = @student

    @assignment_group_one = @course.assignment_groups.create!(:name => "some group")
    @assignment1 = @course.assignments.create!(
      title: "Some Assignment",
      points_possible: 10,
      assignment_group: @assignment_group_one,
      due_at: 3.months.ago
    )
    Timecop.freeze(4.months.ago) do
      @assignment1.grade_student(@active_student, grade: "5", grader: @teacher)
      @assignment1.grade_student(@concluded_student, grade: "5", grader: @teacher)
    end

    # conclude the dude
    @concluded_student_enrollment.conclude

    ScoreMetadata.joins(:score).where(scores: { enrollment: @concluded_student_enrollment }).delete_all
    Score.where(enrollment: @concluded_student_enrollment).where.not(assignment_group_id: nil).delete_all
    Score.where(enrollment: @concluded_student_enrollment).preload(:enrollment).update(unposted_current_score: nil, unposted_final_score: nil)

    @assignment_group_two = @course.assignment_groups.create!(:name => "some other group")
    @assignment2 = @course.assignments.create!(
      :title => "Some Assignment2",
      :points_possible => 10,
      :assignment_group => @assignment_group_two,
      due_at: 2.days.from_now
    )
    @assignment2.grade_student(@active_student, grade: "5", grader: @teacher)
  end

  it 'updates unposted score for concluded students for the course score' 


  it 'updates unposted score for concluded students for the grading period scores' 


  it 'does not update unposted score for concluded enrollments if it exists' 


  it 'creates score metadata for concluded students for the course score' 


  it 'creates score metadata for concluded students for the grading period scores' 


  it 'creates assignment groups scores and metadata for concluded students' 


  it 'does not update the posted course scores for concluded students' 


  it 'does not update the posted grading period scores for concluded students' 


  it 'calls the grade calculator for active students in active courses' 


  it 'handles concluded courses' 

end

