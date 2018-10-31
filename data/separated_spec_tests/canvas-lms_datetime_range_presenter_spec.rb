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
require_dependency "utils/datetime_range_presenter"

module Utils
  describe DatetimeRangePresenter do
    def overridden_presenter(datetime, zone_name)
      zone = ActiveSupport::TimeZone[zone_name]
      DatetimeRangePresenter.new(datetime, nil, :event, zone)
    end

    describe "#as_string" do
      it 'can display a single datetime if theres no range' 


      describe "with shortened midnight" do
        around do |example|
          Timecop.freeze(Time.zone.local(2014, 10, 1, 9, 30), &example)
        end

        it "omits the time for events when midnight is specified as shortened" 


        it "omits the time for due dates when midnight is shortened" 

      end

      it "ignores ranges for due dates" 


      it 'handles ranges' 


      it "omits second date if start and end are on the same day" 


      it "should include the year if the current year isn't the same" 


      it "accepts a timezone override" 


      it "uses the default timezone if none provided" 


      it "can deal with date boundaries in the override on time objects" 


    end
  end
end

