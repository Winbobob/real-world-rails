#
# Copyright (C) 2015 - present Instructure, Inc.
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

require 'spec_helper'

describe AuthenticationProvidersPresenter do
  describe "initialization" do
    it "wraps an account" 

  end

  def stubbed_account(providers=[])
    double(authentication_providers: double(active: providers))
  end

  describe "#configs" do

    it "pulls configs from account" 


    it "wraps them in an array" 


    it "only pulls from the db connection one time" 

  end

  describe "SAML view helpers" do
    let(:presenter){ described_class.new(double) }

    describe "#saml_identifiers" do
      it "is empty when saml disabled" 


      it "is the list from Onelogin::Saml::NameIdentifiers" 

    end

    describe "#saml_authn_contexts" do
      it "is empty when saml disabled" 


      context "when saml enabled" do

        before do
          allow(AuthenticationProvider::SAML).to receive(:enabled?).and_return(true)
        end

        it "has each value from Onelogin" 


        it "sorts OneLogin values" 


        it "adds in a nil value result" 

      end
    end
  end

  describe "#auth?" do
    it "is true for one aac" 


    it "is true for many aacs" 


    it "is false for no aacs" 

  end

  describe "#ldap_config?" do
    it "is true if theres at least one ldap aac" 


    it "is false for no aacs" 


    it "is false for aacs which are not ldap" 

  end

  describe "#sso_options" do
    it "always has cas and ldap" 


    it "includes saml if saml enabled" 

  end

  describe "ip_configuration" do
    def stub_setting(val)
      allow(Setting).to receive(:get).
        with('account_authorization_config_ip_addresses', nil).
        and_return(val)
    end

    describe "#ips_configured?" do
      it "is true if there is anything in the ip addresses setting" 


      it "is false without ip addresses" 

    end

    describe "#ip_list" do
      it "just returns the one for one ip address" 


      it "combines many ips into a newline delimited block" 


      it "is an empty string for no ips" 

    end
  end

  describe "#login_placeholder" do
    it "wraps AAC.default_delegated_login_handle_name" 

  end

  describe "#login_name" do
    let(:account){ Account.new }

    it "uses the one from the account if available" 


    it "defaults to the provided default on AuthenticationProvider" 

  end

  describe "#ldap_configs" do
    it "selects out all ldap configs" 

  end

  describe "#saml_configs" do
    it "selects out all saml configs" 

  end

  describe "#position_options" do
    let(:config){ AuthenticationProvider::SAML.new }
    let(:configs){ [config, config, config, config] }
    let(:account){ stubbed_account(configs) }

    before do
      allow(configs).to receive(:all).and_return(AuthenticationProvider)
    end

    it "generates a list from the saml config size" 


    it "tags on the 'Last' option if this config is new" 

  end

  describe "#login_url" do
    it "never includes id for LDAP" 


    it "doesn't include id if there is only one SAML config" 


    it "includes id if there are multiple SAML configs" 

  end

  describe "#new_auth_types" do
    it "excludes singletons that have a config" 

  end
end

