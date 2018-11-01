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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

describe SearchHelper do
  
  include SearchHelper

  context "load_all_contexts" do
    it "should return requested permissions" 


    it "only loads the section and its course when given a section context" 


    it "only loads the group and its course when given a group context" 


    it "loads the section even with section-restricted teacher privileges" 


    it "doesn't load the section for observers" 


    describe "sharding" do
      specs_require_sharding

      before do
        @current_user = @shard1.activate{ user_factory(active_all: true) }
        @shard2.activate{ course_with_teacher(:account => Account.create!, :user => @current_user, :active_all => true) }
      end

      it "should include courses from shards other than the user's native shard" 


      it "should include sections from shards other than the user's native shard" 

    end
  end
end

