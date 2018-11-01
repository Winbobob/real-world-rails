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

require_relative '../spec_helper'
require_relative '../../config/initializers/_consul'

describe ConsulInitializer do
  after(:each) do
    Canvas::DynamicSettings.config = nil
    Canvas::DynamicSettings.reset_cache!
    Canvas::DynamicSettings.fallback_data = nil
  end

  class FakeLogger
    attr_reader :messages
    def initialize
      @messages = []
    end

    def warn(message)
      messages << message
    end
  end

  describe ".configure_with" do
    include WebMock::API

    it "passes provided config info to DynamicSettings" 


    it "logs nothing if there's no config file" 

  end

  describe "just from loading" do
    it "clears the DynamicSettings cache on reload" 

  end
end

