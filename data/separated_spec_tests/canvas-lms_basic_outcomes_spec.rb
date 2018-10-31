#
# Copyright (C) 2013 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

require 'nokogiri'

describe BasicLTI::BasicOutcomes do
  before(:each) do
    course_model
    @root_account = @course.root_account
    @account = account_model(:root_account => @root_account, :parent_account => @root_account)
    @course.update_attribute(:account, @account)
    @user = factory_with_protected_attributes(User, :name => "some user", :workflow_state => "registered")
    @course.enroll_student(@user)
  end

  let(:tool) do
    @course.context_external_tools.create(:name => "a", :url => "http://google.com", :consumer_key => '12345', :shared_secret => 'secret')
  end

  let(:assignment) do
    @course.assignments.create!(
      {
          title: "value for title",
          description: "value for description",
          due_at: Time.now,
          points_possible: "1.5",
          submission_types: 'external_tool',
          external_tool_tag_attributes: {url: tool.url}
      }
    )
  end

  let(:source_id) {gen_source_id}

  def gen_source_id(t: tool, c: @course, a: assignment, u: @user)
    tool.shard.activate do
      payload = [t.id, c.id, a.id, u.id].join('-')
      "#{payload}-#{Canvas::Security.hmac_sha1(payload, tool.shard.settings[:encryption_key])}"
    end
  end

  let(:xml) do
    Nokogiri::XML.parse %Q{
      <?xml version = "1.0" encoding = "UTF-8"?>
      <imsx_POXEnvelopeRequest xmlns = "http://www.imsglobal.org/services/ltiv1p1/xsd/imsoms_v1p0">
        <imsx_POXHeader>
          <imsx_POXRequestHeaderInfo>
            <imsx_version>V1.0</imsx_version>
            <imsx_messageIdentifier>999999123</imsx_messageIdentifier>
          </imsx_POXRequestHeaderInfo>
        </imsx_POXHeader>
        <imsx_POXBody>
          <replaceResultRequest>
            <resultRecord>
              <sourcedGUID>
                <sourcedId>#{source_id}</sourcedId>
              </sourcedGUID>
              <result>
                <resultScore>
                  <language>en</language>
                  <textString>0.92</textString>
                </resultScore>
                <resultData>
                  <text>text data for canvas submission</text>
                </resultData>
              </result>
            </resultRecord>
          </replaceResultRequest>
        </imsx_POXBody>
      </imsx_POXEnvelopeRequest>
    }
  end

  context "Exceptions" do
    it "BasicLTI::BasicOutcomes::Unauthorized should have 401 status" 


    it "BasicLTI::BasicOutcomes::InvalidRequest should have 415 status" 

  end

  describe ".decode_source_id" do
    it 'successfully decodes a source_id' 


    it 'throws Invalid sourcedid if sourcedid is nil' 


    it 'throws Invalid sourcedid if sourcedid is empty' 


    it 'throws Invalid signature if the signature is invalid' 


    it "throws 'Tool is invalid' if the tool doesn't match" 


    it "throws Course is invalid if the course doesn't match" 


    it "throws User is no longer in course isuser enrollment is missing" 


    it "throws Assignment is invalid if the Addignment doesn't match" 


    it "throws Assignment is no longer associated with this tool if tool is deleted" 


    it "throws Assignment is no longer associated with this tool if tool doesn't match the url" 


    it "throws Assignment is no longer associated with this tool if tag is missing" 


    context "jwt sourcedid" do
      before do
        dynamic_settings = {
          "lti-signing-secret" => 'signing-secret-vp04BNqApwdwUYPUI',
          "lti-encryption-secret" => 'encryption-secret-5T14NjaTbcYjc4'
        }
        allow(Canvas::DynamicSettings).to receive(:find) { dynamic_settings }
      end

      let(:jwt_source_id) do
        BasicLTI::Sourcedid.new(tool, @course, assignment, @user).to_s
      end

      it "decodes a jwt signed sourcedid" 


      it 'throws invalid JWT if token is unrecognized' 


    end
  end

  describe "#handle_request" do
    it "sets the response body when an invalid sourcedId is given" 

  end

  describe "#handle_replaceResult" do
    it "accepts a grade" 


    it "rejects a grade for an assignment with no points possible" 


    it "doesn't explode when an assignment with no points possible receives a grade for an existing submission " 


    it 'handles tools that have a url mismatch with the assignment' 


    it "accepts a result data without grade" 


    it "fails if neither result data or a grade is sent" 


    it "sets submitted_at to now if resultData is not present" 


    context 'with submitted_at details' do
      let(:timestamp) { 1.day.ago.iso8601(3) }

      it "sets submitted_at to submitted_at details if resultData is not present" 


      it "sets submitted_at to submitted_at details if resultData is present" 


      context 'with timestamp in future' do
        let(:timestamp) { Time.zone.now }

        it 'returns error message for timestamp more than one minute in future' 


        it 'does not create submission' 

      end

      context 'with invalid timestamp' do
        let(:timestamp) { 'a' }

        it 'returns error message for invalid timestamp' 


        it 'does not create submission' 

      end
    end

    it 'accepts LTI launch URLs as a data format with a specific submission type' 


    context "submissions" do

      it "creates a new submissions if there isn't one" 


      it 'creates a new submission of type "external_tool" when a grade is passed back without a submission' 


      it "sets the submission type to external tool if the existing submission_type is nil" 


      it "creates a new submission if result_data_text is sent" 


      it "creates a new submission if result_data_url is sent" 


      it "creates a new submission if result_data_launch_url is sent" 


      it "creates a new submission if result_data_download_url is sent" 


      it "doesn't change the submission type if only the score is sent" 

    end
  end
end

