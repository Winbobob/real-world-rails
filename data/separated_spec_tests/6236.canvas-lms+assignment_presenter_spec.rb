#
# Copyright (C) 2018 - present Instructure, Inc.
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
require_relative '../spec_helper'

describe AssignmentPresenter do
  describe '#can_view_speed_grader_link?' do
    before :once do
      # A student is used here because students do not have any special
      # permissions, so we can test that it is these specific permissions that
      # work.
      @course = Course.create!
      @student = User.create!
      @ta = User.create!
      @course.enroll_student(@student, enrollment_state: 'active')
      @course.enroll_ta(@ta, enrollment_state: 'active')
      @assignment = @course.assignments.create!(moderated_grading: false)
      @assignment_presenter = AssignmentPresenter.new(@assignment)
    end

    it 'returns true if user can manage or view all grades' 


    it 'returns false when the user cannot view or managed grades' 


    it 'returns true if concluded course but user can read as admin' 

  end
end

