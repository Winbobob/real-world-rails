#
# Copyright (C) 2011 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')
require_relative '../../sharding_spec_helper'

describe "Admins API", type: :request do
  before :once do
    @admin = account_admin_user
    user_with_pseudonym(:user => @admin)
  end

  describe "create" do
    before :once do
      @new_user = user_factory(:name => 'new guy')
      @admin.account.root_account.pseudonyms.create!(unique_id: 'user', user: @new_user)
      @user = @admin
    end

    it "should flag the user as an admin for the account" 


    it "should default the role of the admin association to AccountAdmin" 


    it "should respect the provided role, if any" 


    it "should be able to find a role by name (though deprecated)" 


    it "should return json of the new admin association" 


    it "should not send a notification email if passed a 0 'send_confirmation' value" 


    it "should not send a notification email if passed a false 'send_confirmation' value" 


    it "should send a notification email if 'send_confirmation' isn't set" 


    it "should not allow you to add a random user" 

  end

  describe "destroy" do
    before :once do
      @account = Account.default
      @new_user = user_with_managed_pseudonym(:name => 'bad admin', :account => @account, :sis_user_id => 'badmin')
      @user = @admin
      @base_path = "/api/v1/accounts/#{@account.id}/admins/"
      @path = @base_path + "#{@new_user.id}"
      @path_opts = { :controller => "admins", :action => "destroy", :format => "json",
                     :account_id => @account.to_param, :user_id => @new_user.to_param }
    end

    context "unauthorized caller" do
      before do
        @au = @account.account_users.create! :user => @new_user
        @user = user_factory :account => @account
      end

      it "should 401" 

    end

    context "with AccountAdmin membership" do
      before :once do
        @au = @account.account_users.create! :user => @new_user
      end

      it "should remove AccountAdmin membership" 


      it "should remove AccountAdmin membership explicitly" 


      it "should 404 if the user doesn't exist" 


      it "should work by sis user id" 

    end

    context "with custom membership" do
      before :once do
        @role = custom_account_role('CustomAdmin', account: @account)
        @au = @account.account_users.create!(user: @new_user, role: @role)
      end

      it "should remove a custom membership from a user" 


      it "should still work using the deprecated role param" 


      it "should 404 if the membership type doesn't exist" 


      it "should 404 if the membership type isn't specified" 

    end

    context "with multiple memberships" do
      before :once do
        @role = custom_account_role('CustomAdmin', :account => @account)
        @au1 = @account.account_users.create! :user => @new_user
        @au2 = @account.account_users.create! :user => @new_user, :role => @role
      end

      it "should leave the AccountAdmin membership alone when deleting the custom membership" 


      it "should leave the custom membership alone when deleting the AccountAdmin membership implicitly" 


      it "should leave the custom membership alone when deleting the AccountAdmin membership explicitly" 

    end
  end

  describe "index" do
    before :once do
      @account = Account.default
      @path = "/api/v1/accounts/#{@account.id}/admins"
      @path_opts = { :controller => "admins", :action => "index", :format => "json", :account_id => @account.to_param }
    end

    context "unauthorized caller" do
      before do
        @user = user_factory :account => @account
      end

      it "should 401" 

    end

    context "with account users" do
      before :once do
        @roles = {}
        2.times do |x|
          u = user_factory(:name => "User #{x}", :account => @account)
          @roles[x] = custom_account_role("MT #{x}", :account => @account)
          @account.account_users.create!(:user => u, :role => @roles[x])
        end
        @another_admin = @user
        @user = @admin
      end

      it "should return the correct format" 


      it "should scope the results to the user_id if given" 


      it "should scope the results to the array of user_ids if given" 


      context 'sharding' do
        specs_require_sharding

        it "should work with cross-shard users" 

      end

      it "should paginate" 

    end
  end
end

