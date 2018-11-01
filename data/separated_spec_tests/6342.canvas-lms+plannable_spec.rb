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

require 'spec_helper'

describe Plannable do
  context 'planner_override_for' do
    before :once do
      course_with_student(active_all: true)
    end

    it "returns a regular assignment's override" 


    it "returns the assignment's associated override" 


    it "returns the assignment's override if the associated object does not have an override" 


    it "prefers the associated object's override if both have an override" 


    it 'should not return deleted overrides' 

  end
end
