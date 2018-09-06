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

require File.expand_path(File.dirname(__FILE__) + '/helpers/rubrics_common')

describe "teacher shared rubric specs" do
  include_context "in-process server selenium tests"
  include RubricsCommon

  let(:rubric_url) { "/courses/#{@course.id}/rubrics" }
  let(:who_to_login) { 'teacher' }

  before(:each) do
    resize_screen_to_normal
    course_with_teacher_logged_in
  end

  it "should delete a rubric" 


  it "should edit a rubric" 


  it "should allow fractional points" 


  it "should round to 2 decimal places" 


  it "should round to an integer when splitting" 


  it "should pick the lower value when splitting without room for an integer" 

end

describe "course rubrics" do
  include_context "in-process server selenium tests"
  include RubricsCommon

  context "as a teacher" do

    before(:each) do
      course_with_teacher_logged_in
    end

    it "should ignore outcome rubric lines when calculating total" 


    it "should not display the edit form more than once" 


    it "should import a rubric outcome row" 


    it "should not allow editing a criterion row linked to an outcome" 


    it "should not show 'use for grading' as an option" 


  end

  it "should display free-form comments to the student" 


  it "should highlight a criterion level if score is 0" 


  it "should not highlight a criterion level if score is nil" 

end

