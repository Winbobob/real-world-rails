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

describe DeveloperKeysController do
  let(:site_admin_key) do
    DeveloperKey.create!(
      name: 'Site Admin Key',
      visible: false
    )
  end
  let(:root_account_key) do
    DeveloperKey.create!(
      name: 'Root Account Key',
      account: test_domain_root_account,
      visible: true
    )
  end
  let(:test_domain_root_account) { Account.create! }

  context "Site admin" do
    before :once do
      account_admin_user(:account => Account.site_admin)
    end

    describe "GET 'index'" do
      context 'with no session' do
        it 'should require authorization' 

      end

      context 'with a session' do
        before do
          user_session(@admin)
        end

        it 'should return the list of developer keys' 


        describe "js bundles" do
          render_views

          it 'includes developer_keys_react' 


          it 'includes developer_keys' 

        end

        it 'should not include deleted keys' 


        it 'should include inactive keys' 


        it "should include the key's 'vendor_code'" 


        it "should include the key's 'visibility'" 


        it 'includes non-visible keys created in site admin' 


        context 'with inherited param' do
          before do
            site_admin_key
            root_account_key
            allow_any_instance_of(Account).to receive(:feature_allowed?)
            allow_any_instance_of(Account).to receive(:feature_allowed?).with(:developer_key_management_ui_rewrite).and_return(true)
            allow_any_instance_of(Account).to receive(:feature_enabled?).with(:developer_key_management_ui_rewrite).and_return(true)
          end

          context 'on site_admin account' do
            it 'returns empty array' 

          end

          context 'on root account' do
            context 'with site_admin key visible' do
              before do
                dev_key = DeveloperKey.create!(name: 'Site Admin Key 2')
                dev_key.update!(visible: true)
              end

              it 'returns only the keys from site_admin' 

            end

            context 'with site_admin key not visible' do
              it 'returns empty array' 

            end
          end

          context 'on sub account'
        end
      end
    end

    describe "POST 'create'" do
      it 'should return the list of developer keys' 


      describe 'scopes' do
        let(:valid_scopes) do
          %w(url:POST|/api/v1/courses/:course_id/quizzes/:id/validate_access_code
             url:GET|/api/v1/audit/grade_change/courses/:course_id/assignments/:assignment_id/graders/:grader_id)
        end
        let(:invalid_scopes) { ['url:POST/banana', 'url:POST/invalid/scope'] }
        let(:root_account) { account_model }

        before do
          Account.site_admin.allow_feature!(:api_token_scoping)
          allow_any_instance_of(Account).to receive(:feature_enabled?).with(:api_token_scoping).and_return(true)

          Account.site_admin.allow_feature!(:developer_key_management_ui_rewrite)
          allow_any_instance_of(Account).to receive(:feature_enabled?).with(:developer_key_management_ui_rewrite).and_return(true)

          user_session(@admin)
        end

        it 'allows setting scopes' 


        it 'returns an error if an invalid scope is used' 


        it 'does not create the key if any scopes are invalid' 


        it 'does not set scopes if the "developer_key_management_ui_rewrite" flag is disabled' 

      end
    end

    describe "PUT 'update'" do
      it "should deactivate a key" 


      it "should reactivate a key" 


      describe 'scopes' do
        let(:valid_scopes) do
          %w(url:POST|/api/v1/courses/:course_id/quizzes/:id/validate_access_code
             url:GET|/api/v1/audit/grade_change/courses/:course_id/assignments/:assignment_id/graders/:grader_id)
        end
        let(:invalid_scopes) { ['url:POST|/api/v1/banana', 'not_a_scope'] }
        let(:root_account) { account_model }
        let(:developer_key) { DeveloperKey.create!(account: account_model) }

        before do
          Account.site_admin.allow_feature!(:api_token_scoping)
          allow_any_instance_of(Account).to receive(:feature_enabled?).with(:api_token_scoping).and_return(true)

          Account.site_admin.allow_feature!(:developer_key_management_ui_rewrite)
          allow_any_instance_of(Account).to receive(:feature_enabled?).with(:developer_key_management_ui_rewrite).and_return(true)

          user_session(@admin)
        end

        it 'allows setting scopes' 


        it 'returns an error if an invalid scope is used' 


        it 'does not persist scopes if any are invalid' 


        it 'does not set scopes if the "developer_key_management_ui_rewrite" flag is disabled' 

      end
    end

    describe "DELETE 'destroy'" do
      it "should soft delete a key" 

    end
  end

  context "Account admin (not site admin)" do
    let(:test_domain_root_account_admin) { account_admin_user(account: test_domain_root_account) }
    let(:sub_account) { test_domain_root_account.sub_accounts.create!(parent_account: test_domain_root_account, root_account: test_domain_root_account) }

    before :each do
      user_session(test_domain_root_account_admin)
      allow(LoadAccount).to receive(:default_domain_root_account).and_return(test_domain_root_account)
    end

    describe '#index' do
      before do
        site_admin_key
        root_account_key

        allow_any_instance_of(Account).to receive(:feature_allowed?)
        allow_any_instance_of(Account).to receive(:feature_allowed?).with(:developer_key_management_ui_rewrite).and_return(true)
        allow_any_instance_of(Account).to receive(:feature_enabled?).with(:developer_key_management_ui_rewrite).and_return(true)
      end

      it 'does not inherit site admin keys if feature flag is off' 


      it 'does not include non-visible keys from site admin' 


      it 'does not include visible keys from site admin' 


      it 'includes non-visible keys created in the current context' 


      context 'with "inherited" parameter' do
        it 'does not include account developer keys' 

      end

      context 'with sharding' do
        specs_require_sharding

        let(:root_account_admin) { root_account_shard.activate { account_admin_user(account: root_account) } }
        let(:site_admin_shard) { Account.site_admin.shard }
        let(:site_admin_key) do
          site_admin_shard.activate do
            key = DeveloperKey.create!
            key.update!(visible: true)
            key
          end
        end
        let(:root_account_shard) { Shard.create! }
        let(:root_account) { root_account_shard.activate { account_model } }
        let(:root_account_key) { root_account_shard.activate { DeveloperKey.create!(account: root_account) } }

        before do
          site_admin_key
          root_account_key

          allow(controller).to receive(:account_context) do
            controller.send(:require_account_context)
            controller.send(:context)
          end
        end

        it 'includes visible site admin keys from the site admin shard' 

      end
    end

    it 'Should be allowed to access their dev keys' 


    it "An account admin shouldn't be able to access site admin dev keys" 


    it "An account admin shouldn't be able to access site admin dev keys explicitly" 


    describe "Should be able to create developer key" do
      before :each do
        post "create", params: {account_id: test_domain_root_account.id, developer_key: {
                       redirect_uri: "http://example.com/sdf"
                     }}
      end

      it 'should be allowed to create a dev key' 


      it 'should be dev keys plus 1 key' 

    end

    it 'should be allowed update a dev key' 


    it "Shouldn't be allowed access dev keys for a sub account" 


    it "Shouldn't be allowed to create dev keys for a sub account" 


    describe "Shouldn't be able to access other accounts" do
      before :once do
        @other_root_account = Account.create!
        @other_sub_account = @other_root_account.sub_accounts.create!(parent_account: @other_root_account, root_account: @other_root_account)
      end

      it "Shouldn't be allowed access dev keys for a foreign account" 


      it "Shouldn't be allowed to create dev keys for a foreign account" 


      it "Shouldn't be allowed to update dev keys for a foreign account" 


      it "Shouldn't be allowed to update global dev keys" 


      it "Shouldn't be allowed to view foreign accounts dev_key" 

    end
  end
end

