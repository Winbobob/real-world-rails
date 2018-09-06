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

require_relative '../../spec_helper.rb'

describe Canvas::RequestForgeryProtection do
  before :each do
    # default setup is a protected non-GET non-API session-authenticated request with bogus tokens
    raw_headers = { 'X-CSRF-Token' => "bogus" }
    raw_headers = ActionDispatch::Request.new(raw_headers)
    headers = ActionDispatch::Http::Headers.new(raw_headers)
    cookies = ActionDispatch::Cookies::CookieJar.new(nil)
    request = double("request",
      host_with_port: "example.com:80",
      headers: headers,
      get?: false,
      head?: false)
    @controller = double("controller",
      request: request,
      cookies: cookies,
      protect_against_forgery?: true,
      api_request?: false,
      in_app?: true,
      form_authenticity_param: "bogus")
    @controller.extend(Canvas::RequestForgeryProtection)
  end

  describe "form_authenticity_token" do
    it "should give a different token on each call" 


    it "should give equivalently valid tokens on each call" 

  end

  describe "verified_request?" do
    it "should verify token" 


    it "should not verify token if protect_against_forgery? is false" 


    it "should not verify token if request.get? is true" 


    it "should not verify token if request.head? is true" 


    it "should not verify token if api_request? is true and in_app? is false" 


    it "should verify token if api_request? is true but in_app? is also true" 


    it "should count token as verified if form_authenticity_param is valid" 


    it "should count token as verified if X-CSRF-Token header is valid" 

  end
end

