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

describe AccountsController do
  def account_with_admin_logged_in(opts = {})
    account_with_admin(opts)
    user_session(@admin)
  end

  def account_with_admin(opts = {})
    @account = opts[:account] || Account.default
    account_admin_user(account: @account)
  end

  context "confirm_delete_user" do
    before(:once) {account_with_admin}
    before(:each) {user_session(@admin)}

    it "should confirm deletion of canvas-authenticated users" 


    it "should not confirm deletion of non-existent users" 


    it "should confirm deletion of managed password users" 

  end

  context "remove_user" do
    before(:once) {account_with_admin}
    before(:each) {user_session(@admin)}

    it "should remove user from the account" 


    it "should 404 for non-existent users as html" 


    it "should 404 for non-existent users as json" 


    it "should only remove user from the account, but not delete them" 


    it "should only remove users from the specified account" 


    it "should delete the user's CCs when removed from their last account" 


    it "should not delete the user's CCs when other accounts remain" 


    it "should remove users with managed passwords with html" 


    it "should remove users with managed passwords with json" 

  end

  describe "add_account_user" do
    before(:once) {account_with_admin}
    before(:each) {user_session(@admin)}

    it "should allow adding a new account admin" 


    it "should allow adding a new custom account admin" 


    it "should allow adding an existing user to a sub account" 

  end

  describe "remove_account_user" do
    it "should remove account membership from a user" 


    it "should verify that the membership is in the caller's account" 

  end

  describe "update" do
    it "should update 'app_center_access_token'" 


    it "should update account with sis_assignment_name_length_input with value less than 255" 


    it "should update account with sis_assignment_name_length_input with 255 if none is given" 


    it "should allow admins to set the sis_source_id on sub accounts" 


    it "should not allow setting the sis_source_id on root accounts" 


    it "should not allow admins to set the trusted_referers on sub accounts" 


    it "should allow admins to set the trusted_referers on root accounts" 


    it "should not allow non-site-admins to update certain settings" 


    it "should allow site_admin to update certain settings" 


    it 'does not allow anyone to set unexpected settings' 


    it "doesn't break I18n by setting the help_link_name unnecessarily" 


    it "doesn't break I18n by setting customized text for default help links unnecessarily" 


    it "should allow updating services that appear in the ui for the current user" 


    it "should update 'default_dashboard_view'" 


    it "should overwrite account users' existing dashboard_view if specified" 


    describe "quotas" do
      before :once do
        @account = Account.create!
        user_factory
        @account.default_storage_quota_mb = 123
        @account.default_user_storage_quota_mb = 45
        @account.default_group_storage_quota_mb = 9001
        @account.storage_quota = 555.megabytes
        @account.save!
      end

      before :each do
        user_session(@user)
      end

      context "with :manage_storage_quotas" do
        before :once do
          role = custom_account_role 'quota-setter', :account => @account
          @account.role_overrides.create! :permission => 'manage_account_settings', :enabled => true,
                                          :role => role
          @account.role_overrides.create! :permission => 'manage_storage_quotas', :enabled => true,
                                          :role => role
          @account.account_users.create!(user: @user, role: role)
        end

        it "should allow setting default quota (mb)" 


        it "should allow setting default quota (bytes)" 


        it "should allow setting storage quota" 

      end

      context "without :manage_storage_quotas" do
        before :once do
          role = custom_account_role 'quota-loser', :account => @account
          @account.role_overrides.create! :permission => 'manage_account_settings', :enabled => true,
                                          :role => role
          @account.account_users.create!(user: @user, role: role)
        end

        it "should disallow setting default quota (mb)" 


        it "should disallow setting default quota (bytes)" 


        it "should disallow setting storage quota" 

      end
    end

    context "turnitin" do
      before(:once) {account_with_admin}
      before(:each) {user_session(@admin)}

      it "should allow setting turnitin values" 


      it "should pull out the host from a valid url" 


      it "should nil out the host if blank is passed" 


      it "should error on an invalid host" 

    end

    context "terms of service settings" do
      before(:once) {account_with_admin}
      before(:each) {user_session(@admin)}

      it "should be able to set and update a custom terms of service" 


      it "should be able to configure the 'passive' setting" 

    end
  end

  describe "#settings" do
    it "should load account report details" 


    it "puts up-to-date help link stuff in the env" 


    context "sharding" do
      specs_require_sharding

      it "loads even from the wrong shard" 

    end

    context "external_integration_keys" do
      before(:once) do
        ExternalIntegrationKey.key_type :external_key0, rights: {write: true}
        ExternalIntegrationKey.key_type :external_key1, rights: {write: false}
        ExternalIntegrationKey.key_type :external_key2, rights: {write: true}
      end

      before do
        user_factory
        user_session(@user)
        @account = Account.create!
        Account.site_admin.account_users.create!(user: @user)

        @eik = ExternalIntegrationKey.new
        @eik.context = @account
        @eik.key_type = :external_key0
        @eik.key_value = '42'
        @eik.save
      end

      it "should load account external integration keys" 


      it "should create a new external integration key" 


      it "should update an existing external integration key" 


      it "should delete an external integration key when not provided or the value is blank" 

    end
  end

  def admin_logged_in(account)
    user_session(user_factory)
    Account.site_admin.account_users.create!(user: @user)
    account_with_admin_logged_in(account: account)
  end

  describe "terms of service" do
    before do
      @account = Account.create!
      course_with_teacher(:account => @account)
      c1 = @course
      course_with_teacher(:course => c1)
      @student = User.create
      c1.enroll_user(@student, "StudentEnrollment", :enrollment_state => 'active')
      c1.save
    end

    it "should return the terms of service content" 


    it "should return the terms of service content as teacher" 


    it "should return the terms of service content as student" 

  end

  describe "help links" do
    before do
      account_with_admin_logged_in
      @account.settings[:custom_help_links] = [
        {
          id: 'link1',
          text: 'Custom Link!',
          subtext: 'Custom subtext',
          url: 'https://canvas.instructure.com/guides',
          type: 'custom',
          available_to: ['user', 'student', 'teacher'],
        },
      ]
      @account.save
      course_with_teacher(account: @account)
      course_with_student(course: @course)
    end

    it "should return default help links" 


    it "should return custom help links" 


    it "should return the help links as student" 


    it "should return the help links as teacher" 

  end

  describe "#account_courses" do
    before do
      @account = Account.create!
      @c1 = course_factory(account: @account, course_name: "foo", sis_source_id: 42)
      @c2 = course_factory(account: @account, course_name: "bar", sis_source_id: 31)
    end

    it "should not allow get a list of courses with no permissions" 


    it "should get a list of courses" 


    it "should properly remove sections from includes" 


    it "should be able to sort courses by name ascending" 


    it "should be able to sort courses by name descending" 


    it "should be able to sort courses by id ascending" 


    it "should be able to sort courses by id descending" 


    it "should be able to sort courses by teacher ascending" 


    it "should be able to sort courses by teacher descending" 


    it "should be able to sort courses by subaccount ascending" 


    it "should be able to sort courses by subaccount descending" 


    context "sorting by term" do
      let(:letters_in_random_order) { 'daqwds'.split('') }
      before do
        @account = Account.create!
        create_courses(letters_in_random_order.map { |i|
          {enrollment_term_id: @account.enrollment_terms.create!(name: i).id}
        }, account: @account)
        admin_logged_in(@account)
      end

      it "should be able to sort courses by term ascending" 


      it "should be able to sort courses by term descending" 

    end

    it "should be able to search by teacher" 


    it "should be able to search by course name" 


    it "should be able to search by course sis id" 


  end
end

