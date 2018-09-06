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
require_dependency "canvas/errors"
module Canvas
  describe Errors do
    before(:each) do
      @old_registry = described_class.instance_variable_get(:@registry)
      described_class.clear_callback_registry!
    end

    after(:each) do
      described_class.instance_variable_set(:@registry, @old_registry)
    end

    let(:error){double("Some Error") }

    describe '.capture_exception' do
      it 'tags with the exception type' 

    end

    it 'fires callbacks when it handles an exception' 


    it "passes through extra information if available wrapped in extra" 


    it 'captures output from each callback according to their registry tag' 

  end
end

