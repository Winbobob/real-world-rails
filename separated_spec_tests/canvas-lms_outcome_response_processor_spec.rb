#
# Copyright (C) 2015 - present Instructure, Inc.
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

require 'active_support/dependencies'
require_dependency "turnitin/outcome_response_processor"
require File.expand_path(File.dirname(__FILE__) + '/turnitin_spec_helper')
require 'turnitin_api'
module Turnitin
  describe OutcomeResponseProcessor do
    before do
      allow(BasicLTI::Sourcedid).to receive(:encryption_secret) {'encryption-secret-5T14NjaTbcYjc4'}
      allow(BasicLTI::Sourcedid).to receive(:signing_secret) {'signing-secret-vp04BNqApwdwUYPUI'}
    end

    include_context "shared_tii_lti"
    subject { described_class.new(tool, lti_assignment, lti_student, outcome_response_json) }

    describe '#process' do
      let(:filename) {'my_sample_file'}

      before(:each) do
        original_submission_response = double('original_submission_mock')
        allow(original_submission_response).to receive(:headers).and_return(
            {'content-disposition' => "attachment; filename=#{filename}", 'content-type' => 'plain/text'}
        )
        allow(original_submission_response).to receive(:body).and_return('1234')
        expect_any_instance_of(TurnitinApi::OutcomesResponseTransformer).to receive(:original_submission).and_yield(original_submission_response)

        response_response = double('response_mock')
        allow(response_response).to receive(:body).and_return(tii_response)
        allow_any_instance_of(TurnitinApi::OutcomesResponseTransformer).to receive(:response).and_return(response_response)
      end

      it 'creates an attachment' 


      it 'sets the turnitin status to pending' 


      it 'sets the submission submitted_at if not nil' 


      it 'does not set the submission submitted_at if nil' 

    end

    describe "#process with request errors" do
      context 'when it is not the last attempt' do
        it 'does not create an error attachment' 


        it 'creates a new job' 

      end

      context 'when it is the last attempt' do
        it 'creates an attachment for "Errors::ScoreStillPendingError"' 


        it 'creates an attachment for "Faraday::TimeoutError"' 


        it 'creates an attachment for "Errno::ETIMEDOUT"' 


        it 'creates an attachment for "Faraday::ConnectionFailed"' 

      end
    end

    describe "#update_originality_data" do
      it 'raises an error if max attempts are not exceeded' 


      it 'sets an error message if max attempts are exceeded' 

    end
  end
end

