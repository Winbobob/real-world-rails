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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SectionTabPresenter do
  let_once(:tab) { Course.default_tabs[0] }
  let_once(:assignments_tab) do
    Course.default_tabs.find do |tab|
      tab[:id] == Course::TAB_ASSIGNMENTS
    end
  end
  let_once(:course) { course_model }
  let_once(:presenter) do
    SectionTabPresenter.new(Course.default_tabs[0], course)
  end

  describe '#initialize' do
    it 'should set tab as an ostruct' 

  end

  describe '#active?' do
    it 'should be true when active_tab is tab css_class' 

  end

  describe '#target?' do
    it 'returns true if the tab has a target attribute' 


    it 'returns false if the tab does not contain a target' 


    it 'returns false if the tab target is nil' 


  end

  describe '#hide?' do
    it 'should return true if tab has element hidden or hidden_unused' 


    it 'should return false if tab does not have element hidden or hidden_unused' 

  end

  describe '#unused?' do
    it 'should return true if tab has element hidden or hidden_unused' 


    it 'should return false if tab does not have element hidden or hidden_unused' 

  end

  describe '#path' do
    it 'should return path associated with course and tab' 


    it 'should return path associated with course and tab when given args as a hash' 

  end

  describe '#path_args' do
    it 'should return tab args if present' 


    it 'should return empty array if tab no_args is present' 


    it 'should return course if neither args nor no_args is present' 

  end

  describe '#to_h' do
    it 'should include icon, path & label' 

  end
end

