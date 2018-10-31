# Copyright (C) 2017 - present Instructure, Inc.
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
require_dependency "canvas/dynamic_settings"
require 'imperium/testing' # Not loaded by default


module Canvas
  class DynamicSettings
    RSpec.describe PrefixProxy do
      let(:client) { instance_double(Imperium::KV) }
      let(:proxy) { PrefixProxy.new('foo/bar', service: nil, tree: nil, default_ttl: 3.minutes, kv_client: client) }

      after(:each) do
        Cache.reset!
      end

      describe '.fetch(key, ttl: @default_ttl)' do
        it 'must return nil when no value was found' 


        it 'must return the value for the specified key' 


        it 'must fetch the value from consul using the prefix and supplied key' 


        it 'must use the dynamic settings cache for previously fetched values' 


        it "must fall back to expired cached values when consul can't be contacted" 


        it "must log the connection failure when consul can't be contacted" 


        it "must raise an exception when consul can't be reached and no previous value is found" 


        it "falls back to global settings" 

      end

      describe 'for_prefix(prefix_extension, default_ttl: @default_ttl)' do
        it 'must instantiate a new proxy with the supplied prefix extension appended to the current prefix' 


        it "must pass on the current instance's default ttl if not supplied" 


        it 'must pass on the supplied default ttl' 


        it 'must pass on the kv client from the receiving proxy' 

      end

      describe '#set_keys' do
        let(:kvs) { {foo1: 'bar1', foo2: 'bar2', foo3: 'bar3'} }

        it 'sets multiple key value pairs' 


        it 'sets multiple global key value pairs' 

      end
    end
  end
end

