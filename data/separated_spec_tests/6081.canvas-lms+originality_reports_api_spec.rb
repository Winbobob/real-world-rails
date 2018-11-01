#
# Copyright (C) 2011 - 2016 Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper')
require_dependency "lti/ims/access_token_helper"

module Lti
  describe 'Originality Reports API', type: :request do
    specs_require_sharding

    include_context 'lti2_api_spec_helper'
    let(:service_name) { OriginalityReportsApiController::ORIGINALITY_REPORT_SERVICE }
    let(:aud) { host }
    before(:once) { attachment_model }
    before :each do
      course_factory(active_all: true)
      message_handler.update_attributes(message_type: 'basic-lti-launch-request')
      student_in_course active_all: true
      teacher_in_course active_all: true

      allow_any_instance_of(AssignmentSubscriptionsHelper).to receive(:create_subscription) { SecureRandom.uuid }
      allow_any_instance_of(AssignmentSubscriptionsHelper).to receive(:destroy_subscription) { {} }

      @tool = @course.context_external_tools.create(name: "a",
                                                    domain: "google.com",
                                                    consumer_key: '12345',
                                                    shared_secret: 'secret')
      @tool.settings[:assignment_configuration] = {:url => "http://www.example.com", :icon_url => "http://www.example.com", :selection_width => 100, :selection_height => 100}.with_indifferent_access
      @tool.save!
      @assignment = @course.assignments.create!(title: "some assignment",
                                                assignment_group: @group,
                                                points_possible: 12,
                                                tool_settings_tool: @tool)

      @assignment.tool_settings_tool = message_handler
      @assignment.save!
      @attachment.context = @student
      @attachment.save!

      @submission = @assignment.submit_homework(@student, attachments: [@attachment])

      @endpoints = {
        create: "/api/lti/assignments/#{@assignment.id}/submissions/#{@submission.id}/originality_report"
      }

      allow_any_instance_of(Account).to receive(:feature_enabled?).with(:plagiarism_detection_platform).and_return(true)
    end

    describe 'service definition' do
      it 'uses the correct endpoint' 

    end

    describe "GET assignments/:assignment_id/originality_report/submissions/:submission_id/:id (#show)" do
      before :each do
        report_initial_values = {
          attachment: @attachment,
          originality_score: 0.5,
          submission: @submission
        }
        @report = OriginalityReport.create!(report_initial_values)
        @endpoints[:show] = "/api/lti/assignments/#{@assignment.id}/submissions/#{@submission.id}/originality_report/#{@report.id}"
        @endpoints[:alt_show] = "/api/lti/assignments/#{@assignment.id}/files/#{@attachment.id}/originality_report"
        @assignment.course.update_attributes(account: tool_proxy.context)
      end

      it "requires an lti access token" 


      it "requires the tool proxy to be associated to the assignment" 


      it "allows tool proxies with matching access" 


      it "returns an originality report in the response" 


      it "returns the specified originality report in the response" 


      it "checks that the specified originality report exists" 


      it "checks that the specified submission exists" 


      it "requires the plagiarism feature flag" 


      it "verifies the specified attachment is in the course" 


      it "verifies that the specified submission includes the attachment" 


      context "show by attachment id" do
        it "requires an lti access token" 


        it "requires the tool proxy to be associated to the assignment" 


        it "allows tool proxies with matching access" 


        it "returns an originality report in the response" 


        it "returns the specified originality report in the response" 


        it "checks that the specified originality report exists" 


        it "checks that the specified submission exists" 


        it "requires the plagiarism feature flag" 


        it "verifies the specified attachment is in the course" 


        it "verifies that the specified submission includes the attachment" 

      end
    end

    describe "PUT assignments/:assignment_id/originality_report (#update)" do
      before :each do
        report_initial_values = {
          attachment: @attachment,
          originality_score: 0.5,
          submission: @submission
        }
        @report = OriginalityReport.create!(report_initial_values)
        @endpoints[:update] = "/api/lti/assignments/#{@assignment.id}/submissions/#{@submission.id}/originality_report/#{@report.id}"
        @endpoints[:update_alt] = "/api/lti/assignments/#{@assignment.id}/files/#{@attachment.id}/originality_report"
        @assignment.course.update_attributes(account: account)
      end

      it "requires the tool proxy to be associated to the assignment" 


      it "checks that the OriginalityReport exists" 


      it "checks that the Submission exists" 


      it "updates originality score" 


      it "does not update originality score if out of range" 


      it "allows setting the originality_report to nil" 


      it "updates originality report attachment id" 


      it "updates originality report url" 


      it "updates the associated resource_url" 


      it "does not remove the lti link when tool_setting is not supplied" 


      it "removes the lti link when tool_setting is null" 


      it "requires the plagiarism feature flag" 


      it "verifies the report is in the same context as the assignment" 


      it "verifies that the specified submission includes the attachment" 


      it 'sets the resource type code for the associated tool setting' 


      it 'sets the workflow state' 


      it 'sets the resource_url of the associated tool setting' 


      context "update by attachment id" do
        before { AttachmentAssociation.create!(attachment: @attachment, context: @submission) }

        it "requires the tool proxy to be associated to the assignment" 


        it "checks that the OriginalityReport exists" 


        it "checks that the Submission exists" 


        it "updates originality score" 


        it "does not update originality score if out of range" 


        it "allows setting the originality_report to nil" 


        it "updates originality report attachment id" 


        it "updates originality report url" 


        it "updates the associated resource_url" 


        it "requires the plagiarism feature flag" 


        it "verifies the report is in the same context as the assignment" 


        it "verifies that the specified submission includes the attachment" 


        it 'sets the resource type code for the associated tool setting' 


        it 'sets the workflow state' 


        it 'sets the resource_url of the associated tool setting' 

      end
    end

    describe "POST assignments/:assignment_id/submissions/:submission_id/originality_report (#create)" do
      before do
        @assignment.course.update_attributes(account: account)
      end

      it "creates an originality report when provided required params" 


      it "includes expected keys in JSON response" 


      it "checks for required params" 


      it "checks that the specified assignment exists" 


      it "checks that the specified file exists" 


      it "requires the tool proxy to be associated to the assignment" 


      it "verifies the specified attachment is in the course" 


      it "verifies that the specified submission includes the attachment" 


      it "does not require an attachment if submission type includes online text entry" 


      it "does not requre an attachment if submission type does not include online text entry" 


      it 'sets the resource type code of the associated tool setting' 


      it 'sets the workflow state' 


      it 'allows creating reports for any attachment in submission history' 


      it 'sets the link_id resource_url' 


      it 'updates the originality report if it has already been created' 


      it 'updates the originality report if it has already been created without an attachment' 


      context "optional params" do
        before :each do

          report_file = @attachment.dup
          report_file.save!

          @report = {
            file_id: @attachment.id,
            originality_score: 0.5,
            originality_report_file_id: report_file.id,
            originality_report_url: 'http://www.report-url.com',
            originality_report_lti_url: 'http://www.report-lti-url.com'
          }

          post @endpoints[:create], params: {originality_report: @report}, headers: request_headers
          @response_hash = JSON.parse response.body
        end

        it "sets the attachment" 

      end

      context 'when group assignment' do
        let!(:original_assignment) { @assignment }
        let(:user_one) { submission_one.user }
        let(:user_two) { submission_two.user }
        let(:course) { submission_one.assignment.course }
        let(:submission_one) { submission_model({course: original_assignment.course, assignment: original_assignment}) }
        let(:submission_two) { submission_model({course: original_assignment.course, assignment: original_assignment}) }
        let(:submission_three) { submission_model({course: original_assignment.course, assignment: original_assignment}) }
        let!(:group) do
          group = course.groups.create!(name: 'group one')
          group.add_user(user_one)
          group.add_user(user_two)
          submission_one.update!(group: group)
          submission_two.update!(group: group)
          group
        end
        let(:create_endpoint) do
          "/api/lti/assignments/#{submission_one.assignment.id}/submissions/#{submission_one.id}/originality_report"
        end
        let(:originality_score) { 33 }

        before do
          submission_one.assignment.update!(submission_types: 'online_text_entry')
          submission_two.update!(
            assignment_id: submission_one.assignment_id,
            group_id: submission_one.group_id
          )
        end

        it 'copies the report to all other submissions in the group' 


        it 'does not copy the report to submissions outside the group' 

      end

      def api_create_originality_report(file_id, score)
        api_call(
          :post,
          "/api/lti/assignments/#{@assignment.id}/submissions/#{@submission.id}/originality_report",
          {
            controller: 'originality_reports_api',
            action: 'create',
            format: 'json',
            assignment_id: @assignment.id,
            submission_id: @submission.id
          },
          {
            originality_report: {
              originality_score: score,
              file_id: file_id
            }
          },
          request_headers
        )
      end
    end
  end
end

