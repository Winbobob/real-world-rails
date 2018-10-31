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

describe ApiScopeMapperLoader do

  let(:resource) {"users"}

  describe ".load" do

    it "loads the ApiScopeMapper file if present" 


    it "loads the api_scope_mapper_fallback if the file is not present" 


  end

  describe ".api_scope_mapper_fallback" do

    it "creates a ApiScopeMapper Class with a lookup_resource method" 


    it "creates a ApiScopeMapper Class with a name_for_resource method" 


  end
end

