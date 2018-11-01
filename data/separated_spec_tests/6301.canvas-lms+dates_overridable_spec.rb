#
# Copyright (C) 2012 - present Instructure, Inc.
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

shared_examples_for "an object whose dates are overridable" do
  # let(:overridable) - an Assignment or Quiz
  # let(:overridable_type) - :assignment or :quiz

  let(:course) { overridable.context }
  let(:override) { assignment_override_model(overridable_type => overridable) }

  describe "#teacher_due_date_for_display" do
    it "returns nil when differentiated with no due dates" 

  end

  describe "overridden_for" do
    before do
      student_in_course(:course => course)
    end

    context "when there are overrides" do
      before do
        override.override_due_at(7.days.from_now)
        override.save!

        override_student = override.assignment_override_students.build
        override_student.user = @student
        override_student.save!
      end

      it "returns a clone of the object with the relevant override(s) applied" 


      it "returns the same object when the user is nil (e.g. a guest)" 

    end

    context "with no overrides" do
      it "returns the original object" 

    end
  end

  describe "assignment overrides_for" do
    before do
      student_in_course(:course => course)
    end

    context "with adhoc" do
      before do
        override.override_due_at(7.days.from_now)
        override.set_type = "ADHOC"
        override.save!

      end

      it "returns adhoc overrides when active students enrolled in adhoc set" 


      it "returns nothing when no active students enrolled in adhoc set" 


      it "returns nothing when active students enrolled in adhoc set removed" 

    end
  end

  describe "override teacher visibility" do
    context "when teacher restricted" do
      before do
        2.times{ course.course_sections.create! }
        @section_invisible = course.active_course_sections[2]
        @section_visible = course.active_course_sections.second

        @student_invisible = student_in_section(@section_invisible)
        @student_visible = student_in_section(@section_visible, user: user_factory)
        @teacher = teacher_in_section(@section_visible, user: user_factory)

        enrollment = @teacher.enrollments.first
        enrollment.limit_privileges_to_course_section = true
        enrollment.save!
      end

      it "returns empty for overrides of student in other section" 


      it "returns not empty for overrides of student in same section" 


      it "returns the correct student for override with students in same and different section" 

    end

    context "when teacher not restricted" do
      before do
        course.course_sections.create!
        course.course_sections.create!
        @section_invisible = course.active_course_sections[2]
        @section_visible = course.active_course_sections.second

        @student_invisible = student_in_section(@section_invisible)
        @student_visible = student_in_section(@section_visible, user: user_factory)
        @teacher = teacher_in_section(@section_visible, user: user_factory)
      end

      it "returns not empty for overrides of student in other section" 


      it "returns not empty for overrides of student in same section" 


      it "returns single override for students in different sections" 

    end
  end

  describe "has_overrides?" do
    subject { overridable.has_overrides? }

    context "when it does" do
      before { override }
      it { is_expected.to be_truthy }
    end

    context "when it does but it's deleted" do
      before { override.destroy }
      it { is_expected.to be_falsey }
    end

    context "when it doesn't" do
      it { is_expected.to be_falsey }
    end

  end

  describe "has_active_overrides?" do
    context "has active overrides" do
      before { override }
      it "returns true" 

    end
    context "when it has deleted overrides" do
      it "returns false" 

    end

  end

  describe "#all_dates_visible_to" do

    before do
      @section2 = course.course_sections.create!(:name => "Summer session")
      override2 = assignment_override_model(overridable_type => overridable)
      override2.set = @section2
      override2.override_due_at(18.days.from_now)
      override2.save!
    end

    context "as a teacher" do
      it "only returns active overrides" 


      it "doesn't duplicate adhoc overrides in list" 

    end

    context "as a student" do
      it "only returns active overrides" 

    end

    context "as an observer with students" do
      before do
        course_with_student({:course => course, :active_all => true})
        course_with_observer({:course => course, :active_all => true})
        course.enroll_user(@observer, "ObserverEnrollment", {:associated_user_id => @student.id})
      end

      it "only returns active overrides for a single student" 


      it "returns all active overrides for 2+ students" 

    end

    context "as an observer without students" do
      before do
        course_with_observer({:course => course, :active_all => true})
        course.enroll_user(@observer, "ObserverEnrollment")
        override.delete
      end

      it "returns a date with DA" 

    end

    it "returns each override represented using its as_hash method" 


    it "includes the overridable as a hash" 

  end

  describe "#dates_hash_visible_to" do

    before :each do
      override.set = course.default_section
      override.override_due_at(7.days.from_now)
      override.save!

      @section2 = course.course_sections.create!(:name => "Summer session")
    end

    it "only returns active overrides" 


    it "includes the original date as a hash" 


    it "not include original dates if all sections are overriden" 


  end

  describe "without_overrides" do
    it "returns an object with no overrides applied" 

  end

  describe "due_date_hash" do
    it "returns the due at, lock_at, unlock_at, all day, and all day fields" 


  end

  describe "observed_student_due_dates" do
    it "returns a list of overridden due date hashes" 

  end

  describe "multiple_due_dates?" do
    before do
      course_with_student(:course => course)
      course.course_sections.create!
      override.set = course.active_course_sections.second
      override.override_due_at(2.days.ago)
      override.save!
    end

    context "when the object has been overridden" do
      context "and it has multiple due dates" do
        it "returns true" 

      end

      context "and it has one due date" do
        it "returns false" 

      end
    end

    context "when the object hasn't been overridden" do
      it "raises an exception because it doesn't have any context" 

    end

    context "when the object has been overridden for a guest" do
      it "returns false" 

    end
  end

  describe "overridden_for?" do
    before do
      course_with_student(:course => course)
    end

    context "when overridden for the user" do
      it "returns true" 

    end

    context "when overridden for a different user" do
      it "returns false" 

    end

    context "when overridden for a nil user" do
      it "returns true" 

    end

    context "when not overridden" do
      it "returns false" 

    end
  end

  describe "differentiated_assignments_applies?" do
    before do
      course_with_student(:course => course)
    end

    it "returns false when there is no assignment" 


    it "returns the value of only_visible_to_overrides on the assignment" 

  end
end

describe Assignment do
  include_examples "an object whose dates are overridable"

  let(:overridable) { assignment_model(:due_at => 5.days.ago) }
  let(:overridable_type) { :assignment }
end

describe Quizzes::Quiz do
  include_examples "an object whose dates are overridable"

  let(:overridable) { quiz_model(:due_at => 5.days.ago) }
  let(:overridable_type) { :quiz }
end

