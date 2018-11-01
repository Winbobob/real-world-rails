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

describe 'login' do
  def redirect_until(uri)
    count = 0
    loop do
      expect(response).to be_redirect
      # === to support literal strings or regex
      return if uri === response.location
      count += 1
      expect(count).to be < 5
      follow_redirect!
    end
  end

  context "cas" do
    before do
      account_with_cas(account: Account.default)
    end

    def stubby(stub_response)
      @cas_client = CASClient::Client.new(
        cas_base_url: @account.authentication_providers.first.auth_base,
        encode_extra_attributes_as: :raw
      )
      @cas_client.instance_variable_set(:@stub_response, stub_response)
      def @cas_client.validate_service_ticket(st)
        response = CASClient::ValidationResponse.new(@stub_response)
        st.user = response.user
        st.success = response.is_success?
        st
      end
      allow_any_instance_of(Login::CasController).to receive(:client).and_return(@cas_client)
    end

    let(:cas_redirect_url) { Regexp.new(Regexp.escape(@cas_client.add_service_to_login_url(''))) }

    it "should log in and log out a user CAS has validated" 


    it "should inform the user CAS validation denied" 


    it "should inform the user CAS validation failed" 


    it "should inform the user that CAS account doesn't exist" 


    it "should redirect to a custom url if the user CAS account doesn't exist" 


    it "should login case insensitively" 


    context "single sign out" do
      before do
        skip "needs redis" unless Canvas.redis_enabled?
      end

      it "should do a single sign out" 

    end
  end

  context "SAML" do
    before do
      skip("requires SAML extension") unless AuthenticationProvider::SAML.enabled?
    end

    it 'redirects to the discovery page when hitting a deep link while unauthenticated' 

  end

  it "should redirect back for jobs controller" 

end

