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

describe "acts_as_list" do
  describe "#update_order" do
    it "should cast id input" 

  end

  describe "#insert_at" do
    before :each do
      course_factory
      @module_1 = @course.context_modules.create!(:name => "another module")
      @module_2 = @course.context_modules.create!(:name => "another module")
      @module_3 = @course.context_modules.create!(:name => "another module")

      @modules = [@module_1, @module_2, @module_3]
    end

    it "should insert in the position correctly" 

  end

  describe "#fix_position_conflicts" do
    it "should order null positions last" 


    it "should break ties by object id" 


    it "should consolidate gaps" 

  end

  describe "base scope" do
    it "scopes by the base class rather then the STI class" 

  end
end

