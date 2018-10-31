#
# Copyright (C) 2017 - present Instructure, Inc.
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

describe DataFixup::BackfillNulls do
  before(:once) do
    @account1 = Account.create!(show_section_name_as_course_name: nil, allow_sis_import: nil)
    @account2 = Account.create!(show_section_name_as_course_name: true)
  end

  it "updates nil values to false for passed fields" 


  it "updates nil values to true for passed values if default value is true" 


  it "does not update non-nil values to false for passed fields" 


  it "does not update nil values to false for fields that were not passed" 

end

