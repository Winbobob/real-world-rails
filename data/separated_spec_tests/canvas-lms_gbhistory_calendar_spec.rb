#
# Copyright (C) 2017 - present Instructure, Inc.
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

require_relative '../pages/gradebook_history_page'
require_relative '../setup/gradebook_setup'

describe "Gradebook History Page" do
  include_context "in-process server selenium tests"
  include GradebookSetup
  include CustomScreenActions
  include CustomSeleniumActions

  before(:once) do
    # create course with teacher
    course_factory(active_all: true)
  end

  before(:each) do
    user_session(@teacher)
    GradeBookHistory.visit(@course)
  end

  context "has filter button disabled" do

    it "and shows error message on entering backward dates", test_id: 3308866, priority: "1" 


    it "on entering invalid dates", test_id: 3308867, priority: "1" 

  end
end

