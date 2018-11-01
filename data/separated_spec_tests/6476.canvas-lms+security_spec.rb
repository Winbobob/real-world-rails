#
# Copyright (C) 2016 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')
require 'simple_oauth'

describe Lti::Security do
  describe '.signed_post_params' do
    let(:params) { {custom_a: 1, custom_b:2} }
    let(:consumer_key) { 'test' }
    let(:launch_url) { 'https://test.example/launch' }
    let(:consumer_secret) { 'shh'}

    context 'disable_lti_post_only' do
      it 'generates a correct signature' 


      it "doesn't copy query params" 


    end

    context '#decoded_lti_assignment_id' do
      it 'returns nil if secure params are invalid' 


      it 'returns the lti assignment id if secure params are valid' 

    end

    context '.check_and_store_nonce' do
      it 'rejects a used nonce' 


      it 'rejects a nonce if the timestamp exceeds the expiration' 


      it 'rejects a nonce more than 1 minute in the future' 


      it 'accepts a nonce less than 1 minute in the future' 


    end

    it "generates a correct signature" 


    it "handles whitespace in URLs" 


    it "generates the signature for urls with query params in an incorrect way that we are aware of and saddened by" 


    it "generates the signature correctly for a non standard port" 


  end
end

