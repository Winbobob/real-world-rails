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

require File.expand_path(File.dirname(__FILE__) + '/common')

describe "help dialog" do
  include_context "in-process server selenium tests"

  context "no user logged in" do
    it "should work with no logged in user" 


    it "should no longer show a browser warning for IE" 

  end

  context "help as a student" do
    before (:each) do
      course_with_student_logged_in(:active_all => true)
    end

    it "should show the Help dialog when help is clicked and feedback is enabled" 


    it "should show the support url link in global nav correctly" 


    it "should allow sending the teacher a message" 


    # TODO reimplement per CNVS-29608, but make sure we're testing at the right level
    it "should allow submitting a ticket"
  end

  context "help dialog as a teacher" do
    before(:each) do
      course_with_teacher_logged_in(:active_all => true)
    end

    it "should not show the Message teacher button if not a student" 


    it "should show the Help dialog on the speedGrader when help is clicked and feedback is enabled" 

  end

  context "customization link" do
    before :each do
      user_logged_in(:active_all => true)
      Setting.set('show_feedback_link', 'true')
    end

    it "should show the link to root account admins" 


    it "should not show the link to sub account admins" 

  end
end

