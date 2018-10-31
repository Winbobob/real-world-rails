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

describe Login::Oauth2Controller do
  let(:aac) { Account.default.authentication_providers.create!(auth_type: 'facebook') }
  before do
    aac
    allow(Canvas::Plugin.find(:facebook)).to receive(:settings).and_return({})

    # replace on just this instance. this allows the tests to look directly at
    # response.location independent of any implementation plugins may add for
    # this method.
    def @controller.delegated_auth_redirect_uri(uri)
      uri
    end
  end

  describe "#new" do
    it "redirects to the provider" 


    it "wraps redirect in delegated_auth_redirect_uri" 

  end

  describe "#create" do
    it "checks the OAuth2 CSRF token" 


    it "rejects logins that take more than 10 minutes" 


    it "does not destroy existing sessions if it's a bogus request" 


    it "works" 


    it "redirects to login if no user found" 


    it "redirects to login if no user information returned" 


    it "(safely) displays an error message from the server" 


    it "provisions automatically when enabled" 

  end
end

