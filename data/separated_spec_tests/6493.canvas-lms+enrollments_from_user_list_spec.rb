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

describe EnrollmentsFromUserList do
  before(:each) do
    course_model(:reusable => true)
    @el = UserList.new(list_to_parse)
    account = Account.default
    account.settings = { :open_registration => true }
    account.save!
  end

  context "initialized object" do

    it "should initialize with a course id" 


    it "should process with an user list" 


    it "should process repeat addresses without creating new users" 


    it "should respect the section option when a user is already enrolled in another section" 


  end

  context "EnrollmentsFromUserList.process" do
    it "should be able to process from the class" 


    it "touches only users whose enrollments were updated" 

  end

end


def list_to_parse
  %{david@example.com, "Richards, David" <david_richards@example.com>, David Richards <david_richards_jr@example.com>}
end

def list_to_parse_with_repeats
  %{david@example.com, "Richards, David" <david_richards@example.com>, David Richards <david_richards_jr@example.com>, david_richards_jr@example.com, DAVID@example.com}
end
