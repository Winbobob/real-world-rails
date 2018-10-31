#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../common')
require File.expand_path(File.dirname(__FILE__) + '/../helpers/users_common')
require File.expand_path(File.dirname(__FILE__) + '/../helpers/basic/users_specs')

describe "admin courses tab" do
  include_context "in-process server selenium tests"
  include UsersCommon

  context "add user basic" do
    describe "shared users specs" do
      let(:account) { Account.default }
      let(:url) { "/accounts/#{account.id}/users" }
      let(:opts) { {:name => 'student'} }
      include_examples "users basic tests"
    end
  end

  context "add users" do

    before(:each) do
      course_with_admin_logged_in
      get "/accounts/#{Account.default.id}/users"
    end

    it "should add an new user with a sortable name" 


    it "should add an new user with a short name" 


    it "should add a new user with confirmation disabled" 


    it "should search for a user and should go to it" 


    it "should search for a bogus user" 

  end
end

