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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "/gradebooks/grade_summary" do
  it "should render" 


  it "should not show totals if configured so" 


  it "should not show 'what if' if not the student" 


  it "should know the types of media comments" 


  it "should show a disabled message for grade stats for the test student" 


  describe "submission details link" do
    before(:each) do
      course_with_teacher
      student_in_course
      @assignment = @course.assignments.create!(title: 'Moderated Assignment', anonymous_grading: true, muted: true)
      @assignment.submit_homework @student, :submission_type => "online_text_entry", :body => "o hai"
      @submission_details_url = context_url(@course, :context_assignment_submission_url, @assignment, @student.id)
    end

    it "should be shown for submitting student if assignment is anonymous grading and muted" 


    it "should be hidden for non-submitting student if assignment is anonymous grading and muted" 


    it "should be hidden for teacher if assignment is anonymous grading and muted" 


    it "should be hidden for admin if assignment is anonymous grading and muted" 


    it "should be shown for site admin if assignment is anonymous grading and muted" 

  end
end

