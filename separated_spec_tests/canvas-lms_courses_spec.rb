#
# Copyright (C) 2018 - present Instructure, Inc.
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

require_relative '../courses_api_client'
require_relative 'pact_helper'

describe 'Courses', :pact => true do

  subject(:coursesApi) {CoursesApiClient.new}

  before do
    CoursesApiClient.base_uri 'localhost:1234'
  end

  context 'List Courses' do
    it 'should return JSON body' 

  end

  context 'List Students' do
    it 'should return JSON body' 

  end
end

