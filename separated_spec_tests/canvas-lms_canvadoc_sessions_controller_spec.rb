#
# Copyright (C) 2014 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CanvadocSessionsController do
  before :once do
    course_with_teacher(:active_all => true)
    student_in_course

    @attachment1 = attachment_model :content_type => 'application/pdf',
      :context => @student
  end

  before :each do
    PluginSetting.create! :name => 'canvadocs',
                          :settings => {"base_url" => "https://example.com"}
    allow_any_instance_of(Canvadocs::API).to receive(:upload).and_return "id" => 1234
    allow_any_instance_of(Canvadocs::API).to receive(:session).and_return 'id' => 'SESSION'
    user_session(@teacher)
  end

  describe '#show' do
    before do
      @blob = {
        attachment_id: @attachment1.global_id,
        user_id: @teacher.global_id,
        type: "canvadoc",
      }
    end

    it "works" 


    it "doesn't upload documents that are already uploaded" 


    it "needs a valid signed blob" 


    it "should send o365 as a preferred plugin when the 'Prefer Office 365 file viewer' account setting is enabled" 


    it "should not send o365 as a preferred plugin when the 'Prefer Office 365 file viewer' account setting is not enabled" 


    it "should always send PDFjs as a preferred plugin" 


    it "needs to be run by the blob user" 


    it "doesn't let you use a crocodoc blob" 


    it "allows nil users" 


    it "fails gracefulishly when canvadocs times out" 


    it "updates attachment.viewed_at if the owner (user that is the context of the attachment) views" 


    it "updates attachment.viewed_at if the owner (person in the user attribute of the attachment) views" 


    it "doesn't update attachment.viewed_at for non-owner views" 


    describe "annotations" do
      before(:each) do
        @assignment = assignment_model
        @submission = submission_model(assignment: @assignment, user: @student)
        @attachment = attachment_model(content_type: 'application/pdf', user: @student)
        @attachment.associate_with(@submission)

        user_session(@student)
      end

      let(:blob) do
        {attachment_id: @attachment.global_id, user_id: @student.global_id, type: "canvadoc", enable_annotations: true}
      end
      let(:hmac) { Canvas::Security.hmac_sha1(blob.to_json) }

      it "disables submission annotations for an anonymously-graded assignment " \
      "when Anonymous Moderated Marking is enabled" do
        @course.root_account.enable_feature!(:anonymous_moderated_marking)
        @assignment.update!(anonymous_grading: true)
        # The controller fetches different instances of the model objects we're
        # working with here, so unfortunately we can't mock them specifically.
        expect_any_instance_of(Canvadoc).to receive(:session_url).
          with(hash_including(enable_annotations: false))

        get :show, params: {blob: blob.to_json, hmac: hmac}
      end

      it "enables submission annotations for an anonymously-graded assignment " \
      "when Anonymous Moderated Marking is disabled" do
        @assignment.update!(anonymous_grading: true)
        # The controller fetches different instances of the model objects we're
        # working with here, so unfortunately we can't mock them specifically.
        expect_any_instance_of(Canvadoc).to receive(:session_url).
          with(hash_including(enable_annotations: true))

        get :show, params: {blob: blob.to_json, hmac: hmac}
      end

      context "when the attachment belongs to a non-anonymously-graded assignment" do
        it "enables submission annotations if enable_annotations is true" 


        it "disables submission annotations if enable_annotations is false" 

      end
    end
  end
end

