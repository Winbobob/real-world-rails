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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')
require File.expand_path(File.dirname(__FILE__) + '/../../../lti_1_3_spec_helper')

describe Lti::Messages::ResourceLinkRequest do
  include_context 'lti_1_3_spec_helper'

  let(:return_url) { 'http://www.platform.com/return_url' }
  let(:opts) { { resource_type: 'course_navigation' } }
  let(:lti_assignment) { Lti::LtiAssignmentCreator.new(assignment).convert }
  let(:expander) do
    Lti::VariableExpander.new(
      course.root_account,
      course,
      nil,
      {
        current_user: user,
        tool: tool,
        assignment: assignment
      }
    )
  end
  let(:jwt_message) do
    Lti::Messages::ResourceLinkRequest.new(
      tool: tool,
      context: course,
      user: user,
      expander: expander,
      return_url: return_url,
      opts: opts
    )
  end
  let_once(:assignment) { assignment_model(course: course) }
  let_once(:user) { user_model(email: 'banana@test.com') }
  let_once(:course) do
    course_with_student
    @course
  end
  let(:tool) do
    tool = course.context_external_tools.new(
      name: 'bob',
      consumer_key: 'key',
      shared_secret: 'secret',
      url: 'http://www.example.com/basic_lti'
    )
    tool.course_navigation = {
      enabled: true,
      message_type: 'ResourceLinkRequest',
      selection_width: '500',
      selection_height: '400',
      custom_fields: {
        has_expansion: '$User.id',
        no_expansion: 'foo'
      }
    }
    tool.use_1_3 = true
    tool.developer_key = DeveloperKey.create!
    tool.save!
    tool
  end

  describe '#initialize' do
    let(:jws) { JSON::JWT.decode(jwt_message.generate_post_payload[:id_token], :skip_verification) }

    it 'adds public claims if the tool is public' 


    it 'does not add public claims if the tool is not public' 


    it 'adds include email claims if the tool is include email' 


    it 'does not add include email claims if the tool is not include email' 


    it 'adds include name claims if the tool is include name' 


    it 'does not add include name claims if the tool is not include name' 


    it 'adds private claims' 


    it 'adds security claims' 


    it 'sets the resource link id' 


    context 'when rlid claim group disabled' do
      let(:opts) { super().merge({claim_group_blacklist: [:rlid]}) }

      it 'does not set the resource link id' 

    end
  end

  describe '#generate_post_payload_for_assignment' do
    let(:outcome_service_url) { 'https://www.outcome-service-url.com' }
    let(:legacy_outcome_service_url) { 'https://www.legacy-outcome-service-url.com' }
    let(:lti_turnitin_outcomes_placement_url) { 'https://www.lti-turnitin-outcomes-placement-url.com' }

    let(:jws) do
      JSON::JWT.decode(
        jwt_message.generate_post_payload_for_assignment(
          assignment,
          outcome_service_url,
          legacy_outcome_service_url,
          lti_turnitin_outcomes_placement_url
        )[:id_token],
        :skip_verification
      )
    end

    it 'adds the lis_result_sourcedid' 


    it 'adds the lis_outcome_service_url' 


    it 'adds the ims_lis_basic_outcome_url' 


    it 'adds the outcome_data_values_accepted' 


    it 'adds the outcome_result_total_score_accepted' 


    it 'adds the outcome_submission_submitted_at_accepted' 


    it 'adds the outcomes_tool_placement_url' 


    it 'adds the canvas_assignment_id if the tool is public' 


    it 'does not add the canvas_assignment_id if the tool is not public' 


    it 'adds the canvas_assignment_title' 


    it 'adds the canvas_assignment_points_possible' 

  end

  describe '#generate_post_payload_for_homework_submission' do
    let(:jws) do
      JSON::JWT.decode(
        jwt_message.generate_post_payload_for_homework_submission(
          assignment
        )[:id_token],
        :skip_verification
      )
    end

    it 'adds the content_return_types' 


    it 'adds the content_file_extensions if the tool is public' 


    it 'does not add the canvas_assignment_id if the tool is not public' 


    it 'adds the canvas_assignment_title' 


    it 'adds the canvas_assignment_points_possible' 

  end
end

