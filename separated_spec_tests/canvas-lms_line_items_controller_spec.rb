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

require File.expand_path(File.dirname(__FILE__) + '/../../api_spec_helper')
require_dependency "lti/ims/line_items_controller"

module Lti
  module Ims
    RSpec.describe LineItemsController, type: :request do
      let(:course) { course_model }
      let(:resource_link) { resource_link_model(overrides: {resource_link_id: assignment.lti_context_id}) }
      let(:assignment) { assignment_model(course: course) }
      let(:parsed_response_body) { JSON.parse(response.body) }
      let(:label) { 'Originality Score' }
      let(:tag) { 'some_tag' }
      let(:resource_id) { 'orig-123' }
      let(:score_max) { 50 }
      let(:request_headers) { {} }

      let(:url) do
        Rails.application.routes.url_helpers.lti_line_item_edit_path(
          course_id: course.id,
          id: line_item.id
        )
      end

      shared_examples 'external tool check' do
        context 'when owned by the tool' do
          it 'is allowed to access'
        end

        context 'when not owned by the tool' do
          it 'is not allowed to access'
        end
      end

      describe '#create' do
        let(:line_item_create_params) do
          {
            scoreMaximum: score_max,
            label: label,
            resourceId: resource_id,
            tag: tag,
            ltiLinkId: assignment.lti_context_id
          }
        end

        let(:url) { Rails.application.routes.url_helpers.lti_line_item_create_path(course_id: course.id) }

        before do
          resource_link.line_items.create!(
            score_maximum: 1,
            label: 'Canvas Created',
            assignment: assignment
          )
        end

        it_behaves_like 'external tool check'

        shared_examples 'the line item create endpoint' do
          let(:create_params) { raise 'set in example' }

          it 'creates a new line' 


          it 'responds with 404 if course is concluded' 


          it 'responds with the line item mime type' 

        end

        context 'when using the declarative model' do
          it_behaves_like 'the line item create endpoint' do
            let(:create_params) { line_item_create_params }
          end

          it 'properly formats the response' 


          it 'associates the line item with the correct assignment' 


          it 'associates the line item with the correct resource link' 


          it 'does not create a new assignment' 


          it 'renders precondition failed if ResourceLink has no LineItems' 


          it 'renders not found if no matching ResourceLink for the specified ltiLinkId' 


          it 'renders unauthorized if the tool is not associated with the requested resource link'
        end

        context 'when using the uncoupled model' do
          let(:uncoupled_line_item_params) { line_item_create_params.except(:ltiLinkId) }

          it_behaves_like 'the line item create endpoint' do
            let(:create_params) { uncoupled_line_item_params }
          end

          it 'properly formats the response' 


          it 'creates a new assignment' 


          context 'when a new assignment is created' do
            before do
              post url, params: uncoupled_line_item_params, headers: request_headers
              body = parsed_response_body
              @item = Lti::LineItem.find(body['id'].split('/').last)
            end

            it 'sets the score maximum on the new assignment' 


            it 'sets the submission type on the new assignment' 


            it 'sets the name for the assignment' 


            it 'sets the context of the new assignment' 

          end

          it 'renders unauthorized if the tool lacks the required permission to create line items'
        end
      end

      describe '#update' do
        let(:line_item) do
          line_item_model(
            assignment: assignment,
            resource_link: resource_link
          )
        end

        it_behaves_like 'external tool check'

        it 'updates the score maximum' 


        it 'updates the label' 


        it 'does not update the assignment name if not the default line item' 


        it 'updates the assignment name if ResourceLink is absent' 


        it 'updates the assignment name if default line item' 


        it 'updates the resourceId' 


        it 'updates the tag' 


        it 'responds with precondition failed message if a non-matching ltiLinkId is included' 


        it 'includes an error message if a non-mataching ltiLinkId is included' 


        it 'correctly formats the requested line item' 

      end

      describe '#show' do
        let!(:line_item) do
          line_item_model(
            assignment: assignment,
            resource_link: resource_link,
            tag: tag,
          )
        end

        it_behaves_like 'external tool check'

        it 'correctly formats the requested line item' 


        it 'responds with 404 if the line item is not found in the course' 


        it 'responds with 404 if the line item does not exist' 


        it 'responds with 404 if the course does not exist' 


        it 'responds with the line item mime type' 

      end

      describe '#index' do
        let(:url) do
          Rails.application.routes.url_helpers.lti_line_item_index_path(
            course_id: course.id,
          )
        end

        # The following "let!" declarations are used to provide a
        # diverse pool of line items when testing the queries in
        # the specs that follow.
        let!(:line_item) do
          line_item_model(
            assignment: assignment
          )
        end

        let!(:line_item_with_tag) do
          line_item_model(
            assignment: assignment,
            tag: tag
          )
        end

        let!(:line_item_with_resource_id) do
          line_item_model(
            assignment: assignment,
            resource_id: resource_id
          )
        end

        let!(:line_item_with_lti_link_id) do
          line_item_model(
            assignment: assignment,
            resource_link: resource_link
          )
        end

        let(:line_item_list) do
          parsed_response_body.map { |li| LineItem.find(li['id'].split('/').last) }
        end

        it_behaves_like 'external tool check'

        it 'responds with 404 if context does not exist' 


        it 'includes all associated line items in the course' 


        it 'correctly queries by tag' 


        it 'correctly queries by resource_id' 


        it 'correctly queries by lti_link_id' 


        it 'allows querying by multiple valid fields at the same time' 


        it 'responds with the correct mime type' 


        it 'includes pagination headers' 

      end

      describe 'destroy' do
        it_behaves_like 'external tool check'

        shared_examples 'the line item destroy endpoint' do
          let(:line_item) { raise 'override in spec' }

          it 'deletes the correct line item' 


          it 'responds with no content' 

        end

        context 'when using the coupled model' do
          let(:coupled_line_item) do
            line_item_model(
              assignment: assignment,
              resource_link: resource_link,
              tag: tag,
              resource_id: resource_id
            )
          end

          let!(:second_line_item) do
            line_item_model(
              assignment: assignment,
              resource_link: resource_link,
              tag: tag,
              resource_id: resource_id
            )
          end

          it_behaves_like 'the line item destroy endpoint' do
            let(:line_item) do
              coupled_line_item
            end
          end

          it 'does not allow destroying default line items' 

        end

        context 'when using the uncoupled model' do
          it_behaves_like 'the line item destroy endpoint' do
            let(:line_item) do
              line_item_model(
                assignment: assignment,
                tag: tag,
                resource_id: resource_id
              )
            end
          end
        end
      end
    end
  end
end

