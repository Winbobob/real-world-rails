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
require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper')

require_dependency "lti/ims/access_token_helper"
require_dependency "lti/submissions_api_controller"
module Lti
  describe SubmissionsApiController, type: :request do
    specs_require_sharding
    include_context 'lti2_api_spec_helper'

    let(:service_name) { SubmissionsApiController::SUBMISSION_SERVICE }

    let(:submission) do
      assignment.submit_homework(student, submission_type: 'online_upload',
                                 attachments: [attachment])
    end

    let(:mock_file) do
      stub_file_data('myfile.txt', nil, "plain/txt")
    end

    let(:attachment) do
      student.attachments.create! uploaded_data: dummy_io, filename: 'doc.doc', display_name: 'doc.doc', context: student
    end

    let(:assignment) do
      a = course.assignments.new(:title => "some assignment")
      a.workflow_state = "published"
      a.tool_settings_tool = message_handler
      a.save!
      a
    end

    let(:student) { course_with_student(active_all: true, course: course); @user }

    let(:aud) { host }

    let(:other_tool_proxy) do
      tp = tool_proxy.dup
      tp.update_attributes(guid: other_tp_guid)
      tp
    end

    let(:other_tp_guid) { SecureRandom.uuid }

    before do
      mock_sub_helper = instance_double("Lti::AssignmentSubscriptionsHelper",
                                        create_subscription: "123",
                                        destroy_subscription: nil)
      allow(Lti::AssignmentSubscriptionsHelper).to receive(:new).and_return(mock_sub_helper)
      tool_proxy.raw_data['enabled_capability'] << ResourcePlacement::SIMILARITY_DETECTION_LTI2
      tool_proxy.save!
    end

    RSpec.shared_examples "authorization" do
      it "returns a 401 if no auth token" 


      it "returns a 401 if the tool doesn't have a similarity detection placement" 


      it "returns a 401 if the tool is not associated with the assignment" 


      it "returns a 401 if the tool is not in the context" 


      it "allows tool proxies with matching access" 


    end

    describe "#show" do
      let(:endpoint) { "/api/lti/assignments/#{assignment.id}/submissions/#{submission.id}" }
      include_examples "authorization"

      it "returns a submission json object" 


      it 'uses global ids in the attachment download URL' 


      it 'includes the eula agreement timestamp if present' 

    end

    describe "#history" do

      let(:endpoint) { "/api/lti/assignments/#{assignment.id}/submissions/#{submission.id}/history" }
      include_examples "authorization"
      it "returns the submission history as an array of JSON objects" 


      it "sends back versioned attachments" 

    end

    describe "#attachment" do

      let(:endpoint) { "/api/lti/assignments/#{assignment.id}/submissions/#{submission.id}/attachment/#{attachment.id}" }
      include_examples 'authorization'

      it "allows a user to download a file" 


      it "returns a 401 if the attachment isn't associated to the assignment" 


      context 'sharding' do
        it 'retrieves attachments when tool proxy is installed on another shard' 

      end

    end

    describe 'service' do
      it 'has the correct endpoint for submission service' 


      it 'has the correct endpoint for submission history service' 

    end

  end
end

