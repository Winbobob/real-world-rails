# Copyright 2014 Square Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

require 'rails_helper'

if Squash::Configuration.authentication.strategy == 'ldap'
  class FakeController
    def self.helper_method(*) end
    def logger(*) Rails.logger end

    include AuthenticationHelpers
    include LdapAuthenticationHelpers
  end

  RSpec.describe LdapAuthenticationHelpers, type: :model do
    describe "#log_in" do
      before(:all) { @user = FactoryGirl.create(:user) }

      before :each do
        @controller = FakeController.new
        @ldap       = double('Net::LDAP')
        allow(@controller).to receive(:build_ldap_interface).and_return(@ldap)
      end

      it "should return true if the LDAP entry exists and can bind" 


      it "should extract the username from an email address login" 


      it "should return false if the LDAP entry does not exist" 


      if Squash::Configuration.authentication.ldap[:bind_dn]
        it "should return false if the user cannot bind" 


        it "should return false if the LDAP authenticator cannot bind" 

      else
        it "should return false if the user cannot bind" 

      end

      it "should create a new user if one doesn't already exist" 

    end
  end
end

