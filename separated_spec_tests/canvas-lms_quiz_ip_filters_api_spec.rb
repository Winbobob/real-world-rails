#
# Copyright (C) 2013 Instructure, Inc.
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

describe Quizzes::QuizIpFiltersController, type: :request do

  before :once do
    course_with_teacher :active_all => true

    @quiz = Quizzes::Quiz.create!(:title => 'quiz', :context => @course)
    @quiz.save!
  end

  context 'index' do
    def get_index(raw = false, data = {})
      url = "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/ip_filters"
      params = { :controller => 'quizzes/quiz_ip_filters', :action => 'index',
                 :format => 'json', :course_id => @course.id.to_s,
                 :quiz_id => @quiz.id.to_s }

      if raw
        raw_api_call(:get, url, params, data)
      else
        api_call(:get, url, params, data)
      end
    end

    it 'should return an empty list' 


    it 'should list the active IP filter' 


    it 'should list available IP filters' 


    it 'should restrict access to itself' 


    context 'Pagination' do
      it 'should paginate' 


      it 'should return an empty array with a cursor past the end' 


      it 'should bail out on an invalid cursor' 

    end

    context 'Rendering IP Filter objects' do
      it 'should render' 


      context 'JSON-API compliance' do
        it 'should render as JSON-API' 

      end
    end
  end
end

