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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'nokogiri'

describe "enrollment_date_restrictions" do
  before do
    Account.default.tap{|a| a.settings[:restrict_student_future_view] = {:value => true}}.save!
  end

  it "should not list inactive enrollments in the course list" 


  it "should not show deleted enrollments in past enrollments when course is completed" 


  it "should not show date inactive/completed courses in grades" 


  it "should not included date-inactive courses when searching for pertinent contexts" 

end

