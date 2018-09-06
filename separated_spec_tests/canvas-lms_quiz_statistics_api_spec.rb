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

require File.expand_path(File.dirname(__FILE__) + '/../../api_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../../models/quizzes/quiz_statistics/item_analysis/common')

describe Quizzes::QuizStatisticsController, type: :request do

  def api_index(options={}, data={})
    url = "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/statistics"
    params = { controller: 'quizzes/quiz_statistics',
               action: 'index',
               format: 'json',
               course_id: @course.id.to_s,
               quiz_id: @quiz.id.to_s }
    headers = { 'Accept' => 'application/vnd.api+json' }

    if options[:raw]
      raw_api_call(:get, url, params, data, headers)
    else
      api_call(:get, url, params, data, headers)
    end
  end

  before :once do
    course_with_teacher :active_all => true

    teacher = @user

    simple_quiz_with_submissions %w{T T T}, %w{T T T}, %w{T F F}, %w{T F T},
      :user => @user,
      :course => @course

    @user = teacher
  end

  describe 'GET /courses/:course_id/quizzes/:quiz_id/statistics [index]' do
    it 'should generate statistics implicitly, never return an empty list' 


    it 'should deny unauthorized access' 


    it 'should respect the all_versions parameter' 


    it 'should render' 

    it "should return :no_content for large quizzes" 


    context 'JSON-API compliance' do
      it 'should conform to the JSON-API spec when returning the object' 

    end
  end
end

