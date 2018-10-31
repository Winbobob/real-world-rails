#
# Copyright (C) 2015 - present Instructure, Inc.
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

require 'spec_helper'
require 'db/migrate/20151006222126_fix_groups_with_duplicate_wiki_and_uuid'

describe 'FixGroupsWithDuplicateWikiAndUuid' do

  before do
    FixGroupsWithDuplicateWikiAndUuid.new.down
  end

  it "properly resets groups with duplicate data" 


  it "sets a uuid for groups without one" 

end

