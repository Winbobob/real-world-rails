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

require File.expand_path(File.dirname(__FILE__) + '/common')

describe 'Global Navigation' do
  include_context 'in-process server selenium tests'

  context 'As a Teacher' do
    before do
      course_with_teacher_logged_in
    end

    describe 'Profile Link' do
      it 'should show the profile tray upon clicking' 


      # Profile links are hardcoded, so check that something is appearing for
      # the display_name in the tray header
      it 'should populate the profile tray with the current user display_name' 

    end

    describe 'Courses Link' do
      it 'should show the courses tray upon clicking' 


      it 'should populate the courses tray when using the keyboard to open it' 

    end

    describe 'Groups Link' do
      it 'filters concluded groups and loads additional pages if necessary' 

    end

    describe 'LTI Tools' do
      it 'should show a custom logo/link for LTI tools' 

    end
    describe 'Navigation Expand/Collapse Link' do
      it 'should collapse and expand the navigation when clicked' 

    end
  end
end

