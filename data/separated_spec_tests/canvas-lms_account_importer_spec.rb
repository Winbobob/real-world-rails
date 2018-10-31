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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

describe SIS::CSV::AccountImporter do

  before { account_model }

  it 'should skip bad content' 


  it 'should create accounts' 


  it 'should update the hierarchies of existing accounts' 


  it 'should not allow deleting accounts with content' 


  it 'should support sticky fields' 


  it 'should treat parent_account_id as stickyish' 


  it 'should match headers case-insensitively' 


  it 'should not allow the creation of loops in account chains' 


  it 'should update batch id on unchanging accounts' 

end

