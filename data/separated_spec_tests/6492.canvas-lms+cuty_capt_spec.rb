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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe CutyCapt do
  before(:each) do 
    CutyCapt.config = nil
  end

  context "configuration" do
    it "should correctly look up parameters specified by string keys in the config" 

  end

  context "url validation" do
    it "should check for an http scheme" 


    it "should check for blacklisted domains" 


    it "should check for blacklisted ip blocks" 


    it "should check that the url resolves to something" 

  end

  context "execution" do
    it "should time out cuty processes" 

  end
end

