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

describe "AuthenticationProviders API", type: :request do
  before :once do
    @account = account_model(:name => 'root')
    user_with_pseudonym(:active_all => true, :account => @account)
    @account.authentication_providers.scope.delete_all
    @account.account_users.create!(user: @user)
    @cas_hash = {"auth_type" => "cas",
                 "auth_base" => "127.0.0.1",
                 "jit_provisioning" => false}
    @saml_hash = {'auth_type' => 'saml',
                  'idp_entity_id' => 'http://example.com/saml1',
                  'log_in_url' => 'http://example.com/saml1/sli',
                  'log_out_url' => 'http://example.com/saml1/slo',
                  'certificate_fingerprint' => '111222',
                  'identifier_format' => 'urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress',
                  'federated_attributes' => {},
                  'jit_provisioning' => false}
    @ldap_hash = {'auth_type' => 'ldap',
                  'auth_host' => '127.0.0.1',
                  'auth_filter' => 'filter1',
                  'auth_username' => 'username1',
                  'auth_password' => 'password1',
                  'jit_provisioning' => false}
  end

  context "/index" do
    def call_index(status=200)
      api_call(:get, "/api/v1/accounts/#{@account.id}/authentication_providers",
             { :controller => 'authentication_providers', :action => 'index', :account_id => @account.id.to_s, :format => 'json' },
             {}, {}, :expected_status => status)
    end

    it "should return all aacs in position order" 


    it "should return unauthorized error" 

  end

  context "/create" do
    # the deprecated mass-update/create is tested in account_authorization_configs_deprecated_api_spec.rb

    def call_create(params, status = 200)
      json = api_call(:post, "/api/v1/accounts/#{@account.id}/authentication_providers",
             { :controller => 'authentication_providers', :action => 'create', :account_id => @account.id.to_s, :format => 'json' },
             params, {}, :expected_status => status)
      @account.reload
      json
    end

    it "should create a saml aac" 


    it "should work with rails form style params" 


    it "should create multiple saml aacs" 


    it "should create an ldap aac" 

    it "should create multiple ldap aacs" 

    it "should default ldap auth_over_tls to 'start_tls'" 


    it "should create a cas aac" 


    it "does not error when mixing auth_types (for now)" 


    it "should update positions" 


    it "should error if empty post params sent" 


    it "should return unauthorized error" 


    it "should disable open registration when setting delegated auth" 


    it "should not allow creation of duplicate singleton providers" 

  end

  context "/show" do
    def call_show(id, status = 200)
      api_call(:get, "/api/v1/accounts/#{@account.id}/authentication_providers/#{id}",
             { :controller => 'authentication_providers', :action => 'show', :account_id => @account.id.to_s, :id => id.to_param, :format => 'json' },
             {}, {}, :expected_status => status)
    end

    it "should return saml aac" 


    it "should return ldap aac" 


    it "should return cas aac" 


    it "should 404" 


    it "should return unauthorized error" 

  end

  context "/update" do
    def call_update(id, params, status = 200)
      json = api_call(:put, "/api/v1/accounts/#{@account.id}/authentication_providers/#{id}",
             { :controller => 'authentication_providers', :action => 'update', :account_id => @account.id.to_s, :id => id.to_param, :format => 'json' },
             params, {}, :expected_status => status)
      @account.reload
      json
    end

    it "should update a saml aac" 



    it "should return error when it fails to update" 


    it "updates federated attributes" 


    it "should work with rails form style params" 


    it "should update an ldap aac" 


    it "should update a cas aac" 


    it "should error when mixing auth_types" 


    it "should update positions" 


    it "should 404" 


    it "should return unauthorized error" 

  end

  context "/destroy" do
    def call_destroy(id, status = 200)
      json = api_call(:delete, "/api/v1/accounts/#{@account.id}/authentication_providers/#{id}",
             { :controller => 'authentication_providers', :action => 'destroy', :account_id => @account.id.to_s, :id => id.to_param, :format => 'json' },
             {}, {}, :expected_status => status)
      @account.reload
      json
    end

    it "should delete" 


    it "should reposition correctly" 


    it "should 404" 


    it "should return unauthorized error" 

  end

  describe "sso settings" do
    let(:sso_path) do
      "/api/v1/accounts/#{@account.id}/sso_settings"
    end

    def update_settings(settings, expected_status)
      api_call(:put,
               sso_path,
               {
                 controller: 'authentication_providers',
                 action: 'update_sso_settings',
                 account_id: @account.id.to_s,
                 format: 'json'
               },
               settings,
               {},
               expected_status: expected_status)
    end

    it "requires authorization" 


    it "sets auth settings" 


    it "ignores settings that don't exist" 


    context "with login handle pre-existing on account" do
      before do
        @account.login_handle_name = "LoginHandleSet"
        @account.save!
      end

      it "clears settings with a key but no value" 


      it "leaves unspecified settings alone" 


      it "can get the current state of settings" 

    end
  end

  describe "API JSON" do
    describe 'federated_attributes' do
      it 'excludes provisioning only attributes when jit_provisioning is off' 


      it 'uses full form when jit_provisioning is on' 

    end
  end
end

