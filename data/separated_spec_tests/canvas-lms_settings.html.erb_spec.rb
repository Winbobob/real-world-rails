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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "accounts/settings.html.erb" do
  before do
    assign(:account_roles, [])
    assign(:course_roles, [])
  end

  describe "sis_source_id edit box" do
    before do
      @account = Account.default.sub_accounts.create!
      @account.sis_source_id = "so_special_sis_id"
      @account.save!

      assign(:context, @account)
      assign(:account, @account)
      assign(:account_users, [])
      assign(:root_account, @account)
      assign(:associated_courses_count, 0)
      assign(:announcements, AccountNotification.none.paginate)
    end

    it "should show to sis admin" 


    it "should not show to non-sis admin" 

  end

  describe "open registration" do
    before do
      @account = Account.default
      assign(:account, @account)
      assign(:account_users, [])
      assign(:root_account, @account)
      assign(:associated_courses_count, 0)
      assign(:announcements, AccountNotification.none.paginate)
      admin = account_admin_user
      view_context(@account, admin)
    end

    it "should show by default" 


    it "should show warning dialog when a delegated auth config is around" 

  end

  describe "managed by site admins" do
    before do
      @account = Account.default
      assign(:account, @account)
      assign(:account_users, [])
      assign(:root_account, @account)
      assign(:associated_courses_count, 0)
      assign(:announcements, AccountNotification.none.paginate)
    end

    it "should show settings that can only be managed by site admins" 


    it "it should not show settings to regular admin user" 

  end

  describe "SIS Integration Settings" do
    before do
      assign(:account_users, [])
      assign(:associated_courses_count, 0)
      assign(:announcements, AccountNotification.none.paginate)
    end

    def do_render(user,account=nil)
      account = @account unless account
      view_context(account,user)
      render
    end

    context "site admin user" do
      before do
        @account = Account.site_admin
        assign(:account, @account)
        assign(:root_account, @account)
      end

      context "should not show settings to site admin user" do
        context "new_sis_integrations => true" do
          before do
            allow(@account).to receive(:feature_enabled?).with(:new_sis_integrations).and_return(true)
          end

          it { expect(response).not_to have_tag("#sis_integration_settings") }
          it { expect(response).not_to have_tag("#sis_grade_export_settings") }
          it { expect(response).not_to have_tag("#old_sis_integrations") }
          it { expect(response).not_to have_tag("input#allow_sis_import") }
        end
      end

      context "new_sis_integrations => false" do
        before do
          allow(@account).to receive(:feature_enabled?).with(:new_sis_integrations).and_return(false)
        end

        it { expect(response).not_to have_tag("#sis_integration_settings") }
        it { expect(response).not_to have_tag("#sis_grade_export_settings") }
        it { expect(response).not_to have_tag("#old_sis_integrations") }
        it { expect(response).not_to have_tag("input#allow_sis_import") }
      end
    end

    context "regular admin user" do
      let(:current_user) { account_admin_user }
      before do
        @account = Account.default
        @subaccount = @account.sub_accounts.create!(:name => 'sub-account')

        assign(:account, @account)
        assign(:root_account, @account)
        assign(:current_user, current_user)
      end

      context "new_sis_integrations => false" do
        before do
          @account.disable_feature!(:new_sis_integrations)
          @account.enable_feature!(:post_grades)
          allow(@account).to receive(:grants_right?).with(current_user, :manage_account_memberships).and_return(true)
        end

        context "show old version of settings to regular admin user" do
          before do
            allow(@account).to receive(:grants_right?).with(current_user, :manage_site_settings).and_return(true)
            do_render(current_user)
          end

          it { expect(response).to     have_tag("#sis_grade_export_settings") }
          it { expect(response).to     have_tag("#account_allow_sis_import") }
          it { expect(response).to     have_tag("#old_sis_integrations") }
          it { expect(response).not_to have_tag("#sis_integration_settings") }
          it { expect(response).not_to have_tag("#account_settings_sis_syncing_value") }
        end
      end

      context "new_sis_integrations => true" do
        let(:sis_name) { "input#account_settings_sis_name" }
        let(:allow_sis_import) { "input#account_allow_sis_import" }
        let(:sis_syncing) { "input#account_settings_sis_syncing_value" }
        let(:sis_syncing_locked) { "input#account_settings_sis_syncing_locked" }
        let(:default_grade_export) { "#account_settings_sis_default_grade_export_value" }
        let(:require_assignment_due_date) { "#account_settings_sis_require_assignment_due_date_value" }
        let(:assignment_name_length) { "#account_settings_sis_assignment_name_length_value" }

        before do
          @account.enable_feature!(:new_sis_integrations)
        end

        context "should show settings to regular admin user" do
          before do
            @account.enable_feature!(:post_grades)
            do_render(current_user)
          end

          it { expect(response).to     have_tag("#sis_integration_settings") }
          it { expect(response).to     have_tag(allow_sis_import) }
          it { expect(response).to     have_tag(sis_syncing) }
          it { expect(response).to     have_tag(sis_syncing_locked) }
          it { expect(response).to     have_tag(require_assignment_due_date) }
          it { expect(response).to     have_tag(assignment_name_length) }
          it { expect(response).not_to have_tag("#sis_grade_export_settings") }
          it { expect(response).not_to have_tag("#old_sis_integrations") }
          it { expect(response).to     have_tag(sis_name) }
        end

        context "SIS syncing enabled" do
          before do
            allow(Assignment).to receive(:sis_grade_export_enabled?).and_return(true)
          end

          context "for root account" do
            before do
              allow(@account).to receive(:sis_syncing).and_return({value: true, locked: true})
              do_render(current_user)
            end

            it "should enable all controls under SIS syncing" 

          end

          context "for sub-accounts (inherited)" do
            context "locked" do
              before do
                @account.enable_feature!(:post_grades)
                allow(@account).to receive(:sis_syncing).and_return({value: true, locked: true, inherited: true })
                do_render(current_user, @account)
              end

              it "should disable all controls under SIS syncing" 

            end

            context "not locked" do
              before do
                allow(@account).to receive(:sis_syncing).and_return({value: true, locked: false, inherited: true })
                do_render(current_user)
              end

              it "should enable all controls under SIS syncing" 

            end
          end
        end
      end
    end
  end

  describe "quotas" do
    before do
      @account = Account.default
      assign(:account, @account)
      assign(:account_users, [])
      assign(:root_account, @account)
      assign(:associated_courses_count, 0)
      assign(:announcements, AccountNotification.none.paginate)
    end

    context "with :manage_storage_quotas" do
      before do
        admin = account_admin_user
        view_context(@account, admin)
        assign(:current_user, admin)
      end

      it "should show quota options" 

    end

    context "without :manage_storage_quotas" do
      before do
        admin = account_admin_user_with_role_changes(:account => @account, :role_changes => {'manage_storage_quotas' => false})
        view_context(@account, admin)
        assign(:current_user, admin)
      end

      it "should not show quota options" 

    end
  end

  context "admins" do
    it "should not show add admin button if don't have permission to any roles" 

  end

  context "theme editor" do
    before do
      @account = Account.default
      assign(:account, @account)
      assign(:account_users, [])
      assign(:root_account, @account)
      assign(:associated_courses_count, 0)
      assign(:announcements, AccountNotification.none.paginate)
    end

    it "should show sub account theme editor option for non siteadmin admins" 

  end
end

