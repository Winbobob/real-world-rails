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

describe "Roles API", type: :request do
  before :once do
    @account = Account.default
    account_admin_user(:account => @account)
    user_with_pseudonym(:user => @admin)
  end

  describe "Roles CRUD" do
    before :once do
      @role_name = 'NewRole'
      @permission = 'read_reports'
      @initial_count = @account.role_overrides.size
    end

    def api_call_with_settings(settings={})
      admin = settings.delete(:admin) || @admin
      account = settings.delete(:account) || @admin.account
      role = settings.delete(:role) || @role_name
      base_role_type = settings.delete(:base_role_type)

      permission = settings.delete(:permission) || @permission

      parameters = {:role => role, :permissions => { permission => settings }}
      parameters[:base_role_type] = base_role_type if base_role_type.present?

      json = api_call(:post, "/api/v1/accounts/#{account.id}/roles",
        { :controller => 'role_overrides', :action => 'add_role', :format => 'json', :account_id => account.id.to_s },
        parameters)
      @role = Role.find_by_id(json["id"])
      json
    end

    describe "add_role" do
      it "includes base_role_type_label" 


      it "adds the role to the account" 

    end

    describe "index" do
      it "should index roles" 


      it "should include inherited roles if requested" 


      it "should paginate" 


      context "with state parameter" do
        before :once do
          role = @account.roles.create :name => 'inactive_role'
          role.base_role_type = 'StudentEnrollment'
          role.workflow_state = 'inactive'
          role.save!
        end

        it "should list inactive roles" 


        it "should omit inactive roles if unspecified" 


        it "should accept multiple states" 

      end
    end

    describe "show" do
      it "should show a built-in role" 


      it "should show a custom role" 


      it "should not show a deleted role" 

    end

    it "should add a course-level role to the account" 


    it "should accept the usual forms of booleans in addition to 0 / 1" 


    context "when there are enrollments using a course-level role" do
      before :once do
        @role = custom_teacher_role(@role_name, :account => @account)
        course1 = Course.create!(:name => "blah", :account => @account)
        user1 = user_factory()

        enrollment1 = course1.enroll_user(user1, 'TeacherEnrollment', :role => @role)
        enrollment1.invite
        enrollment1.accept
        enrollment1.save!
        @user = @admin
      end

      it "should deactivate a course-level role" 


      it "should not be able to deactivate a role from a sub-account" 


      it "should reactivate an inactive role" 


      it "should not recycle a deleted role" 

    end

    it "should require a role" 


    it "should fail for course role without a valid base role type" 


    it "should fail for a course role with a reserved name" 


    it "should not create an override for course role for account-only permissions" 


    it "should not create an override if enabled is nil and locked is not 1" 


    it "should not create an override if explicit is not 1 and locked is not 1" 


    it "should create the override if explicit is 1 and enabled has a value" 


    it "should create an override for course-level roles" 


    it "should create the override if enabled is nil but locked is 1" 


    it "should set applies to descendents" 


    it "should set applies to self" 


    it "should require at least applies to self or applies to descendents" 


    it "should cascade applies to descendents" 


    it "should not cascade if applies to descendents is false" 


    it "should only set the parts that are specified" 


    it "should discard restricted permissions" 


    describe "json response" do
      it "should return the expected json format" 


      it "should only return manageable permissions" 


      it "should set explicit and prior default if enabled was provided" 

    end
  end

  describe "create permission overrides" do
    before :once do
      @account = Account.default
      @path = "/api/v1/accounts/#{@account.id}/roles/#{teacher_role.id}"
      @path_options = { :controller => 'role_overrides', :action => 'update',
        :account_id => @account.id.to_param, :format => 'json',
        :id => teacher_role.id }
      @permissions = { :permissions => {
        :read_question_banks => { :explicit => 1, :enabled => 0,
        :locked => 1 }}}
    end

    context "an authorized user" do
      it "should be able to change permissions" 


      it "should not be able to edit read-only permissions" 


      it "should not be able to create permissions for nonexistent roles" 


      it "should be able to change permissions for account admins" 


      it "should not be able to add an unavailable permission for a base role" 


      it "should not be able to add an unavailable permission for a course role" 

    end

    context "an unauthorized user" do
      it "should return 401 unauthorized" 

    end

    context "updating name" do
      it "should be able to update role name for custom roles" 


      it "should not be able to update role name for inherited roles" 


      it "should not be able to update role name for built-in roles" 

    end
  end
end

