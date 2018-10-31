#
# Copyright (C) 2014 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

shared_examples_for "a differentiable_object" do
  before do
    teacher_in_course(active_all: true, course: differentiable.context)
  end
  describe "differentiated_assignments_applies?" do
    context "only_visible_to_overrides is true" do
      it "returns true" 

    end
    context "only_visible_to_overrides is false" do
      it "returns false" 

    end
  end

  describe "visible_to_user?" do
    context "student" do
      before {student_in_course(:course => @course)}
      it "with a visibility it should be true" 

      it "without a visibility should be false" 

    end
    context "observer" do
      before do
        @course_section = @course.course_sections.create
        @student1, @student2, @student3 = create_users(3, return_type: :record)
        @course.enroll_student(@student2, :enrollment_state => 'active')
        @section = @course.course_sections.create!(name: "test section")
        @section2 = @course.course_sections.create!(name: "second test section")
        student_in_section(@section, user: @student1)
        create_section_override_for_assignment(differentiable, {course_section: @section})
        @course.reload
        @observer = User.create(name: "observer")
      end
      context "observing only a section (with or without an override)" do
        before do
          @observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment', :section => @section2, :enrollment_state => 'active')
        end
        it "should be visible" 

      end

      context "observing a student with visibility" do
        before do
          @observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment', :section => @section2, :enrollment_state => 'active')
          @observer_enrollment.update_attribute(:associated_user_id, @student1.id)
        end
        it "should be visible" 

      end

      context "observing a student without visibility" do
        before do
          @observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment', :section => @section2, :enrollment_state => 'active')
          @observer_enrollment.update_attribute(:associated_user_id, @student2.id)
        end
        it "should not be visible" 

      end

      context "observing two students, one with visibility" do
        before do
          @observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment', :section => @section2, :enrollment_state => 'active', :associated_user_id => @student1.id)
          @course.enroll_user(@observer, "ObserverEnrollment", {:allow_multiple_enrollments => true, :associated_user_id => @student2.id})
        end
        it "should be visible" 

      end

      context "observing two students, neither with visibility" do
        before do
          @observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment', :section => @section2, :enrollment_state => 'active', :associated_user_id => @student3.id)
          @course.enroll_user(@observer, "ObserverEnrollment", {:allow_multiple_enrollments => true, :associated_user_id => @student2.id})
        end
        it "should not be visible" 

      end
    end
    context "teacher" do
      it "should be visible" 

    end
  end

  describe "filter" do
    def call_filter
      block = lambda { |collection, users| return :filtered}
      DifferentiableAssignment.filter(:not_filtered, @user, @course, {}, &block)
    end
    it "should filter for students" 

    context "observer" do
      before do
        @observer = User.create(name: "observer")
        @observer_enrollment = @course.enroll_user(@observer, 'ObserverEnrollment', :section => @section2, :enrollment_state => 'active')
      end
      it "should not filter when no observed students" 

      it "should filter with observed students" 

    end
    it "should not filter for the teacher" 

    it "should not filter if no user" 

    it "should not filter if user not in course" 

  end
end

describe Assignment do
  include_examples "a differentiable_object"

  let(:differentiable) { assignment_model(:due_at => 5.days.ago, :only_visible_to_overrides => true) }
  let(:differentiable_view) { AssignmentStudentVisibility }
end

describe Quizzes::Quiz do
  include_examples "a differentiable_object"

  let(:differentiable) { quiz_model(:due_at => 5.days.ago, :only_visible_to_overrides => true) }
  let(:differentiable_view) { Quizzes::QuizStudentVisibility }
end

