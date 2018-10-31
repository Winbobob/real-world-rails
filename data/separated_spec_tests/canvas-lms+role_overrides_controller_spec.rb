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

describe RoleOverridesController do
  before :each do
    @account = account_model(:parent_account => Account.default)
    account_admin_user(:account => @account)
    user_session(@admin)
  end

  describe "add_role" do
    it "adds the role type to the account" 


    it "requires a role type" 


    it "fails when given an existing role type" 

  end

  it "should deactivate a role" 


  describe "create" do
    before :each do
      @role_name = 'NewRole'
      @permission = 'read_reports'
      @role = @account.roles.build(:name => @role_name)
      @role.base_role_type = Role::DEFAULT_ACCOUNT_TYPE
      @role.workflow_state = 'active'
      @role.save!
    end

    def post_with_settings(settings={})
      post 'create', params: {:account_id => @account.id, :account_roles => 1, :permissions => { @permission => { @role.id => settings } }}
    end

    describe "override already exists" do
      before :each do
        @existing_override = @account.role_overrides.build(
          :permission => @permission,
          :role => @role)
        @existing_override.enabled = true
        @existing_override.locked = false
        @existing_override.save!
        @initial_count = @account.role_overrides.size
      end

      it "should update an existing override if override has a value" 


      it "should update an existing override if override is nil but locked is truthy" 


      it "only updates unchecked" 


      it "only updates enabled" 


      it "should delete an existing override if override is nil and locked is not truthy" 

    end

    describe "no override yet" do
      before :each do
        @initial_count = @account.role_overrides.size
      end

      it "should not create an override if override is nil and locked is not truthy" 


      it "should create the override if override has a value" 


      it "should create the override if override is nil but locked is truthy" 


      it "sets override as false when override is unchecked" 


      it "sets the override to locked when specifiying locked" 

    end
  end

  describe "check_account_permission" do
    let(:json) { json_parse(response.body) }

    describe "manage_catalog permission" do
      context "when catalog is enabled" do
        before do
          a = Account.default
          a.settings[:catalog_enabled] = true
          a.save!
        end

        context "for an admin" do
          it "is true" 

        end

        context "for a non-admin" do
          it "is false" 

        end
      end

      context "when catalog is not enabled" do
        context "for an admin" do
          it "is false" 

        end
      end
    end

    describe "other permissions" do
      it "returns 400 with an error message" 

    end

    describe "GET index" do
      it "loads new bundle for new permissions flag" 

    end
  end
end

