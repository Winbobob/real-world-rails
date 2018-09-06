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
require_dependency "lti/users_api_controller"
module Lti
  describe UsersApiController, type: :request do
    include_context 'lti2_api_spec_helper'

    let(:authorized_services) do
      [
        {"service"=>"vnd.Canvas.User", "action"=>["GET"], "@type"=>"RestServiceProfile"},
        {"service"=>"vnd.Canvas.GroupIndex", "action"=>["GET"], "@type"=>"RestServiceProfile"}
      ]
    end

    let(:assignment) do
      a = course.assignments.new(:title => "some assignment")
      a.workflow_state = "published"
      a.tool_settings_tool = message_handler
      a.save!
      a
    end

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
      let(:service_name) { UsersApiController::USER_SERVICE }
      let(:canvas_id_endpoint) { "/api/lti/users/#{student.id}" }
      let(:student) do
        course_with_student(active_all: true, course: course)
        @student.update_attributes(lti_context_id: SecureRandom.uuid)
        @student
      end
      let(:expected_student) do
        {
          "id" => student.id,
          "name" => student.name,
          "sortable_name" => student.sortable_name,
          "short_name" => student.short_name,
          "lti_id" =>  student.lti_context_id
        }
      end

      it 'verifies the tool has the required services' 


      it "verifies the tool is associated with at least one of the user's assignments" 


      it 'does not grant access if the tool and the user have not associated assignments' 


      context 'course' do
        before do
          tool_proxy.update_attributes!(context: course)
        end

        it 'returns a user by lti id' 


        it 'returns a user by Canvas id' 

      end

      context 'account' do
        it 'returns a user by lti id' 


        it 'returns a user by Canvas id' 

      end
    end

    describe '#group_index' do
      include Api::V1::User

      let(:service_name) { UsersApiController::USER_SERVICE }
      let(:course) { course_model }
      let(:group) { group_model(context: course) }
      let(:group_index_endpoint) { "/api/lti/groups/#{group.global_id}/users" }
      let(:student_lti_id) { SecureRandom.uuid }

      let(:student_one) do
        student_in_course(course: group.context)
        @student.update_attributes!(lti_context_id: student_lti_id)
        @student
      end

      let(:student_two) do
        student_in_course(course: group.context)
        @student
      end

      let(:student_three) do
        student_in_course(course: group.context)
        @student.update_attributes!(email: 'student@test.com')
        @student
      end

      before do
        group.context.update_attributes!(account: tool_proxy.account)
        group.add_user(student_one, 'accepted')
        group.add_user(student_two, 'accepted')
        group.add_user(student_three, 'accepted')
      end

      it 'returns a list of users in the specified group' 


      it 'responds with 401 if group is not in tool context' 


      it 'responds with 401 if the group is not active' 


      it 'responds with 404 if group is not found' 


      it 'includes user lti id' 


      it 'does not include students who are not in the group' 

    end
  end
end

