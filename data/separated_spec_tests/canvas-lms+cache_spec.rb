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
require_dependency "canvas/dynamic_settings"
require 'imperium/testing' # Not loaded by default

module Canvas
  class DynamicSettings
    RSpec.describe Cache do
      before do
        Cache.reset!
      end

      describe '.fallback_fetch(key)' do
        it 'must return the stored value even if expired' 

      end

      describe '.fetch(key, ttl: nil)' do
        it 'must return the value returned by the supplied block' 


        it 'must capture the return value from the block in the store' 


        it 'must return the stored value rather than calling the block again on future calls' 


        it 'must call the block again when the ttl has elapsed' 


        it 'must not cache not found responses' 


        it 'must update the TTL on the cached value if it was previously nil' 

      end

      describe '.reset!' do
        it 'must clear the stored values' 

      end
    end
  end
end

