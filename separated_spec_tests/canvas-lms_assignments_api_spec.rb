#
# Copyright (C) 2017 - present Instructure, Inc.
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


require File.expand_path(File.dirname(__FILE__) + '/lti2_api_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

require_dependency "lti/ims/access_token_helper"
require_dependency "lti/assignments_api_controller"
module Lti
  describe AssignmentsApiController, type: :request do
    include_context 'lti2_api_spec_helper'

    before do
      allow_any_instance_of(AssignmentSubscriptionsHelper).to receive(:create_subscription) { SecureRandom.uuid }
      allow_any_instance_of(AssignmentSubscriptionsHelper).to receive(:destroy_subscription) { {} }
      message_handler.update_attributes(capabilities: [Lti::ResourcePlacement::SIMILARITY_DETECTION_LTI2])
      tool_proxy.raw_data['security_contract']['tool_service'] = authorized_services
      tool_proxy.save!
      assignment.tool_settings_tool = message_handler
      assignment.save!
    end

    describe '#show' do
      let(:service_name) { AssignmentsApiController::ASSIGNMENT_SERVICE }
      let(:endpoint) { "/api/lti/assignments" }
      let(:authorized_services) do
        [{"service"=>"vnd.Canvas.Assignment", "action"=>["GET"], "@type"=>"RestServiceProfile"}]
      end
      let(:student) do
        student = create_users_in_course(course, 2, return_type: :record).first
        student.update_attributes(lti_context_id: SecureRandom.uuid)
        student
      end
      let(:assignment) do
        a = course.assignments.new(title: "some assignment", points_possible: 10, description: '<p>Dude...</p>', due_at: DateTime.now)
        a.workflow_state = "published"
        a.tool_settings_tool = message_handler
        a.save!
        a
      end
      let(:expected_assignment) do
        {
          "id" => assignment.id,
          "name" => assignment.name,
          "description" => assignment.description,
          "due_at" => assignment.due_at.iso8601,
          "points_possible" => assignment.points_possible,
          "lti_id" =>  assignment.lti_context_id,
          "lti_course_id" => Lti::Asset.opaque_identifier_for(assignment.context)
        }
      end

      it 'verifies the tool has the required services' 


      it "verifies the tool is associated with the assignment" 


      it 'verifies the user is associated with the assignment' 


      it 'returns 404 when the assignment cannot be found' 


      it 'returns 404 when the user cannot be found' 


      it 'returns an assignment by lti id' 


      it 'returns an assignment by Canvas id' 


      it 'returns an assignment with user lti id' 


      it 'returns an assignment with user Canvas id' 


      it 'returns an assignment that is differentiated by user' 

    end
  end
end

