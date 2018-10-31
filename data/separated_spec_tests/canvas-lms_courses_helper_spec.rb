#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CoursesHelper do
  include ApplicationHelper
  include AssignmentsHelper
  include CoursesHelper
  include QuizzesHelper

  context "a view with a 'Coming Up' sidebar" do
    before(:once) do
      course_with_teacher(:active_all => true)
      @assignment = factory_with_protected_attributes(@course.assignments,
                                                      assignment_valid_attributes.merge({ :points_possible => 10,
                                                                                          :submission_types => "online_text_entry" }))
      @assignment2 = factory_with_protected_attributes(@course.assignments,
                                                       assignment_valid_attributes.merge({ :points_possible => 10,
                                                       :submission_types => "none" }))
    end

    before(:each) do
      user_session(@user)
    end

    describe "an assignment with no submissions" do
      before(:once) do
        @student_one = factory_with_protected_attributes(User, valid_user_attributes)
        @student_two = factory_with_protected_attributes(User, valid_user_attributes)
        [@student_one, @student_two].each do |student|
          e = @course.enroll_student(student)
          e.invite
          e.accept
        end
        @assignment.reload
      end

      it "should return a no submission tooltip if there are no submissions" 


      it "should return a not submitted tooltip for a student if they have not made a submission" 


      it "should return a nil tooltip for a student if the assignment does not expect a submission" 

    end

    describe "an assignment with submissions" do
      before(:once) do
        @student_one = factory_with_protected_attributes(User, valid_user_attributes)
        @student_two = factory_with_protected_attributes(User, valid_user_attributes)
        [@student_one, @student_two].each do |student|
          e = @course.enroll_student(student)
          e.invite
          e.accept
        end
        @assignment.reload
      end

      it "should return a needs grading tooltip if assignments have been submitted that aren't graded" 


      it "should return the submission's readable_state as the tooltip for a student" 


      it "should return an assignment icon instead of a check icon if show_assignment_type_icon is set" 


      it "should return a no new submissions tooltip if some assignments have been submitted and graded" 


      it "should return an all graded tooltip if all assignments are submitted and graded" 

    end

    def check_icon_data(msg, aria_label, icon, options={})
      base_options = {
        :context => @course,
        :contexts => [@course],
        :current_user => @teacher,
        :recent_event => @assignment,
        :submission => nil
      }.merge(options)
      @icon_explanation, @icon_aria_label, @icon_class = icon_data(base_options)
      expect(@icon_explanation).to eql msg
      expect(@icon_aria_label).to eql aria_label
      expect(@icon_class).to eql icon
    end
  end

  context "readable_grade" do
    it "should return nil if not graded" 


    it "should return a capitalized grade without an assignment" 


    it "should return the score if graded" 


    it "should not raise an error when passing a numeric type but grading_type is not 'points'" 

  end

end

