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

describe SIS::CSV::ChangeSisIdImporter do

  before {account_model}

  it 'should change values of sis ids' 


  it 'should give errors and warnings' 


  it 'should allow removing user.integration_ids' 


  it 'should allow changing integration_ids' 


  it 'should change both SIS ID and integration ID' 


  it 'should change both SIS ID and integration ID if only one is passed in' 


  it 'should throw an error when you pass in mismatched SIS ID and integration ID' 


  describe 'group categories' do
    let!(:gc) {group_category(context: @account, sis_source_id: 'GC1')}

    it 'should change the sis id for a group category' 


    it 'should not error if other rows have an integration_id' 


    it 'should cleanly handle error if integration_id is given' 

  end
end

