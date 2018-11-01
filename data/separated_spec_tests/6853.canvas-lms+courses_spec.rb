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

require_relative 'helper'
require_relative '../pact_helper'

describe 'Courses', :pact do
  subject(:courses_api) { Helper::ApiClient::Courses.new }

  it 'should List Courses' 


  it 'should List Students' 


  it 'should List Teachers' 



  it 'should List TAs' 


  it 'should List Observers' 


  it 'should List Quizzes' 


  it 'should Delete a Course' 


  it 'should Create a Course' 


  it 'should Update a Course' 


  context 'Teacher not in a course' do
    it 'should Give a 401 response' 

  end
end

