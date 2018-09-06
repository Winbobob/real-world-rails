#
# Copyright (C) 2013 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
require 'db/migrate/20130405213030_fix_broken_file_links_in_assignments.rb'

require 'nokogiri'

describe 'DataFixup::FixBrokenFileLinksInAssignments' do
  
  it "should find assignments without verifiers" 

  
  it "should find assignments with verifiers" 

  
  it "should not find assignments with only normal links" 

  
  it "should fix links in assignment descriptions that point to deleted files with a verifier param" 


  it "should find new courses's attachment by old attachment cloned_item_id" 


  it "shouldn't break a discussion assignment" 

end

