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

require_relative '../../spec_helper'

describe Canvadocs::Session do
  include Canvadocs::Session
  def submissions
    [@submission]
  end
  describe ".observing?" do
    it "should return true if the user is acting as an observer" 

    it "should return false if the user is not an observer" 

  end

  describe ".managing?" do
    it "should return true if the user has TeacherEnrollment" 

    it "should return false if the user does not have a TeacherEnrollment" 

  end

  describe ".canvadoc_permissions_for_user" do
    before(:once) do
      @course = course_factory(active_all: true)
      @student = user_factory(active_all: true, active_state: 'active')
      @assignment = @course.assignments.create!(title: 'assignment 1', name: 'assignment 1', submission_types: 'online_upload')
      @submission = submission_model(user: @student, course: @course, assignment: @assignment)
    end

    it "should return read permissions for observers" 


    it "should return readwrite permissions for owner" 


    it "should return readwritemanage permissions for teacher" 

  end
end

