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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'nokogiri'

describe "assignments" do
  def multiple_section_submissions
    course_with_student(:active_all => true); @student1 = @student
    @s2enrollment = student_in_course(:active_all => true); @student2 = @user

    @section = @course.course_sections.create!
    @s2enrollment.course_section = @section; @s2enrollment.save!

    @assignment = @course.assignments.create!(:title => "Test 1", :submission_types => "online_upload")

    @submission1 = @assignment.submit_homework(@student1, :submission_type => "online_text_entry", :body => "hi")
    @submission2 = @assignment.submit_homework(@student2, :submission_type => "online_text_entry", :body => "there")
  end

  def create_assignment_section_override(section, due_at)
    override = assignment_override_model(:assignment => @assignment)
    override.set = section
    override.override_due_at(due_at)
    override.save!
  end

  it "should correctly list ungraded and total submissions for teacher" 


  it "should correctly list ungraded and total submissions for ta" 


  it "should show student view student submission as needing grading" 


  describe "due date overrides" do
    include TextHelper

    before do
      course_with_teacher_logged_in(:active_all => true)
      assignment_model(:course => @course, :due_at => 3.days.from_now)
      @assignment.update_attribute :due_at, 2.days.from_now
      @cs1 = @course.default_section
      @cs2 = @course.course_sections.create!
    end

    it "should show 'Everyone' when there are no overrides" 


    it "should show 'Everyone else' when some sections have due date overrides" 


    it "should not show 'Everyone else' when all sections have due date overrides" 

  end
end

describe "download submissions link" do

  before do
    course_with_teacher_logged_in(:active_all => true)
    assignment_model(:course => @course, :submission_types => 'online_url', :title => 'Assignment 1')
    @student = User.create!(:name => 'student1')
    @student.register!
    @student.workflow_state = 'active'
    @student2 = User.create!(:name => 'student2')
    @student2.register
    @student2.workflow_state = 'active'
    @student2.save
    @course.enroll_user(@student, 'StudentEnrollment')
    @course.enroll_user(@student2, 'StudentEnrollment')
    @course.save!
    @student.save!
    @student2.save!
  end

  it "should not show download submissions button with no submissions" 


  it "should not show download submissions button with no submissions from active students" 


  it "should show download submissions button with submission not graded" 


  it "should show download submissions button with a submission graded" 


  it "should show download submissions button with all submissions graded" 


  it "should not show download submissions button to students" 


end

describe "ratio of submissions graded" do

  before do
    course_with_teacher_logged_in(:active_all => true)
    assignment_model(:course => @course, :submission_types => 'online_url', :title => 'Assignment 1')
    @student = User.create!(:name => 'student1')
    @student.register!
    @student.workflow_state = 'active'
    @student2 = User.create!(:name => 'student2')
    @student2.register
    @student2.workflow_state = 'active'
    @student2.save
    @course.enroll_user(@student, 'StudentEnrollment')
    @course.enroll_user(@student2, 'StudentEnrollment')
    @course.save!
    @student.save!
    @student2.save!
  end

  it "should not show ratio of submissions graded with no submissions" 


  it "should show ratio of submissions graded with submission not graded" 


  it "should show ratio of submissions graded with a submission graded" 


  it "should show ratio of submissions graded with all submissions graded" 


  it "should not show ratio of submissions graded to students" 


  describe 'assignment moderation' do
    let(:moderate_button) { Nokogiri::HTML(response.body).at_css('#moderated_grading_button') }

    it 'shows the moderation link for moderated assignments' 


    it 'does not show the moderation link for non-moderated assignments' 

  end
end

