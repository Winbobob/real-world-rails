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
  describe TiiClient do
    include_context "shared_tii_lti"
    subject{described_class.new(lti_student, lti_assignment, tool, {})}

    describe ".new" do

      it 'set the user_id to the opaque identifier' 


      it 'set the context_id to the opaque identifier' 


      it 'set the context_title to the context Title' 


      it 'set the lis_person_contact_email_primary to the users email' 


    end



    describe ".turnitin_data" do
      let(:originality_data) do
        {
          "numeric" => {
            "score" => '1.2'
          },
          "breakdown" => {
            "internet_score" => '2.3',
            "publications_score" => '3.2',
            "submitted_works_score" => '4.2'
          }
        }
      end
      let(:originality_report_url) {"http://example.com/report"}

      before :each do
        allow(subject).to receive(:originality_data).and_return(originality_data)
        allow(subject).to receive(:originality_report_url).and_return(originality_report_url)
      end

      it "sets the similarity_score" 


      it "sets the web_overlap" 


      it "sets the publication_overlap" 


      it "sets the student_overlap" 


      it "sets the state" 


      it "sets the status to scored" 


    end

  end
end

