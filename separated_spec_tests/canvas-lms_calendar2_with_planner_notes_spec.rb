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

require File.expand_path(File.dirname(__FILE__) + '/../common')
require File.expand_path(File.dirname(__FILE__) + '/../helpers/calendar2_common')

describe "calendar2" do
  include_context "in-process server selenium tests"
  include Calendar2Common

  before(:once) do
    # or some stuff we need to click is "below the fold"
    make_full_screen

    Account.default.enable_feature!(:student_planner)
    course_with_teacher(active_all: true, new_user: true)
    @student1 = User.create!(name: 'Student 1')
    @course.enroll_student(@student1).accept!
  end

  context "as the student" do
    before :each do
      user_session(@student1)
    end

    it "should show the student calendar todo" 

    it "should create a new student calendar todo" 

    it "should delete a student calendar todo" 

    it "should edit a student calendar todo" 

    it "should show course calendar todo" 

    it "should edit a course calendar todo" 

    it "should move a course calendar todo to the student calendar" 


    context "with student planner disabled" do
      before :each do
        Account.default.disable_feature!(:student_planner)
      end

      it "should not show todo tab" 

    end
  end
end

