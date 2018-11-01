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

describe SIS::CSV::ImportRefactored do

  before { account_model }

  it "should error files with unknown headers" 


  it "should error files with invalid UTF-8" 


  it "should error files with invalid CSV headers " 


  it "should error files with invalid CSV" 


  it "should error files with invalid CSV way down" 


  it "should work for a mass import" 


  it 'should support sis stickiness overriding' 


  it 'should allow turning on stickiness' 


  it 'should allow turning off stickiness' 


  it "should not invalidly break up UTF-8 characters" 


  it 'should not fail on mac zip files' 


  describe "parallel imports" do
    it 'should retry an importer once' 


    it 'should only run an importer once if successful' 

  end
end

