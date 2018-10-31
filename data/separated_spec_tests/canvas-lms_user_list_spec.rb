# coding: utf-8
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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper.rb')

describe UserList do

  before(:each) do
    @account = Account.default
    @account.settings = { :open_registration => true }
    @account.save!
  end

  it "should complain about invalid input" 


  it "should not fail with unicode names" 


  it "should find by SMS number" 


  it "should process a list of emails" 


  it "should process a list of irregular emails" 


  it "should process a list of only emails, without brackets" 


  it "should work with a mixed entry list" 


  it "should work well with a single address" 


  it "should remove duplicates" 


  it "should be case insensitive when finding existing users" 


  it "should be case insensitive when finding duplicates" 


  it "should process login ids, SIS ids, and email addresses" 


  it "should not process login ids if they don't exist" 


  it "pseudonyms should take precedence over emails" 


  it "pseudonyms should take precedence over phone numbers" 


  it "should work with a list of paths" 


  context "closed registration" do
    before(:each) do
      @account.settings = { :open_registration => false }
      @account.save!
    end

    it "should not return non-existing users if open registration is disabled" 


    it "should pick the pseudonym, even if someone else has the CC" 


    it "should complain if multiple people have the CC" 


    it "should not think that multiple pseudonyms for the same user is multiple users" 


    it "should detect duplicates, even from different CCs" 


    it "should choose the active CC if there is 1 active and n unconfirmed" 


    # create the CCs in reverse order to check the logic when we see them in a different order
    it "should choose the active CC if there is 1 active and n unconfirmed, try 2" 


    it "should not find users from untrusted accounts" 


    it "doesn't find site admins if you're not a site admin" 


    it "should find users from trusted accounts" 


    it "should prefer a user from the current account instead of a trusted account" 


    it "should prefer a user from the current account instead of a trusted account (reverse order)" 


    context 'when searching by sis id' do
      it "should prefer a user from the current account instead of a trusted account" 


      it "should prefer a user from the current account instead of a trusted account (reverse order)" 

    end

    it "should not find a user if there is a conflict of unique_ids from not-this-account" 


    it "should find a user with multiple not-this-account pseudonyms" 


    it "should not find a user from a different account by SMS" 

  end

  context "preferred selection" do
    it "should find an existing user if there is only one" 


    it "should create a new user if none exists" 


    it "should create a new user if multiple matching users are found" 


    it "should not create a new user for non-matching non-email" 

  end

  context "user creation" do
    it "should create new users in creation_pending state" 


    it "should create new users even if a user already exists" 


    it "should not create new users for users found by email" 


    it "should default initial_enrollment_type for new users" 

  end

  context "sharding" do
    specs_require_sharding

    it "should find a user from a trusted account in a different shard" 

  end
end

def regular
  %{"Shaw, Ryan" <ryankshaw@gmail.com>, "Last, First" <lastfirst@gmail.com>}
end

def without_brackets
  %{ryankshaw@gmail.com, lastfirst@gmail.com}
end

