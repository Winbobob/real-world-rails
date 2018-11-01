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

describe "MessageableUser" do
  describe ".build_select" do
    it "should ignore common_course_column without common_role_column" 


    it "should require common_course_column with common_role_column" 


    it "should combine common_course_column and common_role_column in common_courses" 


    it "should combine multiple (course,role) pairs in common_courses" 


    it "should combine multiple common_group_column values in common_groups" 

  end

  describe ".prepped" do
    def group_scope(scope)
      scope.group_values.join(", ")
    end

    it "should group by id" 


    it "should include column-based common_course_column in group by" 


    it "should include column-based common_group_column in group by" 


    it "should not include literal common_course_column value in group by" 


    it "should not include literal common_group_column value in group by" 


    it "should order by sortable_name before id" 


    it "should ignore case when ordering by sortable_name" 


    it "should order by id as tiebreaker" 


    it "should exclude creation_pending students with strict_checks true" 


    it "should include creation_pending students with strict_checks false" 


    it "should exclude deleted students with include_deleted true but strict_checks true" 


    it "should exclude deleted students with with strict_checks false but include_deleted false" 


    it "should include deleted students with strict_checks false and include_deleted true" 


    it "should default strict_checks to true" 


    it "should default include_delete to false" 

  end

  describe "#common_courses" do
    before do
      user_factory(active_all: true)
    end

    it "should be empty with no common_courses selected" 


    it "should populate from non-null common_courses" 


    describe "sharding" do
      specs_require_sharding

      it "should translate keys to the current shard" 


      it "should not translate a 0 key" 

    end
  end

  describe "#common_groups" do
    before do
      user_factory(active_all: true)
    end

    it "should be empty with no common_groups selected" 


    it "should populate from non-null common_groups with 'Member' roles" 


    describe "sharding" do
      specs_require_sharding

      it "should translate keys to the current shard" 

    end
  end

  describe "#include_common_contexts_from" do
    before do
      user_factory(active_all: true)
    end

    it "should merge disparate ids" 


    it "should stack coinciding ids" 

  end
end

