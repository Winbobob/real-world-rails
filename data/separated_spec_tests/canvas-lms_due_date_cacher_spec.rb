#
# Copyright (C) 2013 - present Instructure, Inc.
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

describe DueDateCacher do
  before(:once) do
    course_with_student(:active_all => true)
    assignment_model(:course => @course)
  end

  describe ".recompute" do
    before do
      @instance = double('instance', :recompute => nil)
    end

    it "wraps assignment in an array" 


    it "delegates to an instance" 


    it "queues a delayed job in an assignment-specific singleton in production" 


    it "calls recompute with the value of update_grades if it is set to true" 


    it "calls recompute with the value of update_grades if it is set to false" 

  end

  describe ".recompute_course" do
    before do
      @assignments = [@assignment]
      @assignments << assignment_model(:course => @course)
      @instance = double('instance', :recompute => nil)
    end

    it "passes along the whole array" 


    it "defaults to all assignments in the context" 


    it "delegates to an instance" 


    it "calls recompute with the value of update_grades if it is set to true" 


    it "calls recompute with the value of update_grades if it is set to false" 


    it "queues a delayed job in a singleton in production if assignments.nil" 


    it "queues a delayed job without a singleton if assignments is passed" 


    it "does not queue a delayed job when passed run_immediately: true" 


    it "calls the recompute method when passed run_immediately: true" 


    it "operates on a course id" 

  end

  describe ".recompute_users_for_course" do
    let!(:assignment_1) { @assignment }
    let(:assignment_2) { assignment_model(course: @course) }
    let(:assignments) { [assignment_1, assignment_2] }

    let!(:student_1) { @student }
    let(:student_2) { student_in_course(course: @course) }
    let(:student_ids) { [student_1.id, student_2.id] }
    let(:instance) { instance_double("DueDateCacher", recompute: nil) }

    it "delegates to an instance" 


    it "passes along the whole user array" 


    it "calls recompute with the value of update_grades if it is set to true" 


    it "calls recompute with the value of update_grades if it is set to false" 


    it "passes assignments if it has any specified" 


    it "handles being called with a course id" 


    it "queues a delayed job in a singleton if given no assignments and no singleton option" 


    it "queues a delayed job in a singleton if given no assignments and a singleton option" 

  end

  describe "#recompute" do
    subject(:cacher) { DueDateCacher.new(@course, [@assignment]) }

    let(:submission) { submission_model(assignment: @assignment, user: first_student) }
    let(:first_student) { @student }
    let(:second_student) do
      student_in_course(active_all: true)
      @student
    end

    describe "anonymous_id" do
      context 'given no existing submission' do
        before do
          submission.delete
          cacher.recompute
        end

        it 'creates a submission with an anoymous_id' 

      end

      context 'given an existing submission with an anoymous_id' do
        it 'does not change anonymous_ids' 

      end

      context 'given an existing submission without an anonymous_id' do
        before do
          submission.update_attribute(:anonymous_id, nil)
        end

        it 'sets anonymous_id for an existing submission' 

      end
    end

    describe "cached_due_date" do
      before do
        Submission.update_all(cached_due_date: nil)
      end

      context 'without existing submissions' do
        it "should create submissions for enrollments that are not overridden" 


        it "should delete submissions for enrollments that are deleted" 


        it "should create submissions for enrollments that are overridden" 


        it "should not create submissions for enrollments that are not assigned" 


        it "does not create submissions for concluded enrollments" 

      end

      it "should not create another submission for enrollments that have a submission" 


      it "should not create another submission for enrollments that have a submission, even with an overridden" 


      it "should delete submissions for enrollments that are no longer assigned" 


      it "does not delete submissions for concluded enrollments" 


      it "should restore submissions for enrollments that are assigned again" 


      context "no overrides" do
        it "should set the cached_due_date to the assignment due_at" 


        it "should set the cached_due_date to nil if the assignment has no due_at" 


        it "does not update submissions for students with concluded enrollments" 

      end

      context "one applicable override" do
        before do
          assignment_override_model(
            :assignment => @assignment,
            :set => @course.default_section)
        end

        it "should prefer override's due_at over assignment's due_at" 


        it "should prefer override's due_at over assignment's nil" 


        it "should prefer override's nil over assignment's due_at" 


        it "should not apply override if it doesn't override due_at" 


        it "does not update submissions for students with concluded enrollments" 

      end

      context "adhoc override" do
        before do
          @student1 = @student
          @student2 = user_factory
          @course.enroll_student(@student2, :enrollment_state => 'active')

          assignment_override_model(
            :assignment => @assignment,
            :due_at => @assignment.due_at + 1.day)
          @override.assignment_override_students.create!(:user => @student2)

          @submission1 = submission_model(:assignment => @assignment, :user => @student1)
          @submission2 = submission_model(:assignment => @assignment, :user => @student2)
          Submission.update_all(:cached_due_date => nil)
        end

        it "should apply to students in the adhoc set" 


        it "should not apply to students not in the adhoc set" 


        it "does not update submissions for students with concluded enrollments" 

      end

      context "section override" do
        before do
          @student1 = @student
          @student2 = user_factory

          add_section('second section')
          @course.enroll_student(@student2, :enrollment_state => 'active', :section => @course_section)

          assignment_override_model(
            :assignment => @assignment,
            :due_at => @assignment.due_at + 1.day,
            :set => @course_section)

          @submission1 = submission_model(:assignment => @assignment, :user => @student1)
          @submission2 = submission_model(:assignment => @assignment, :user => @student2)
          Submission.update_all(:cached_due_date => nil)

          cacher.recompute
        end

        it "should apply to students in that section" 


        it "should not apply to students in other sections" 


        it "should not apply to non-active enrollments in that section" 

      end

      context "group override" do
        before do
          @student1 = @student
          @student2 = user_factory
          @course.enroll_student(@student2, :enrollment_state => 'active')

          @assignment.group_category = group_category
          @assignment.save!

          group_with_user(
            :group_context => @course,
            :group_category => @assignment.group_category,
            :user => @student2,
            :active_all => true)

          assignment_override_model(
            :assignment => @assignment,
            :due_at => @assignment.due_at + 1.day,
            :set => @group)

          @submission1 = submission_model(:assignment => @assignment, :user => @student1)
          @submission2 = submission_model(:assignment => @assignment, :user => @student2)
          Submission.update_all(:cached_due_date => nil)
        end

        it "should apply to students in that group" 


        it "should not apply to students not in the group" 


        it "should not apply to non-active memberships in that group" 


        it "does not update submissions for students with concluded enrollments" 

      end

      context "multiple overrides" do
        before do
          add_section('second section')
          multiple_student_enrollment(@student, @course_section)

          @override1 = assignment_override_model(
            :assignment => @assignment,
            :due_at => @assignment.due_at + 1.day,
            :set => @course.default_section)

          @override2 = assignment_override_model(
            :assignment => @assignment,
            :due_at => @assignment.due_at + 1.day,
            :set => @course_section)
        end

        it "should prefer first override's due_at if latest" 


        it "should prefer second override's due_at if latest" 


        it "should be nil if first override's nil" 


        it "should be nil if second override's nil" 

      end

      context "multiple submissions with selective overrides" do
        before do
          @student1 = @student
          @student2 = user_factory
          @student3 = user_factory

          add_section('second section')
          @course.enroll_student(@student2, :enrollment_state => 'active', :section => @course_section)
          @course.enroll_student(@student3, :enrollment_state => 'active')
          multiple_student_enrollment(@student3, @course_section)

          @override1 = assignment_override_model(
            :assignment => @assignment,
            :due_at => @assignment.due_at + 2.days,
            :set => @course.default_section)

          @override2 = assignment_override_model(
            :assignment => @assignment,
            :due_at => @assignment.due_at + 2.days,
            :set => @course_section)

          @submission1 = submission_model(:assignment => @assignment, :user => @student1)
          @submission2 = submission_model(:assignment => @assignment, :user => @student2)
          @submission3 = submission_model(:assignment => @assignment, :user => @student3)
          Submission.update_all(:cached_due_date => nil)
        end

        it "should use first override where second doesn't apply" 


        it "should use second override where the first doesn't apply" 


        it "should use the best override where both apply" 

      end

      context "multiple assignments, only one overridden" do
        before do
          @assignment1 = @assignment
          @assignment2 = assignment_model(:course => @course)

          assignment_override_model(
            :assignment => @assignment1,
            :due_at => @assignment1.due_at + 1.day)
          @override.assignment_override_students.create!(:user => @student)

          @submission1 = submission_model(:assignment => @assignment1, :user => @student)
          @submission2 = submission_model(:assignment => @assignment2, :user => @student)
          Submission.update_all(:cached_due_date => nil)

          DueDateCacher.new(@course, [@assignment1, @assignment2]).recompute
        end

        it "should apply to submission on the overridden assignment" 


        it "should not apply to apply to submission on the other assignment" 

      end

      it "kicks off a LatePolicyApplicator job on completion when called with a single assignment" 


      it "does not kick off a LatePolicyApplicator job when called with multiple assignments" 


      it "runs the GradeCalculator inline when update_grades is true" 


      it "runs the GradeCalculator inline with student ids when update_grades is true and students are given" 


      it "does not run the GradeCalculator inline when update_grades is false" 


      it "does not run the GradeCalculator inline when update_grades is not specified" 


      context "when called for specific users" do
        before(:once) do
          @student_1 = @student
          @student_2, @student_3, @student_4 = n_students_in_course(3, course: @course)
          # The n_students_in_course helper creates the enrollments in a
          # way that appear to skip callbacks
          cacher.recompute
        end

        it "leaves other users submissions alone on enrollment destroy" 


        it "adds submissions for a single user added to a course" 


        it "adds submissions for multiple users" 

      end
    end
  end
end

