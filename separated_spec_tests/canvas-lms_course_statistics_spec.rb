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

require File.expand_path(File.dirname(__FILE__) + '/common')

describe "course statistics" do
  include_context "in-process server selenium tests"

  before (:each) do
    course_with_teacher_logged_in
    @student1 = student_in_course(:active_all => true, :name => "Sheldon Cooper").user
    @student2 = student_in_course(:active_all => true, :name => "Leonard Hofstadter").user
    @student3 = student_in_course(:active_all => true, :name => "Howard Wolowitz").user
  end

  it "should show most recent logged in users" 

end

