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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

describe PseudonymsController do

  describe "password changing" do
    before :once do
      user_with_pseudonym
    end

    context "unconfirmed communication channel" do
      it "should change the password if authorized" 

    end

    context "active communication channel" do
      it "should change the password if authorized" 

    end

    it "should not change the password if unauthorized" 


    it "accepts a non-expired password-change token" 


    it "rejects an expired password-change token" 


    describe "forgot password" do
      before :once do
        Notification.create(:name => 'Forgot Password')
        user_factory
      end

      it "should send password-change email for a registered user" 


      it "should use case insensitive match for CommunicationChannel email" 

      it "should send password-change email case insensitively" 


      it "should not send password-change email for users with pseudonyms in a different account" 

    end

    it "should render confirm change password view for registered user's email" 


    it "should not render confirm change password view for non-email channels" 


    it "should render confirm change password view for unregistered user" 


    it "should not render confirm change password view if token is expired" 

  end

  describe "destroy" do
    before :once do
      user_with_pseudonym(:active_all => true)
    end

    before :each do
      user_session(@user, @pseudonym)
    end

    it "should not destroy if for the wrong user" 


    it "should not destroy if it's the last active pseudonym" 


    it "should not destroy if it's SIS and the user doesn't have permission" 


    it "should destroy if for the current user with more than one pseudonym" 


    it "should destroy if authorized to delete pseudonyms" 

  end

  describe "create" do
    # these specs only test the non-api version of the calls
    context "with site admin permissions" do
      before :each do
        user_with_pseudonym(:active_all => true)
        Account.site_admin.account_users.create!(user: @user)
        user_session(@user, @pseudonym)
      end

      it "should use the account id from params" 

    end

    context 'with default admin permissions' do
      before :once do
        user_with_pseudonym(:active_all => true)
        Account.default.account_users.create!(user: @user)
      end

      before :each do
        user_session(@user, @pseudonym)
      end

      it 'lets user create pseudonym for self' 


      it 'will not allow default admin to create pseudonym for site admin' 


      it 'will not allow default admin to create pseudonym in another account' 


      it 'will not allow default admin to create pseudonym in site admin' 


      it 'will not allow admin to add pseudonyms to unrelated users' 

    end

    context "without site admin permissions" do
      before :once do
        @account = Account.create!
        user_with_pseudonym(:active_all => true, :account => @account)
        @account.account_users.create!(user: @user)
      end

      before :each do
        allow(LoadAccount).to receive(:default_domain_root_account).and_return(@account)
        user_session(@user, @pseudonym)
      end

      it "should use the domain_root_account" 


      it "should allow explicit account id in params as long as they have permission" 


      it "should raise permission error if no permission on explict account id in params" 

    end

    it "should not allow user to add their own pseudonym to an arbitrary account" 

  end

  describe "update" do
    it "should change a password if authorized" 


    it "should not change a password if not authorized" 


    it "should be able to change SIS with only :manage_sis permissions" 


    it "should be able to change unique_id with permission" 


    it "should not be able to change unique_id without permission" 


    it "should fail partial update when permission isn't given to make username change" 


    it "should allow password change for current user" 


    it "should return an error message when trying to duplicate a sis id" 

  end

  context "sharding" do
    specs_require_sharding

    before :once do
      user_with_pseudonym(:active_all => 1)
      @admin = @user
      @admin_pseudonym = @pseudonym
      Account.site_admin.account_users.create!(user: @admin)

      @shard1.activate do
        @account = Account.create!
        user_with_pseudonym(:active_all => 1, :account => @account)
      end
    end

    before :each do
      user_session(@admin, @admin_pseudonym)
    end

    describe 'index' do
      it "should list pseudonyms from all shards" 

    end

    describe 'create' do
      it "should create a new pseudonym for a user in a different shard (cross-shard)" 


      it "should create a new pseudonym for a user in a different shard (same-shard)" 

    end

    describe 'update' do
      it "should update a pseudonym on another shard" 


      it "should update a pseudonym on the requesting shard for a user from another shard" 

    end

    describe 'destroy' do
      it "should destroy a pseudonym on another shard" 


      it "should destroy a pseudonym on the requesting shard for a user from another shard" 

    end
  end
end

