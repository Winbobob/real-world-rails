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

require File.expand_path(File.dirname(__FILE__) + "/common")

describe "jquery" do
  include_context "in-process server selenium tests"


  # jquery keeps breaking attr() ... see http://bugs.jquery.com/ticket/10278
  # should be fixed in 1.7 (or 1.6.5?)
  it "should return the correct value for attr" 


  it "should handle $.attr(method, post|delete|put|get) by adding a hidden input" 

end

