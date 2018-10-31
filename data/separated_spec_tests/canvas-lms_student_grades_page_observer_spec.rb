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

require_relative '../../helpers/gradebook_common'

describe "gradebook" do
  include_context "in-process server selenium tests"
  include GradebookCommon

  context "as an observer" do
    before(:each) do
      user_with_pseudonym
      course_with_observer user: @user, active_all: true
      @course.observers=[@observer]
      assignment_setup_defaults
      assignment_setup
      @all_students.each {|s| s.linked_observers=[@observer]}

      user_session(@teacher)
    end

    it "should allow observer to see grade totals" 

  end
end

