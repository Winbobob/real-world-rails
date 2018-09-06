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
require_dependency "utils/date_presenter"

module Utils
  describe DatePresenter do
    describe "#as_string" do

      it 'uses the medium date in long format' 


      it 'can use the short format' 


      it 'can use the full format' 


      describe 'on relative dates' do
        let(:today) { Date.parse("2014-10-1") }
        around do |example|
          Timecop.freeze(today, &example)
        end

        it 'returns Today for today' 


        it 'returns Tomorrow for tomorrow' 


        it 'returns Yesterday for yesterday' 


        it 'provides weekday names for this week' 

      end
    end
  end
end

