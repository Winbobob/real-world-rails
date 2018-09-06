#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path('../spec_helper', File.dirname(__FILE__))


describe AuthenticationMethods do
  describe "#load_user" do
    before do
      @request = double(:env => {'encrypted_cookie_store.session_refreshed_at' => 5.minutes.ago},
                      :format =>double(:json? => false),
                      :host_with_port => "")
      @controller = RSpec::MockController.new(nil, @request)
      allow(@controller).to receive(:load_pseudonym_from_access_token)
      allow(@controller).to receive(:api_request?).and_return(false)
      allow(@controller).to receive(:logger).and_return(double(info: nil))
    end

    context "with active session" do
      before do
        user_with_pseudonym
        @pseudonym_session = double(:record => @pseudonym)
        allow(PseudonymSession).to receive(:find).and_return(@pseudonym_session)
      end

      it "should set the user and pseudonym" 


      it "should destroy session if user was explicitly logged out" 


      it "should not destroy session if user was logged out in the future" 


      it "should set the CSRF cookie" 

    end
  end

  describe "#masked_authenticity_token" do
    before do
      @request = double(host_with_port: "")
      @controller = RSpec::MockController.new(nil, @request)
      @session_options = {}
      expect(CanvasRails::Application.config).to receive(:session_options).at_least(:once).and_return(@session_options)
    end

    it "should not set SSL-only explicitly if session_options doesn't specify" 


    it "should set SSL-only if session_options specifies" 


    it "should set httponly explicitly false on a non-files host" 


    it "should set httponly explicitly true on a files host" 


    it "should not set a cookie domain explicitly if session_options doesn't specify" 


    it "should set a cookie domain explicitly if session_options specifies" 

  end

  describe "#access_token_account" do

    let(:account) {Account.create!}
    let(:dev_key) {DeveloperKey.create!(account: account)}
    let(:access_token) {AccessToken.create!(developer_key: dev_key)}
    let(:request) {double(format: double(:json? => false), host_with_port:"")}
    let(:controller) {RSpec::MockController.new(account, request)}

    it "doesn't call '#get_context' if the Dev key is owned by the domain root account" 


    it "doesn't call '#get_context' if the Dev key has no account_id" 


    it "returns the domain_root_account if there is no account_id" 


    it "returns the domain_root_account if the Dev key is owned by the domain root account" 


    it "returns the contexts account for a sub account dev_key" 


    it "returns the domain_root_account if the context can't be resolved" 


  end

end

class RSpec::MockController
  include Canvas::RequestForgeryProtection
  include AuthenticationMethods

  attr_reader :redirects, :params, :session, :request

  def initialize(root_account, req, params_hash = {})
    @domain_root_account = root_account
    @request = req
    @redirects = []
    @params = params_hash
    reset_session
  end

  def reset_session
    @session = {}
  end

  def redirect_to(url)
    @redirects << url
  end

  def cas_login_url; ''; end

  def zendesk_delegated_auth_pass_through_url(options)
    options[:target]
  end

  def cookies
    @cookies ||= {}
  end
end


