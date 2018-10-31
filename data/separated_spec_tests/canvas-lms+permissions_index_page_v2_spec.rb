#
# Copyright (C) 2018 - present Instructure, Inc.
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

require_relative '../common'
require_relative './pages/permissions_page'

describe "permissions index" do
  include_context "in-process server selenium tests"
  def create_role_override(permission_name, role, account, opts)
    RoleOverride.create!(:permission => permission_name, :enabled => opts[:enabled],
      :locked => opts[:locked], :context => account, :applies_to_self => true, :applies_to_descendants => true,
      :role_id => role.id, :context_type => 'Account')
  end

  def student_role
    Role.get_built_in_role('StudentEnrollment')
  end

  def ta_role
    Role.get_built_in_role('TaEnrollment')
  end

  describe "editing role info" do
    before :each do
      @account = Account.default
      account_admin_user
      user_session(@admin)
      @custom_student_role = custom_student_role("A Kitty")
      PermissionsIndex.visit(@account)
    end

    it "updates the role to the new name after editing" 


    it "updates the permission to the correct selection" 

  end

  describe "Add Role" do
    before :each do
      @account = Account.default
      account_admin_user
      user_session(@admin)
      PermissionsIndex.visit(@account)
    end

    it "opens the edit tray when you click an edit icon" 


    it "focuses on newly created role when you close out all the things" 

  end

  describe "permissions table" do
    before :once do
      @account = Account.default
      @admin = User.create!(:name => "Some User", :short_name => "User")
      @admin.accept_terms
      @admin.register!
      @admin_role = Role.get_built_in_role('AccountAdmin')
      @account.account_users.create!(:user => @admin, :role => @admin_role)
    end

    before :each do
      user_session(@admin)
    end

    it "permissions enables on grid" 


    it "permissions disables on grid" 


    it "permissions enables and locks on grid" 


    it "permissions disables and locks on grid" 


    it "permissions default on grid works" 


    it "locked permission cannot be edited by subaccount" 

  end

  context "in the permissions tray" do
    before :each do
      @account = Account.default
      admin_logged_in
      @role = custom_teacher_role('test role', account: @account)

      @permission_name = 'manage_students'
      PermissionsIndex.visit(@account)
    end

    it "updates a permission when changed in the tray" 

  end

  context "main controls" do
    before(:each) do
      @account = Account.default
      account_admin_user
      user_session(@admin)
      PermissionsIndex.visit(Account.default)
    end
    it "filter based on role" 


    it "search by permission name works correctly" 

  end
end

