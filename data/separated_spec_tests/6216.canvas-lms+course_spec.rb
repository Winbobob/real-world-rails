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

describe "course" do

  # normally this would be a controller test, but there is a some code in the
  # views that i need to not explode
  it "should not require authorization for public courses" 


  it "should load syllabus on public course with no user logged in" 


  it "should show the migration-in-progress notice" 


  it "should not show the migration-in-progress notice to students" 


  it "should use nicknames in the course index" 


  it "should not show links to unpublished courses in course index" 


  it "should not show students' nicknames to admins on the student's account profile page" 

end

