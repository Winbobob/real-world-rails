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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "sections/show.html.erb" do
  describe "sis_source_id edit box" do
    before do
      course_with_teacher(:active_all => true)
      @section = @course.course_sections.first
      @section.sis_source_id = "section_sissy_id"
      assign(:context, @course)
      assign(:section, @section)
      assign(:enrollments_count, 1)
      assign(:student_enrollments_count, 1)
      assign(:pending_enrollments_count, 1)
      assign(:completed_enrollments_count, 1)
      assign(:permission_classes, 'manage-permissions')
    end

    it "should not show to teacher" 


    it "should show to sis admin" 


    it "should not show to non-sis admin" 

  end
end

