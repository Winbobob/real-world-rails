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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

describe CourseForMenuPresenter do
  let_once(:course) { course_model }
  let_once(:available_section_tabs) do
    Course.default_tabs.select do |tab|
      [ Course::TAB_ASSIGNMENTS, Course::TAB_HOME ].include?(tab[:id])
    end
  end
  let_once(:presenter) do
    CourseForMenuPresenter.new(
      course, available_section_tabs
    )
  end

  describe '#initialize' do
    it 'should limit available_section_tabs to be those for dashboard' 

  end

  describe '#to_h' do
    it 'returns hash of info about course' 


    it 'should include available_section_tabs as link element of hash' 


    it 'returns the course nickname if one is set' 


    it 'returns false for informStudentsOfOverdueSubmissions if the course is not using New Gradebook' 


    it 'returns true for informStudentsOfOverdueSubmissions if the course is using New Gradebook' 


    context 'with Dashcard Reordering feature enabled' do
      before(:each) do
        @account = Account.default
        @account.enable_feature! :dashcard_reordering
      end

      it 'returns a position if one is set' 


      it 'returns nil when no position is set' 

    end

  end

  describe '#role' do
    specs_require_sharding
    it "should retrieve the correct role for cross-shard enrollments" 

  end
end

