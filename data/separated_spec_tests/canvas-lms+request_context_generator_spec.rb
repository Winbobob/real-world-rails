#
# Copyright (C) 2014 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "RequestContextGenerator" do
  let(:env) { {} }
  let(:request) { double('Rack::Request', path_parameters: { controller: 'users', action: 'index' }) }
  let(:context) { double('Course', class: 'Course', id: 15) }

  it "should generate the X-Canvas-Meta response header" 


  it "should add request data to X-Canvas-Meta" 


  it "should add request and context data to X-Canvas-Meta" 


  it "should add page view data to X-Canvas-Meta" 


  it "should generate a request_id and store it in Thread.current" 


  it "should add the request_id to X-Request-Context-Id" 


  it "should find the session_id in a cookie and store it in Thread.current" 


  it "should find the session_id from the rack session and add it to X-Session-Id" 


  it "should calculate the 'queued' time if header is passed" 


  context "when request provides an override context id" do
    let(:shared_secret){ 'sup3rs3cr3t!!' }
    let(:remote_request_context_id){ '1234-5678-9012-3456-7890-1234-5678' }

    let(:remote_signature) do
      Canvas::Security.sign_hmac_sha512(remote_request_context_id, shared_secret)
    end

    before(:each) do
      Thread.current[:context] = nil
      Canvas::DynamicSettings.reset_cache!
      Canvas::DynamicSettings.fallback_data = {
        config: {
          canvas: {
            canvas: {
              'signing-secret' => shared_secret
            }
          }
        }
      }
      env['HTTP_X_REQUEST_CONTEXT_ID'] = Canvas::Security.base64_encode(remote_request_context_id)
      env['HTTP_X_REQUEST_CONTEXT_SIGNATURE'] = Canvas::Security.base64_encode(remote_signature)
    end

    after(:each){ Canvas::DynamicSettings.fallback_data = {} }

    def run_middleware
      _, headers, _msg = RequestContextGenerator.new(->(_){ [200, {}, []] }).call(env)
      headers
    end

    it "uses a provided request context id if another service submits one that is correctly signed" 


    it "won't accept an override without a signature" 


    it "rejects a wrong signature" 


    it "rejects a tampered ID" 

  end
end

