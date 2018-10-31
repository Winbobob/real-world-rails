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

describe RubricAssessmentsController do
  describe "POST 'create'" do
    it "should require authorization" 

    it "should assign variables" 


    it "should not pass invalid ids through to the database" 

  end

  describe "PUT 'update'" do
    it "should require authorization" 

    it "should assign variables" 

  end

  describe "POST 'remind'" do
    before do
      course_with_teacher(:active_all => true)
      rubric_association_model(:user => @user, :context => @course)
      assessor = User.create!
      @course.enroll_student(assessor)
      assessor_asset = @rubric_association.association_object.find_or_create_submission(assessor)
      user_asset = @rubric_association.association_object.find_or_create_submission(assessor)
      @assessment_request = @rubric_association.assessment_requests.create!(user: @user, asset: user_asset, assessor: assessor, assessor_asset: assessor_asset)
    end

    it "should require authorization" 

    it "should send reminder" 

  end

  describe "DELETE 'destroy'" do
    it "should require authorization" 

    it "should delete the assessment" 

  end

  describe "Assignment assessments" do
    it "should follow: actions from two teachers should only create one assessment" 


    it "should follow: multiple peer reviews for the same submission should work fine" 


    it "should follow: multiple peer reviews for the same submission should work fine, even with a teacher assessment in play" 


    it "should not allow assessing fellow students for a submission" 

  end
end

def setup_course_assessment
  course_with_teacher_logged_in(:active_all => true)
  @student1 = factory_with_protected_attributes(User, :name => "student 1", :workflow_state => "registered")
  @student2 = factory_with_protected_attributes(User, :name => "student 2", :workflow_state => "registered")
  @student3 = factory_with_protected_attributes(User, :name => "student 3", :workflow_state => "registered")
  @teacher2 = factory_with_protected_attributes(User, :name => "teacher 2", :workflow_state => "registered")
  @course.enroll_student(@student1).accept!
  @course.enroll_student(@student2).accept!
  @course.enroll_student(@student3).accept!
  @course.enroll_teacher(@teacher2).accept!
  @assignment = @course.assignments.create!(:title => "Some Assignment")
  rubric_assessment_model(:user => @user, :context => @course, :association_object => @assignment, :purpose => 'grading')
  student1_asset = @assignment.find_or_create_submission(@student1)
  student2_asset = @assignment.find_or_create_submission(@student2)
  student3_asset = @assignment.find_or_create_submission(@student3)
  @rubric_association.assessment_requests.create!(user: @student1, asset: student1_asset, assessor: @student2, assessor_asset: student2_asset)
  @rubric_association.assessment_requests.create!(user: @student1, asset: student1_asset, assessor: @student3, assessor_asset: student3_asset)
end

