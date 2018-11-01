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
#

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

describe SIS::CSV::AdminImporter do

  before do
    account_model
    sis = @account.sis_batches.create
    @sub_account = Account.create(parent_account: @account)
    @sub_account.sis_source_id = 'sub1'
    @sub_account.sis_batch_id = sis.id
    @sub_account.save!
  end

  it 'should skip bad content' 


  it 'should add and remove admins' 


  it 'should add admins from other root_account' 


  it 'should add admins by role_id' 


  it 'should create rollback data' 

end

