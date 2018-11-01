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

describe SubAccountsController do
  describe "POST 'create'" do
    it "should create sub-accounts with the right root account when inside the root account" 


    it "should create sub-accounts with the right root account when inside a sub account" 


    it 'should report errors encountered while creating a sub account' 

  end

  describe "GET 'index'" do
    it "should preload all necessary information" 


    it "should include a root account when searching if requested" 

  end

  describe "DELETE 'destroy'" do
    before(:once) do
      @root_account = Account.create(name: 'new account')
      account_admin_user(active_all: true, account: @root_account)
      @sub_account = @root_account.sub_accounts.create!
    end

    it "should delete a sub-account" 


    it "should delete a sub-account that contains a deleted course" 


    it "should not delete a sub-account that contains a course" 


    it "should not delete a sub-account that contains a sub-account that contains a course" 


    it "should not delete a sub-account that contains a sub-account" 

  end
end

