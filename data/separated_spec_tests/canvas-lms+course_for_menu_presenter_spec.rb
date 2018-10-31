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
  let_once(:user) { user_model }
  let(:dashboard_card_tabs) { UsersController::DASHBOARD_CARD_TABS }

  let_once(:presenter) do
    CourseForMenuPresenter.new(course, user, nil, nil, {tabs: dashboard_card_tabs})
  end

  describe '#to_h' do
    it 'returns hash of info about course' 


    it 'shouldnt include tab links to unenrolled users' 


    it 'should show all the tab links to a teacher' 


    it 'should only show the tabs a student has access to to students' 


    it 'returns the course nickname if one is set' 


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

