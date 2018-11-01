#
# Copyright (C) 2012 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe TabsController, type: :request do
  describe 'index' do
    it "should require read permissions on the context" 


    it 'should list navigation tabs for a course' 


    it 'should include external tools' 


    it "includes collaboration tab if configured" 


    it "includes webconferences tab if configured" 


    it 'should list navigation tabs for a group' 


    it "doesn't include hidden tabs for student" 


    describe "teacher in a course" do
      before :once do
        course_with_teacher(active_all: true)
        @tab_ids = [0, 1, 3, 8, 5, 6, 14, 2, 11, 15, 4, 10, 13]
        @tab_lookup = {}.with_indifferent_access
        @course.tabs_available(@teacher, :api => true).each do |t|
          t = t.with_indifferent_access
          @tab_lookup[t['css_class']] = t['id']
        end
      end


      it 'should have the correct position' 


      it 'should correctly label navigation items as unused' 


      it 'should label hidden items correctly' 


      it 'correctly sets visibility' 


      it 'sorts tabs correctly' 


    end

  end

  describe 'update' do
    it 'sets the people tab to hidden' 


    it 'only unhides one tab and not all when first updating' 


    it 'allows updating new tabs not in the configuration yet' 


    it 'changes the position of the people tab to 2' 


    it "won't allow you to hide the home tab" 


    it "won't allow you to move a tab to the first position" 


    it "won't allow you to move a tab to an invalid position" 


    it "doesn't allow a student to modify a tab" 


  end

end

