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
#

require File.expand_path(File.dirname(__FILE__) + '/helpers/manage_groups_common')
require 'thread'

describe "manage groups" do
  include_context "in-process server selenium tests"
  include ManageGroupsCommon

  before(:each) do
    course_with_teacher_logged_in
  end

  context "2.0" do
    describe "group category creation" do
      it "should auto-split students into groups" 

    end

    it "should allow a teacher to create a group set, a group, and add a user" 


    it "should allow a teacher to drag and drop a student among groups" 


    it "should support student-organized groups" 


    it "should allow a teacher to reassign a student with an accessible modal dialog" 


    it "should give a teacher the option to assign unassigned students to groups" 

  end

  it "should let students create groups and invite other users" 

end

