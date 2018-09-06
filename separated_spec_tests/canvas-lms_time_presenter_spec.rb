# encoding: UTF-8
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
#
# Copyright (C) 2011 Instructure, Inc.
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

require_relative '../../spec_helper'
require_dependency "utils/time_presenter"

module Utils
  describe TimePresenter do
    describe "#as_string" do
      before do
        @zone = Time.zone
        Time.zone = "Mountain Time (US & Canada)"
      end

      after { Time.zone = @zone }

      let(:time){ Time.parse("2014-10-01 09:00") }

      def hour(t)
        t.hour.to_s.rjust(2)
      end

      it 'processes a single time into a localized format' 


      it 'trims the minutes for an on-the-hour time' 


      it 'can present a range of times' 


      it 'returns nil for nil' 


      it 'can accept a zone override' 


      it 'can handle a nil zone override' 

    end
  end
end

