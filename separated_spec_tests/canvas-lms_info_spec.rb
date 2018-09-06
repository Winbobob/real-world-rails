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
require_dependency "canvas/errors/info"
module Canvas
  class Errors
    describe Info do
      let(:request) do
        double(env: {}, remote_ip: "", query_parameters: {},
             request_parameters: {}, path_parameters: {}, url: '',
             request_method_symbol: '', format: 'HTML', headers: {}, authorization: nil)
      end

      let(:request_context_id){ 'abcdefg1234567'}
      let(:auth_header){ "OAuth oauth_body_hash=\"2jmj7l5rSw0yVb%2FvlWAYkK%2FYBwk%3D\", oauth_consumer_key=\"test_key\", oauth_nonce=\"QFOhAwKHz0UATQSdycHdNkMZYpkhkzU1lYpwvIF3Q8\", oauth_signature=\"QUfER7WBKsq0nzIjJ8Y7iTcDaq0%3D\", oauth_signature_method=\"HMAC-SHA1\", oauth_timestamp=\"1445980405\", oauth_version=\"1.0\"" }
      let(:account){ double(global_id: 1122334455) }
      let(:user) { double(global_id: 5544332211)}
      let(:opts) { { request_context_id: request_context_id, type: 'core_meltdown' }}

      describe 'initialization' do
        it "grabs the request context id if not provided" 

      end

      describe "#to_h" do
        let(:output) do
          info = described_class.new(request, account, user, opts)
          info.to_h
        end

        it 'digests request information' 


        it "pulls in the request method" 


        it 'passes format through' 


        it 'includes user information' 


        it 'passes important headers' 


        it 'passes oauth header info' 

      end

      describe ".useful_http_env_stuff_from_request" do
        it "duplicates to get away from frozen strings out of the request.env" 


        it "has a max limit on the request_parameters data size" 

      end

      describe ".useful_http_headers" do
        it "returns some oauth header info" 


        it "returns user agent" 

      end

      def check_oauth(oauth_info)
        expected_info = {
          "oauth_body_hash"=>"2jmj7l5rSw0yVb/vlWAYkK/YBwk=",
          "oauth_consumer_key"=>"test_key",
          "oauth_nonce"=>"QFOhAwKHz0UATQSdycHdNkMZYpkhkzU1lYpwvIF3Q8",
          "oauth_signature"=>"QUfER7WBKsq0nzIjJ8Y7iTcDaq0=",
          "oauth_signature_method"=>"HMAC-SHA1",
          "oauth_timestamp"=>"1445980405",
          "oauth_version"=>"1.0"
        }
        assert_hash_contains(oauth_info, expected_info)
      end
    end
  end
end

