#
# Copyright (C) 2015 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "courses/_to_do_list.html.erb" do
  include AssignmentsHelper

  context "as a student" do
    describe "with no assignments" do
      it "shows the new planner to do list anyway" 

    end
  end

  context "as a teacher" do
    describe "assignments to grade" do
      it "shows assignment data" 


      it "shows 999+ when there are more than 999 to grade" 

    end

    describe "assignments to moderate" do
      it "shows assignment data" 


      it "does not show moderate link if user is not final grader" 

    end
  end
end

