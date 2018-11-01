#
# Copyright (C) 2016 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe AddressBook do
  describe "for" do
    it "returns an instance of AddressBook::MessageableUser for 'messageable_user' strategy" 


    it "returns an instance of AddressBook::Empty for 'empty' strategy" 


    it "defaults to an instance of AddressBook::MessageableUser for invalid strategy" 


    it "returns an address book for the specified sender" 


    it "returns the same address book instance for multiple copies of the sender" 


    it "resets the address book instance between requests" 

  end

  describe "partition_recipients" do
    it "splits individuals from contexts" 

  end

  describe "available" do
    it "restricts to the supplied users" 


    it "restricts to available users" 

  end
end

