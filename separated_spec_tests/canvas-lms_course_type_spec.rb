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
#

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../helpers/graphql_type_tester')

describe Types::CourseType do
  let_once(:course) { course_with_student(active_all: true); @course }
  let(:course_type) { GraphQLTypeTester.new(Types::CourseType, course) }

  it "works" 


  describe "assignmentsConnection" do
    let_once(:assignment) {
      course.assignments.create! name: "asdf", workflow_state: "unpublished"
    }

    it "only returns visible assignments" 


    context "grading periods" do
      before(:once) do
        gpg = GradingPeriodGroup.create! title: "asdf",
          root_account: course.root_account
        course.enrollment_term.update_attributes grading_period_group: gpg
        @term1 = gpg.grading_periods.create! title: "past grading period",
        start_date: 2.weeks.ago,
          end_date: 1.weeks.ago
        @term2 = gpg.grading_periods.create! title: "current grading period",
        start_date: 2.days.ago,
          end_date: 2.days.from_now
        @term1_assignment1 = course.assignments.create! name: "asdf",
          due_at: (1.5).weeks.ago
        @term2_assignment1 = course.assignments.create! name: ";lkj",
          due_at: Date.today
      end

      it "only returns assignments for the current grading period" 


      it "returns no assignments when outside of a grading period" 


      it "returns assignments for the requested grading period" 


      it "can still return assignments for all grading periods" 

    end
  end

  describe "sectionsConnection" do
    it "only includes active sections" 

  end

  context "submissionsConnection" do
    before(:once) do
      a1 = course.assignments.create! name: "one", points_possible: 10
      a2 = course.assignments.create! name: "two", points_possible: 10

      @student1 = @student
      student_in_course(active_all: true)
      @student2 = @student

      @student1a1_submission, _ = a1.grade_student(@student1, grade: 1, grader: @teacher)
      @student1a2_submission, _ = a2.grade_student(@student1, grade: 9, grader: @teacher)
      @student2a1_submission, _ = a1.grade_student(@student2, grade: 5, grader: @teacher)

      @student1a1_submission.update_attribute :graded_at, 4.days.ago
      @student1a2_submission.update_attribute :graded_at, 2.days.ago
      @student2a1_submission.update_attribute :graded_at, 3.days.ago
    end

    it "returns submissions for specified students" 


    it "doesn't let students see other student's submissions" 


    context "sorting criteria" do
      it "takes sorting criteria" 


      it "sorts null last" 

    end

    context "filtering" do
      it "allows filtering submissions by their state" 

    end
  end

  describe "usersConnection" do
    before(:once) do
      @student1 = @student
      @student2 = student_in_course(active_all: true).user
      @inactive_user = student_in_course.tap { |enrollment|
        enrollment.invite
      }.user
      @concluded_user = student_in_course.tap { |enrollment|
        enrollment.complete
      }.user
    end

    it "returns all visible users" 


    it "returns only the specified users" 


    it "doesn't return users that aren't visible to you" 


    it "allows filtering by enrollment state" 

  end

  describe "AssignmentGroupConnection" do
    it "returns assignment groups" 

  end

  describe "GroupsConnection" do
    before(:once) do
      course.groups.create! name: "A Group"
    end

    it "returns student groups" 


    it "returns nil for users with no permission" 

  end
end

