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
#

require_relative '../../spec_helper'
require 'rotp'

describe Login::CasController do
  def stubby(stub_response, use_mock = true)
    cas_client = use_mock ? double(:cas_client).as_null_object : controller.client
    cas_client.instance_variable_set(:@stub_response, stub_response)
    def cas_client.validate_service_ticket(st)
      response = CASClient::ValidationResponse.new(@stub_response)
      st.user = response.user
      st.success = response.is_success?
      st
    end
    allow_any_instance_of(AuthenticationProvider::CAS).to receive(:client).and_return(cas_client) if use_mock
  end

  it "should logout with specific cas ticket" 
  it "should accept extra attributes" 


  it "should scope logins to the correct domain root account" 


  context "unknown user" do
    let!(:account) { account_with_cas(account: Account.default) }

    before do
      stubby("yes\nfoo@example.com\n")
    end

    it "should redirect when a user is authorized but not found in canvas" 


    it "sends to login page if unknown_user_url is blank" 


    it "uses the unknown_user_url from the aac" 


    it "provisions automatically when enabled" 

  end

  it "should time out correctly" 


  it "should set a cookie for site admin login" 


  it "should redirect to site admin CAS if cookie set" 


  it "should not force otp reconfiguration on succesful login" 

end

