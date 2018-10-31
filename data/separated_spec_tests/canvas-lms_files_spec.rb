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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'nokogiri'

describe FilesController do
  before :each do
    user_with_pseudonym(:active_all => true)
    local_storage!
  end

  context "should support Submission as a context" do
    before(:each) do
      course_with_teacher_logged_in(:active_all => true, :user => @user)
      host!("test.host")
      @me = @user
      submission_model
      @submission.attachment = attachment_model(:uploaded_data => stub_png_data, :content_type => 'image/png')
      @submission.save!
    end

    it "with safefiles" 


    it "without safefiles" 

  end

  context "should support User as a context" do
    before(:each) do
      host!("test.host")
      user_session(@user)
      @me = @user
      @att = @me.attachments.create(:uploaded_data => stub_png_data('my-pic.png'))
    end

    it "with safefiles" 


    it "without safefiles" 


    context "with inlineable html files" do
      before do
        @att = @me.attachments.create(:uploaded_data => stub_file_data("ohai.html", "<html><body>ohai</body></html>", "text/html"))
      end

      it "with safefiles" 


      it "without safefiles" 


      it "should not inline the file if passed download_frd param" 


    end
  end

  it "should use relative urls for safefiles in course context" 


  it "logs user access with safefiles" 


  it "should be able to use verifier in course context" 


  it "should be able to directly download in course context preview links with verifier" 


  it "should update module progressions for html safefiles iframe" 


  context "should support AssessmentQuestion as a context" do
    before do
      course_with_teacher_logged_in(:active_all => true, :user => @user)
      host!("test.host")
      bank = @course.assessment_question_banks.create!
      @aq = assessment_question_model(:bank => bank)
      @att = @aq.attachments.create!(:uploaded_data => stub_png_data)
    end

    def do_with_safefiles_test(url)
      allow(HostUrl).to receive(:file_host_with_shard).and_return(['files-test.host', Shard.default])
      get url
      expect(response).to be_redirect
      uri = URI.parse response['Location']
      qs = Rack::Utils.parse_nested_query(uri.query)
      expect(uri.host).to eq 'files-test.host'
      expect(uri.path).to eq "/files/#{@att.id}/download"
      expect(@user.valid_access_verifier?(qs['ts'], qs['sf_verifier'])).to be_truthy
      expect(qs['verifier']).to eq @att.uuid
      location = response['Location']
      remove_user_session

      get location
      expect(response).to be_success
      expect(response.content_type).to eq 'image/png'
      # ensure that the user wasn't logged in by the normal means
      expect(controller.instance_variable_get(:@current_user)).to be_nil
    end

    context "with safefiles" do
      it "with new url style" 


      it "with old url style" 

    end

    def do_without_safefiles_test(url)
      allow(HostUrl).to receive(:file_host).and_return('test.host')
      get url
      expect(response).to be_success
      expect(response.content_type).to eq 'image/png'
      expect(response['Pragma']).to be_nil
      expect(response['Cache-Control']).not_to match(/no-cache/)
    end

    context "without safefiles" do
      it "with new url style" 


      it "with old url style" 

    end
  end

  it "should allow access to non-logged-in user agent if it has the right :verifier (lets google docs preview submissions in speedGrader)" 


  it "shouldn't use relative urls for safefiles in other contexts" 


  it "should return the dynamically generated thumbnail of the size given" 


  it "should reorder files" 


  it "should allow file previews for public-to-auth courses" 


  it "should allow downloads from assignments without context" 

end

