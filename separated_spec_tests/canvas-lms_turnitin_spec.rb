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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe Turnitin::Client do
  def turnitin_assignment
    @assignment = @course.assignments.new(:title => "some assignment")
    @assignment.workflow_state = "published"
    @assignment.turnitin_enabled = true
    @assignment.save!
  end

  def turnitin_submission
    @submission = @assignment.submit_homework(@user, :submission_type => 'online_upload', :attachments => [attachment_model(:context => @user, :content_type => 'text/plain')])
    @submission.reload
  end

  FakeHTTPResponse = Struct.new(:body)
  def stub_net_http_to_return(partial_body, return_code = 1)
    body = "<returndata>#{ partial_body }<rcode>#{return_code}</rcode></returndata>"
    fake_response = FakeHTTPResponse.new(body)
    expect_any_instance_of(Net::HTTP).to receive(:start).and_return(fake_response)
  end

  describe '#state_from_similarity_score' do
    it "returns 'none' if the similarity score is zero" 


    it "returns 'acceptable' if similarity score is less than 25" 


    it "returns 'warning' if similarity score is between 25 and 50" 


    it "returns 'problem' if similarity score is between 50 and 75" 


    it "returns 'failure' if score is greater or equal to 75" 

  end

  describe "initialize" do
    it "defaults to using api.turnitin.com" 


    it "allows the endpoint to be configurable" 

  end

  describe 'class methods' do
    before(:each) do
      @default_settings = {
        :originality_report_visibility => 'immediate',
        :s_paper_check => '1',
        :internet_check => '1',
        :journal_check => '1',
        :exclude_biblio => '1',
        :exclude_quoted => '1',
        :exclude_type => '0',
        :exclude_value => '',
        :submit_papers_to => '1'
      }
    end

    it 'has correct default assignment settings' 


    it 'normalizes assignment settings' 


    it 'determines student visibility' 

  end

  describe "create assignment" do
    before(:each) do
      course_with_student(:active_all => true)
      turnitin_assignment
      @turnitin_api = Turnitin::Client.new('test_account', 'sekret')
      expect(@assignment.context).to receive(:turnitin_settings).at_least(1).and_return([:placeholder])
      expect(Turnitin::Client).to receive(:new).with(:placeholder).and_return(@turnitin_api)

      @sample_turnitin_settings = {
        :originality_report_visibility => 'after_grading',
        :s_paper_check => '0',
        :internet_check => '0',
        :journal_check => '0',
        :exclude_biblio => '0',
        :exclude_quoted => '0',
        :exclude_type => '1',
        :exclude_value => '5'
      }
      @assignment.update_attributes(:turnitin_settings => @sample_turnitin_settings)
    end

    it "marks assignment as created and current on success" 


    it "stores error code and message on failure" 


    it "does not make api call if assignment is marked current" 


    it "sets s_view_report to 0 if originality_report_visibility is 'never'" 

  end

  describe "submit paper" do
    before(:each) do
      course_with_student(:active_all => true)
      turnitin_assignment
      turnitin_submission
      @turnitin_api = Turnitin::Client.new('test_account', 'sekret')

      expect(@submission.context).to receive(:turnitin_settings).at_least(1).and_return([:placeholder])
      expect(Turnitin::Client).to receive(:new).at_least(1).with(:placeholder).and_return(@turnitin_api)
      expect(@turnitin_api).to receive(:enrollStudent).with(@course, @user).and_return(double(:success? => true))
      expect(@turnitin_api).to receive(:createOrUpdateAssignment).with(@assignment, @assignment.turnitin_settings).and_return({ :assignment_id => "1234" })
      allow(Attachment).to receive(:instantiate).and_return(@attachment)
      expect(@attachment).to receive(:open).and_return(:my_stub)
    end

    it "submits attached files to turnitin" 


    it "stores errors in the turnitin_data hash" 

  end

  describe "#prepare_params" do
    before(:each) do
      course_with_student(:active_all => true)
      turnitin_assignment
      turnitin_submission
      @turnitin_api = Turnitin::Client.new('test_account', 'sekret')
    end

    let(:turnitin_submit_args) do
      {
        :post => true,
        :utp => '1',
        :ptl => @attachment.display_name,
        :ptype => "2",
        :user => @student,
        :course => @course,
        :assignment => @assignment,
        :tem => "spec@null.instructure.example.com"
      }
    end

    context "when submitting a paper" do

      let(:teacher_email_arg) { turnitin_submit_args[:tem] }
      let(:paper_title_arg) { turnitin_submit_args[:ptl] }

      let(:processed_params) { @turnitin_api.prepare_params(:submit_paper, '2', turnitin_submit_args) }

      let(:processed_teacher_email) { processed_params[:tem] }
      let(:processed_paper_title) { processed_params[:ptl] }
      let(:processed_user_first_name) { processed_params[:ufn] }
      let(:processed_md5) { processed_params[:md5] }

      context "when escaping parameters" do

        it "escapes '%' signs" 


        it "escapes '@' signs" 


        it "escapes spaces with '%20', not '+'" 


        # we can't test an actual md5 returned from turnitin without putting our
        # credentials in the test code (since the credentials are part of the string
        # from which the md5 is generated). So the next best thing is to check what
        # we're assuming turnitin does, which is to first unescape and then compute
        # md5.
        it "generates the md5 before escaping parameters" 

      end
    end

    context "when creating a user" do

      let(:processed_params) { @turnitin_api.prepare_params(:create_user, '2', turnitin_submit_args) }

      let(:processed_user_first_name) { processed_params[:ufn] }
      let(:processed_user_last_name) { processed_params[:uln] }

      it "correctly uses the user's first and last names" 


      it "creates a last name if none is given" 


    end

    it "ensures turnitin recieves unique assignment names even if the assignments have the same name" 

  end

  describe "#request_md5" do
    # From the turnitin api docs: the md5 for thess parameters should be
    # calculated by concatenatin aid + diagnostic + encrypt + fcmd + fid + gmtime
    # + uem + ufn + uln + utp + shared secret key:
    #
    # The concatenated string, before md5 is:
    # 1000011200310311john.doe@myschool.eduJohnDoejohn1232hothouse123
    it "follows the turnitin documentation way of generating the md5" 

  end

  describe '#email' do
    it "uses turnitin_id for courses" 

  end

  describe '#id' do
    it "uses turnitin_id when defined" 

  end
end

