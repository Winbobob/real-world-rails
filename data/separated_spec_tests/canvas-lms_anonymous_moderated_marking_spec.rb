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

require_relative '../../spec_helper.rb'

describe 'anonymous moderated marking' do
  let(:root_account) { account_model }
  let(:course) { course_factory(account: root_account, active_all: true) }
  let(:anonymous_grading_feature) { Feature.definitions['anonymous_marking'] }

  describe 'anonymous grading flag' do
    context 'when the base AMM flag is not enabled' do
      it 'is not allowed on the account level' 


      it 'is not visible on the account level' 


      it 'is not allowed on the course level' 


      it 'is not visible on the course level' 

    end

    context 'when the base AMM flag is enabled' do
      before(:each) do
        root_account.enable_feature!(:anonymous_moderated_marking)
      end

      it 'is visible on the account level' 


      it 'is visible on the course level' 


      it 'is allowed on the course level if allowed on the account level' 


      it 'is enabled on the course level if enabled on the account level' 

    end
  end
end

