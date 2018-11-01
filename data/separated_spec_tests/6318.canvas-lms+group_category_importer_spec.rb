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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

describe SIS::CSV::GroupCategoryImporter do

  before(:once) do
    account_model
    process_csv_data_cleanly(
      "account_id,parent_account_id,name,status",
      "A001,,TestAccount,active"
    )
  end

  it "should skip bad content" 


  it "should ensure group_category_id is unique" 


  it "should create group categories" 


  it "should allow moving group categories" 


  it "should fail model validations" 


  it "should create in a course." 


  it "should not allow moving a group category with groups" 


  it "should delete and restore group categories" 


  it "should not fail on refactored importer" 


  it 'should create rollback data' 


end

