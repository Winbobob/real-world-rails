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

require_relative '../../spec_helper'

if Canvas.redis_enabled?
  describe Canvas::FailurePercentCounter do
    let(:counter) { Canvas::FailurePercentCounter.new(Canvas.redis, 'counter_spec', 1, 3) }

    it "increments the counter" 


    it "increments the failure counter" 


    it "returns a 0 failure rate when there is no data" 


    it "returns a 0 failure rate when there aren't enough samples" 


    it "returns a proper failure rate when there are enough samples" 

  end
end

