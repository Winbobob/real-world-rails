#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../apis/api_spec_helper')

require 'nokogiri'

describe LtiApiController, type: :request do
  before :once do
    course_with_student(:active_all => true)
    @student = @user
    @course.enroll_teacher(user_with_pseudonym(:active_all => true))
    @tool = @course.context_external_tools.create!(:shared_secret => 'test_secret', :consumer_key => 'test_key', :name => 'my grade passback test tool', :domain => 'example.com')
    assignment_model(:course => @course, :name => 'tool assignment', :submission_types => 'external_tool', :points_possible => 20, :grading_type => 'points')
    tag = @assignment.build_external_tool_tag(:url => "http://example.com/one")
    tag.content_type = 'ContextExternalTool'
    tag.save!
  end

  before do
    allow(BasicLTI::Sourcedid).to receive(:encryption_secret) {'encryption-secret-5T14NjaTbcYjc4'}
    allow(BasicLTI::Sourcedid).to receive(:signing_secret) {'signing-secret-vp04BNqApwdwUYPUI'}
  end

  def check_error_response(message, check_generated_sig=true)
    expect(response.body.strip).to_not be_empty, "Should not have an empty response body"

    json = JSON.parse response.body
    expect(json["errors"][0]["message"]).to eq message
    expect(json["error_report_id"]).to be > 0

    data = error_data(json)

    expect(data.key?('oauth_signature')).to be true
    expect(data.key?('oauth_signature_method')).to be true
    expect(data.key?('oauth_nonce')).to be true
    expect(data.key?('oauth_timestamp')).to be true
    expect(data.key?('generated_signature')).to be true if check_generated_sig

    expect(data['oauth_signature']).to_not be_empty
    expect(data['oauth_signature_method']).to_not be_empty
    expect(data['oauth_nonce']).to_not be_empty
    expect(data['oauth_timestamp']).to_not be_empty
    expect(data['generated_signature']).to_not be_empty if check_generated_sig
  end

  def error_data(json=nil)
    json ||= JSON.parse response.body
    error_report = ErrorReport.find json["error_report_id"]
    error_report.data
  end

  def make_call(opts = {})
    opts['path'] ||= "/api/lti/v1/tools/#{@tool.id}/grade_passback"
    opts['key'] ||= @tool.consumer_key
    opts['secret'] ||= @tool.shared_secret
    opts['content-type'] ||= 'application/xml'
    consumer = OAuth::Consumer.new(opts['key'], opts['secret'], :site => "https://www.example.com", :signature_method => "HMAC-SHA1")
    req = consumer.create_signed_request(:post, opts['path'], nil, :scheme => 'header', :timestamp => opts['timestamp'], :nonce => opts['nonce'])

    auth = req['Authorization']
    if opts['override_signature_method']
      auth.gsub! "HMAC-SHA1", opts['override_signature_method']
    end

    req.body = opts['body'] if opts['body']
    post "https://www.example.com#{req.path}",
      params: req.body,
      headers: { "CONTENT_TYPE" => opts['content-type'], "HTTP_AUTHORIZATION" => auth }

  end

  def source_id
    @tool.shard.activate do
      payload = [@tool.id, @course.id, @assignment.id, @student.id].join('-')
      "#{payload}-#{Canvas::Security.hmac_sha1(payload, @tool.shard.settings[:encryption_key])}"
    end
  end

  it "should respond 'unsupported' for any unknown xml body" 


  it "adds xml to an error report if the xml is invalid according to spec" 


  it "should require a content-type of application/xml" 


  context "OAuth Requests" do
    it "should fail on invalid signature method" 


    it "should require the correct shared secret" 


    if Canvas.redis_enabled?
      it "should not allow the same nonce to be used more than once" 

    end

    it "should block timestamps more than 90 minutes old" 

  end

  def replace_result(opts={})
    score = opts[:score]
    sourceid = opts[:sourceid]
    result_data = opts[:result_data]
    raw_score = opts[:raw_score]

    sourceid ||= source_id()

    score_xml = ''
    if score
      score_xml = <<-XML
          <resultScore>
            <language>en</language>
            <textString>#{score}</textString>
          </resultScore>
      XML
    end

    raw_score_xml = ''
    if raw_score
      raw_score_xml = <<-XML
          <resultTotalScore>
            <language>en</language>
            <textString>#{raw_score}</textString>
          </resultTotalScore>
      XML
    end

    result_data_xml = ''
    if result_data && !result_data.empty?
      result_data_xml = "<resultData>\n"
      result_data.each_pair do |key, val|
        result_data_xml += "<#{key}>#{val}</#{key}>"
      end
      result_data_xml += "\n</resultData>\n"
    end

    body = <<-XML
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
          <sourcedId>#{sourceid}</sourcedId>
        </sourcedGUID>
        <result>
          #{score_xml}
          #{result_data_xml}
          #{raw_score_xml}
        </result>
      </resultRecord>
    </replaceResultRequest>
  </imsx_POXBody>
</imsx_POXEnvelopeRequest>
XML
  end

  def read_result(sourceid = nil)
    sourceid ||= source_id()
    body = <<-XML
<?xml version = "1.0" encoding = "UTF-8"?>
<imsx_POXEnvelopeRequest xmlns = "http://www.imsglobal.org/services/ltiv1p1/xsd/imsoms_v1p0">
  <imsx_POXHeader>
    <imsx_POXRequestHeaderInfo>
      <imsx_version>V1.0</imsx_version>
      <imsx_messageIdentifier>999999123</imsx_messageIdentifier>
    </imsx_POXRequestHeaderInfo>
  </imsx_POXHeader>
  <imsx_POXBody>
    <readResultRequest>
      <resultRecord>
        <sourcedGUID>
          <sourcedId>#{sourceid}</sourcedId>
        </sourcedGUID>
      </resultRecord>
    </readResultRequest>
  </imsx_POXBody>
</imsx_POXEnvelopeRequest>
    XML
  end

  def delete_result(sourceid = nil)
    sourceid ||= source_id()
    body = <<-XML
<?xml version = "1.0" encoding = "UTF-8"?>
<imsx_POXEnvelopeRequest xmlns = "http://www.imsglobal.org/services/ltiv1p1/xsd/imsoms_v1p0">
  <imsx_POXHeader>
    <imsx_POXRequestHeaderInfo>
      <imsx_version>V1.0</imsx_version>
      <imsx_messageIdentifier>999999123</imsx_messageIdentifier>
    </imsx_POXRequestHeaderInfo>
  </imsx_POXHeader>
  <imsx_POXBody>
    <deleteResultRequest>
      <resultRecord>
        <sourcedGUID>
          <sourcedId>#{sourceid}</sourcedId>
        </sourcedGUID>
      </resultRecord>
    </deleteResultRequest>
  </imsx_POXBody>
</imsx_POXEnvelopeRequest>
    XML
  end

  def check_failure(failure_type = 'unsupported', error_message = nil)
    expect(response).to be_success
    expect(response.content_type).to eq 'application/xml'
    xml = Nokogiri::XML.parse(response.body)
    expect(xml.at_css('imsx_POXEnvelopeResponse > imsx_POXHeader > imsx_POXResponseHeaderInfo > imsx_statusInfo > imsx_codeMajor').content).to eq failure_type
    expect(@assignment.submissions.not_placeholder.where(user_id: @student)).not_to be_exists
    desc = xml.at_css('imsx_description').content.match(/(?<description>.+)\n\[EID_(?<error_report>[^\]]+)\]/)
    expect(desc[:description]).to eq error_message if error_message
    expect(desc[:error_report]).to_not be_empty
  end

  def check_success
    expect(response).to be_success
    expect(response.content_type).to eq 'application/xml'
    expect(Nokogiri::XML.parse(response.body).at_css('imsx_POXEnvelopeResponse > imsx_POXHeader > imsx_POXResponseHeaderInfo > imsx_statusInfo > imsx_codeMajor').content).to eq 'success'
  end

  describe "replaceResult" do

    def verify_xml(response)
      xml = Nokogiri::XML.parse(response.body)
      expect(xml.at_css('imsx_codeMajor').content).to eq 'success'
      expect(xml.at_css('imsx_messageRefIdentifier').content).to eq '999999123'
      expect(xml.at_css('imsx_operationRefIdentifier').content).to eq 'replaceResult'
      expect(xml.at_css('imsx_POXBody *:first').name).to eq 'replaceResultResponse'
    end

    it "should allow updating the submission score" 


    it "should set the submission data text" 


    it "should set complex submission text" 


    it "should set the submission data url" 


    it "should set the submission data text even with no score" 


    it "should fail if no score and not submission data" 


    it "should fail if bad score given" 


    it "should fail if assignment has no points possible" 


    it "should pass if assignment has 0 points possible" 



    it "should notify users if it fails because the assignment has no points" 


    it "should reject out of bound scores" 


    it "should reject non-numeric scores" 


    context "pass_fail zero point assignments" do
      it "should succeed with incomplete grade when score < 1" 


      it "should succeed with incomplete grade when score < 1 for a 0 point assignment" 


      it "should succeed with complete grade when score = 1" 

    end

    context "sending raw score" do
      it "should set the raw score" 


      it "should ignore resultScore if raw score is sent" 


      it "should reject non-numeric scores" 


      it "should allow negative scores" 


    end

  end

  describe "readResult" do
    it "should return an empty string when no grade exists" 


    it "should return the score if the assignment is scored" 

  end

  describe "deleteResult" do
    it "should succeed but do nothing when the submission isn't graded" 


    it "should delete the existing score for the submission (by creating a new version)" 

  end

  it "should reject if the assignment doesn't use this tool" 


  it "should be unsupported if the assignment switched to a new tool with the same shared secret" 


  it "should reject if the assignment is no longer a tool assignment" 


  it "should verify the sourcedid is correct for this tool launch" 


  it "fails if course is deleted" 


  it "fails if assignment is deleted" 


  it "fails if user enrollment is deleted" 


  it "fails if tool is deleted" 


  describe "blti extensions 0.0.4" do
    def make_call(opts = {})
      opts['path'] ||= "/api/lti/v1/tools/#{@tool.id}/ext_grade_passback"
      opts['key'] ||= @tool.consumer_key
      opts['secret'] ||= @tool.shared_secret
      consumer = OAuth::Consumer.new(opts['key'], opts['secret'], :site => "https://www.example.com", :signature_method => "HMAC-SHA1")
      req = consumer.create_signed_request(:post, opts['path'], nil, { :scheme => 'header', :timestamp => opts['timestamp'], :nonce => opts['nonce'] }, opts['body'])
      post "https://www.example.com#{req.path}",
        params: req.body,
        headers: { 'CONTENT_TYPE' => 'application/x-www-form-urlencoded', "HTTP_AUTHORIZATION" => req['Authorization'] }
    end

    it "should require the correct shared secret" 


    def update_result(score, sourcedid = nil)
      sourcedid ||= source_id()
      body = {
        'lti_message_type' => 'basic-lis-updateresult',
        'sourcedid' => sourcedid,
        'result_resultscore_textstring' => score.to_s,
      }
    end

    def read_result(sourcedid = nil)
      sourcedid ||= source_id()
      body = {
        'lti_message_type' => 'basic-lis-readresult',
        'sourcedid' => sourcedid,
      }
    end

    def delete_result(sourcedid = nil)
      sourcedid ||= source_id()
      body = {
        'lti_message_type' => 'basic-lis-deleteresult',
        'sourcedid' => sourcedid,
      }
    end

    def check_success
      expect(response).to be_success
      expect(response.content_type).to eq 'application/xml'
      xml = Nokogiri::XML.parse(response.body)
      expect(xml.at_css('message_response > statusinfo > codemajor').content).to eq 'Success'
      expect(xml.at_css('message_response > statusinfo > codeminor').content).to eq 'fullsuccess'
      xml
    end

    def check_failure(failure_type = 'Failure', error_message = nil)
      expect(response).to be_success
      expect(response.content_type).to eq 'application/xml'
      xml = Nokogiri::XML.parse(response.body)
      expect(xml.at_css('message_response > statusinfo > codemajor').content).to eq failure_type
      expect(@assignment.submissions.not_placeholder.where(user_id: @student)).not_to be_exists
      xml
    end

    describe "basic-lis-updateresult" do
      it "should allow updating the submission score" 


      it "should reject out of bound scores" 


      it "should reject non-numeric scores" 


      it "should set the grader to the negative tool id" 

    end

    describe "basic-lis-readresult" do
      it "should return xml without result when no grade exists" 


      it "should return the score if the assignment is scored" 

    end

    describe "basic-lis-deleteresult" do
      it "should succeed but do nothing when the submission isn't graded" 


      it "should delete the existing score for the submission (by creating a new version)" 

    end

    it "should reject if the assignment doesn't use this tool" 


    it "should be unsupported if the assignment switched to a new tool with the same shared secret" 


    it "should reject if the assignment is no longer a tool assignment" 


    it "should verify the sourcedid is correct for this tool launch" 


    it "should not require an authenticity token" 

  end
end

