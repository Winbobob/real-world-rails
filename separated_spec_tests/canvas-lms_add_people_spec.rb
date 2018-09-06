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

require 'rubygems'
require_relative '../common'

describe "add_people" do
  include_context "in-process server selenium tests"
  let(:enrollee_count){0}

  before(:once) do
    # in the people table, the kyle menu can be off the screen
    # and uninteractable if the window is too small
    make_full_screen
  end

  context "as a teacher" do
    before(:each) do
      course_with_teacher_logged_in
      4.times.with_index { |i| add_section("Section #{i}") }
      user_with_pseudonym(:name => "Foo Foo", :active_user => true, :username => "foo", :account => @account)
      user_with_pseudonym(:name => "Foo Bar", :active_user => true, :username => "bar", :account => @account)

    end

    # this is one giant test because it has to walk through the panels of a
    # modal dialog, and "it" tests throw an exception if they don't include
    # a get(url) call, which would break the flow of the test.
    it "should add a couple users" 


    it "should tell our user when not adding any users to the course" 


    it "should include only manageable roles" 


    # CNVS-34781
    it "should have a working checkbox after cancelling and reopening" 


  end

  context('as an admin') do
    before(:each) do
      course_with_admin_logged_in
    end

    # CNVS-35149
    it "should include select all for missing users" 


    it "should include invite users without names" 

  end
end

