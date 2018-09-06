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
require File.expand_path(File.dirname(__FILE__) + '/../../../lib/data_fixup/fix_invalid_pseudonym_account_ids')

describe DataFixup::FixInvalidPseudonymAccountIds do

  subject do
    DataFixup::FixInvalidPseudonymAccountIds
  end

  it "should merge users with the same unique id and destroy the invalid pseudonym" 


  it "should move valid pseudonyms to the root_account" 


end

