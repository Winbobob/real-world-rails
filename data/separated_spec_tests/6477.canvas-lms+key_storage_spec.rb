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
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Lti::KeyStorage do
  before do
    @fallback_proxy = Canvas::DynamicSettings::FallbackProxy.new({
      Lti::KeyStorage::PAST => Lti::RSAKeyPair.new.to_jwk.to_json,
      Lti::KeyStorage::PRESENT => Lti::RSAKeyPair.new.to_jwk.to_json,
      Lti::KeyStorage::FUTURE => Lti::RSAKeyPair.new.to_jwk.to_json
    })
    allow(Canvas::DynamicSettings).to receive(:kv_proxy).and_return(@fallback_proxy)
  end

  describe '#retrieve_keys_json' do
    it 'retrieves valid keys in json format' 

  end

  describe "#rotate_keys" do
    it 'rotates the past key' 


    it 'rotates the present key' 


    it 'rotates the future key' 


    it 'initialize the keys if no keys are present' 


    it 'resets the cache after setting the keys' 

  end

  describe "#public_keyset" do
    it 'retrieve the public keys in JWK format' 

  end

  def select_public_claims(key)
    key.select{|k,_| %w(kty e n kid alg use).include?(k)}
  end

end

