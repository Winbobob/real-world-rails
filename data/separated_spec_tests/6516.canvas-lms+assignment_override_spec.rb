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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')
require File.expand_path(File.dirname(__FILE__) + '/../../../sharding_spec_helper.rb')

describe Api::V1::AssignmentOverride do

  let(:test_class) do
    Class.new do
      include Api::V1::AssignmentOverride
      attr_accessor :current_user
      def session; {} end
    end
  end
  subject { test_class.new }

  describe "#interpret_assignment_override_data" do

    it "works even with nil date fields" 


    context "sharding" do
      specs_require_sharding

      it "works even with global ids for students" 

    end
  end

  describe "interpret_batch_assignment_overrides_data" do
    before(:once) do
      course_with_teacher(active_all: true)
      @a = assignment_model(course: @course, group_category: 'category1')
      @b = assignment_model(course: @course, group_category: 'category2')
      @a1, @a2 = 2.times.map do
        create_section_override_for_assignment @a, course_section: @course.course_sections.create!
      end
      @b1, @b2, @b3 = 2.times.map do
        create_section_override_for_assignment @b, course_section: @course.course_sections.create!
      end
    end

    subject do
      subj = test_class.new
      subj.current_user = @teacher
      subj
    end

    it "should have error if no updates requested" 


    it "should have error if assignments are malformed" 


    it "should fail if list of overrides is malformed" 


    it "should fail if individual overrides are malformed" 


    it "should fail if assignment not found" 


    it "should fail if override not found" 


    it "should succeed if formatted correctly" 

  end

  describe 'overrides retrieved for teacher' do
    before :once do
      course_model
      @override = assignment_override_model
    end

    context 'in restricted course section' do
      before do
        2.times{ @course.course_sections.create! }
        @section_invisible = @course.active_course_sections[2]
        @section_visible = @course.active_course_sections.second

        @student_invisible = student_in_section(@section_invisible)
        @student_visible = student_in_section(@section_visible, user: user_factory)
        @teacher = teacher_in_section(@section_visible, user: user_factory)

        enrollment = @teacher.enrollments.first
        enrollment.limit_privileges_to_course_section = true
        enrollment.save!
      end

      context '#invisble_users_and_overrides_for_user' do
        before do
          @override.set_type = "ADHOC"
          @override_student = @override.assignment_override_students.build
          @override_student.user = @student_visible
          @override_student.save!
        end

        it "returns the invisible_student's id in first param" 


        it "returns the invisible_override in the second param" 

      end
    end

    context 'with no restrictions' do
      before do
        2.times do @course.course_sections.create! end
        @section_invisible = @course.active_course_sections[2]
        @section_visible = @course.active_course_sections.second

        @student_invisible = student_in_section(@section_invisible)
        @student_visible = student_in_section(@section_visible, user: user_factory)
      end

      context '#invisble_users_and_overrides_for_user' do
        before do
          @override.set_type = "ADHOC"
          @override_student = @override.assignment_override_students.build
          @override_student.user = @student_visible
          @override_student.save!
        end

        it "does not return the invisible student's param in first param" 


        it "returns no override ids in the second param" 

      end
    end
  end

  describe '#assignment_overrides_json' do
    before :once do
      course_model
      student_in_course(active_all: true)
      @quiz = quiz_model course: @course
      @override = create_section_override_for_assignment(@quiz)
    end
    subject(:assignment_overrides_json) { test_class.new.assignment_overrides_json([@override], @student) }

    it 'delegates to AssignmentOverride.visible_enrollments_for' 

  end

  describe "perform_batch_update_assignment_overrides" do
    before :once do
      course_with_teacher(active_all: true)
      assignment_model(course: @course)
    end

    it "touches the assignment" 

  end
end

