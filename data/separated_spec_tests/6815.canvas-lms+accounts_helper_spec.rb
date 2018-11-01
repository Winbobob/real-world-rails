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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AccountsHelper do
  include AccountsHelper
  let_once(:account) { Account.create! }
  let(:subaccount) { account.sub_accounts.create! }

  describe 'turnitin_originality_options' do
    context 'with subaccount' do
      it 'contains the expected options' 

    end

    context 'with root account' do
      it 'contains the expected options' 

    end
  end
end
