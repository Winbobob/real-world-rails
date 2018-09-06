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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe AddressBook::Empty do
  before :each do
    @address_book = AddressBook::Empty.new(user_model)
  end

  describe "known_users" do
    it "returns an empty array" 

  end

  describe "known_user" do
    it "returns nil" 

  end

  describe "common_courses" do
    it "returns an empty hash" 

  end

  describe "common_groups" do
    it "returns an empty hash" 

  end

  describe "known_in_context" do
    it "returns an empty array" 

  end

  describe "count_in_contexts" do
    it "returns empty hash" 

  end

  describe "search_users" do
    it "returns an empty but paginatable collection" 

  end

  describe "sections" do
    it "returns an empty array" 

  end

  describe "groups" do
    it "returns an empty array" 

  end
end

