# coding: utf-8
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
#

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper.rb')

describe UserListV2 do

  before(:each) do
    @account = Account.default
    @account.settings = { :open_registration => true }
    @account.save!
  end

  it "should complain about invalid input" 


  it "should not fail with unicode names" 


  it "should find by SMS number" 


  it "should find duplicates by SMS number" 


  it "should include in duplicates if there is 1 active CC and 1 unconfirmed" 


  it "should not find users from untrusted accounts" 


  it "doesn't find site admins if you're not a site admin" 


  it "should find users from trusted accounts" 


  it "should show duplicates for two results from the current account and the trusted account" 


  context 'when searching by sis id' do
    it "should raise an error without can_read_sis" 


    it "should show duplicates for two results from the current account and the trusted account" 

  end

  it "should show duplicates if there is a conflict of unique_ids from not-this-account" 


  it "should find a user with multiple not-this-account pseudonyms" 


  it "should not find a user from a different account by SMS" 


  context "sharding" do
    specs_require_sharding

    it "should find a user from a trusted account in a different shard" 


    it "should not get confused when dealing with cross-shard duplicate results that actually point to the same user" 


    it "finds a user whose home shard is not the target shard" 


    context "global lookups" do
      before do
        @shard1.activate do
          @account1 = Account.create!
          @user1 = user_with_pseudonym(:name => 'JT', :username => 'jt@instructure.com', :active_all => true, :account => @account1)
        end
        @shard2.activate do
          @account2 = Account.create!
          @user2 = user_with_pseudonym(:name => 'JT', :username => 'jt@instructure.com', :active_all => true, :account => @account2)
        end

        allow(Account.default).to receive(:trusted_account_ids).and_return([Account.site_admin.id, @account1.id, @account2.id])
        allow(GlobalLookups).to receive(:enabled?).and_return(true)
      end

      it "should look on every shard if there aren't that many shards to look on" 


      it "should use the global lookups to restrict searched shard if there are enough shards to look on" 

    end
  end
end


