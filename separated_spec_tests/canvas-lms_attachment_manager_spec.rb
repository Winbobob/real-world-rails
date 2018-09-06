#
# Copyright (C) 2016 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/turnitin_spec_helper')
require 'turnitin_api'
module Turnitin
  describe AttachmentManager do
    include_context "shared_tii_lti"
    before(:each) do
      allow(TiiClient).to receive(:new).with(lti_student, lti_assignment, tool, outcome_response_json).and_return(tii_client)
    end

    describe '.create_attachment' do
      it 'creates an attachment' 


      it 'uses the filename from the tii client and replaces forward slashes with dashes' 


      it 'assigns the correct user' 


    end

    describe '.update_attachment' do
      let(:submission) do
        sub = lti_assignment.submit_homework(
          lti_student,
          attachments: [attachment],
          submission_type: 'online_upload',
        )
        sub.turnitin_data = {attachment.asset_string => {outcome_response: outcome_response_json}}
        sub.save!
        sub
      end

      it 'updates the submission' 


      it 'works when there is only a url in the content_tag' 


    end

  end
end

