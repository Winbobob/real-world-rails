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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require_dependency "lti/ims/results_controller"

describe Lti::Ims::ResultsController do
  let_once(:course) { course_factory(active_course: true) }
  let_once(:assignment) { assignment_model context: course}
  let_once(:result) { lti_result_model assignment: assignment }
  let(:json) { JSON.parse(response.body) }

  shared_examples 'mime_type check' do
    it 'does not return ims mime_type' 

  end

  shared_examples 'unauthorized' do
    it_behaves_like 'mime_type check'

    xit 'returns 401 unauthorized' do
      expect(response).to have_http_status :unauthorized
    end
  end

  shared_examples 'response check' do
    let(:action) { raise 'Override in spec'}
    let(:course_id) { assignment.context.id }
    let(:params_overrides) { {} }

    before do
      get action, params: { course_id: course_id, line_item_id: result.lti_line_item_id }.merge(params_overrides)
    end

    it 'returns correct mime_type' 


    it 'returns 200 success' 


    context 'with unknown course' do
      let(:course_id) { Course.maximum(:id) + 1 }

      it_behaves_like 'mime_type check'

      it 'returns 404 not found' 

    end

    xcontext 'with course not in scope of tool' do
      let(:course_id) { course_model.id }

      it_behaves_like 'unauthorized'
    end

    xcontext 'with capabilities not in scope of tool' do
      # TODO: update scopes in before block

      it_behaves_like 'unauthorized'
    end
  end

  describe '#index' do
    it_behaves_like 'response check' do
      let(:action) { :index }
    end

    before_once do
      8.times { lti_result_model line_item: result.line_item, assignment: assignment }
    end

    it 'returns a collection of results' 


    it 'formats the results correctly' 


    context 'with user_id in params' do
      it 'returns a single result' 


      it 'returns the user result' 


      context 'with non-existent user' do
        it 'returns an empty array' 

      end

      context 'with no result for user' do
        it 'returns an empty array' 

      end

      context 'with user not in course' do
        it 'returns empty array' 

      end

      context 'with user not a student' do
        it 'returns empty array' 

      end
    end

    context 'with limit in params' do
      it 'honors the limit' 


      it 'provides the pagination headers' 

    end
  end

  describe '#show' do
    it_behaves_like 'response check' do
      let(:action) { :show }
      let(:params_overrides) { { id: result.id } }
    end

    it 'returns the result' 


    it 'formats the result correctly' 


    context 'when result requested not in line_item' do
      it 'returns a 404' 

    end

    context 'when result does not exist' do
      it 'returns a 404' 

    end
  end
end

