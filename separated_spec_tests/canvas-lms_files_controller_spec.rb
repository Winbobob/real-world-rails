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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper.rb')
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

def new_valid_tool(course)
  tool = course.context_external_tools.new(
      name: "bob",
      consumer_key: "bob",
      shared_secret: "bob",
      tool_id: 'some_tool',
      privacy_level: 'public'
  )
  tool.url = "http://www.example.com/basic_lti"
  tool.resource_selection = {
      :url => "http://#{HostUrl.default_host}/selection_test",
      :selection_width => 400,
      :selection_height => 400}
  tool.save!
  tool
end

describe FilesController do
  def course_folder
    @folder = @course.folders.create!(:name => "a folder", :workflow_state => "visible")
  end

  def io
    fixture_file_upload('docs/doc.doc', 'application/msword', true)
  end

  def course_file
    @file = factory_with_protected_attributes(@course.attachments, :uploaded_data => io)
  end

  def user_file
    @file = factory_with_protected_attributes(@user.attachments, :uploaded_data => io)
  end

  def account_js_file
    @file = factory_with_protected_attributes(@account.attachments, :uploaded_data => fixture_file_upload('test.js', 'text/javascript', false))
  end

  def folder_file
    @file = @folder.active_file_attachments.build(:uploaded_data => io)
    @file.context = @course
    @file.save!
    @file
  end

  def file_in_a_module
    @module = @course.context_modules.create!(:name => "module")
    @tag = @module.add_item({:type => 'attachment', :id => @file.id})
    @module.reload
    hash = {}
    hash[@tag.id.to_s] = {:type => 'must_view'}
    @module.completion_requirements = hash
    @module.save!
  end

  def file_with_path(path)
    components = path.split('/')
    folder = nil
    while components.size > 1
      component = components.shift
      folder = @course.folders.where(name: component).first
      folder ||= @course.folders.create!(:name => component, :workflow_state => "visible", :parent_folder => folder)
    end
    filename = components.shift
    @file = folder.active_file_attachments.build(:filename => filename, :uploaded_data => io)
    @file.context = @course
    @file.save!
    @file
  end

  before :once do
    @other_user = user_factory(active_all: true)
    course_with_teacher active_all: true
    student_in_course active_all: true
  end

  describe "GET 'quota'" do
    it "should require authorization" 


    it "should assign variables for course quota" 


    it "should assign variables for user quota" 


    it "should assign variables for group quota" 


    it "should allow changing group quota" 

  end

  describe "GET 'index'" do
    it "should require authorization" 


    it "should redirect 'disabled', if disabled by the teacher" 


    it "should assign variables" 


    it "should return a json format for wiki sidebar" 


    it "should work for a user context, too" 


    it "should work for a group context, too" 


    it "should not show external tools in a group context" 


    context "file menu tool visibility" do
      before do
        course_factory(active_all: true)
        @tool = @course.context_external_tools.create!(:name => "a", :url => "http://google.com", :consumer_key => '12345', :shared_secret => 'secret')
        @tool.file_menu = {
          :visibility => "admins"
        }
        @tool.save!
        Account.default.enable_feature!(:lor_for_account)
      end

      before :each do
        user_factory(active_all: true)
        user_session(@user)
      end

      it "should show restricted external tools to teachers" 


      it "should not show restricted external tools to students" 

    end

    describe 'across shards' do
      specs_require_sharding

      before :once do
        @shard2.activate do
          user_factory(active_all: true)
        end
      end

      before :each do
        user_session(@user)
      end

      it "authorizes users on a remote shard" 


      it "authorizes users on a remote shard for JSON data" 

    end
  end

  describe "GET 'show'" do
    before :once do
      course_file
    end

    it "should require authorization" 


    describe "with verifiers" do
      it "should allow public access with legacy verifier" 


      it "should allow public access with new verifier" 


      it "should not redirect to terms-acceptance page" 

    end

    it "should assign variables" 


    it "should redirect for download" 


    it "should force download when download_frd is set" 


    it "should remember most recent sf_verifier in session" 


    it "should set cache headers for non text files" 


    it "should not set cache headers for text files" 


    it "should allow concluded teachers to read and download files" 


    it "should find overwritten files" 


    describe "as a student" do
      before do
        user_session(@student)
      end

      it "should allow concluded students to read and download files" 


      it "should mark files as viewed for module progressions if the file is previewed inline" 


      it "should mark files as viewed for module progressions if the file is downloaded" 


      it "should mark files as viewed for module progressions if the file data is requested and is canvadocable" 


      it "should mark media files viewed when rendering html with file_preview" 


      it "should redirect to the user's files URL when browsing to an attachment with the same path as a deleted attachment" 


      it 'displays a new file without incident' 


      it "does not leak the name of unowned deleted files" 


      it "does not blow up for logged out users" 


      it "should view file when student's submission was deleted" 

    end

    describe "as a teacher" do
      before do
        user_session @teacher
      end

      it "should work for quiz_statistics" 


      it "should record the inline view when a teacher previews a student's submission" 

    end

    describe "canvadoc_session_url" do
      before do
        user_session(@student)
        allow(Canvadocs).to receive(:enabled?).and_return true
        @file = canvadocable_attachment_model
      end

      it "is included if :download is allowed" 


      it "is not included if locked" 


      it "is included in newly uploaded files" 

    end
  end

  describe "GET 'show_relative'" do
    before(:once) do
      course_file
      file_in_a_module
    end

    context "as student" do
      before(:each) do
        user_session(@student)
      end

      it "should find files by relative path" 


      it "should render unauthorized access page if the file path doesn't match" 


      it "should render file_not_found even if the format is non-html" 


      it "should ignore bad file_ids" 


      it "renders inline for html files" 


      it "redirects for large html files" 


      it "redirects for image files" 


      it "redirects for non-html files" 


      it "prioritizes matches on display name vs. filename" 

    end

    context "unauthenticated user" do
      it "renders unauthorized if the file exists" 


      it "renders unauthorized if the file doesn't exist" 

    end

    context "account-context files" do
      before :once do
        @account = account_model
      end

      before :each do
        allow(HostUrl).to receive(:file_host).and_return('files.test')
        request.host = 'files.test'
        user_session(@teacher)
      end

      it "should skip verification for an account-context file" 


      it "should enforce verification for contexts other than account" 


    end
  end

  describe "PUT 'update'" do
    before :once do
      course_file
    end

    it "should require authorization" 


    it "should update file" 


    it "should move file into a folder" 


    context "submissions folder" do
      before(:once) do
        @student = user_model
        @root_folder = Folder.root_folders(@student).first
        @file = attachment_model(:context => @user, :uploaded_data => default_uploaded_data, :folder => @root_folder)
        @sub_folder = @student.submissions_folder
        @sub_file = attachment_model(:context => @user, :uploaded_data => default_uploaded_data, :folder => @sub_folder)
      end

      it "should not move a file into a submissions folder" 


      it "should not move a file out of a submissions folder" 

    end

    it "should replace content and update user_id" 


    context "usage_rights_required" do
      before do
        @course.enable_feature! :usage_rights_required
        user_session(@teacher)
        @file.update_attribute(:locked, true)
      end

      it "should not publish if usage_rights unset" 


      it "should publish if usage_rights set" 

    end
  end

  describe "DELETE 'destroy'" do
    context "authorization" do
      before :once do
        course_file
      end

      it "should require authorization" 


      it "should delete file" 

    end

    it "refuses to delete a file in a submissions folder" 


    context "file that has been submitted" do
      def submit_file
        assignment = @course.assignments.create!(:title => "some assignment", :submission_types => "online_upload")
        @file = attachment_model(:context => @user, :uploaded_data => stub_file_data('test.txt', 'asdf', 'text/plain'))
        assignment.submit_homework(@student, :attachments => [@file])
      end

      before do
        submit_file
        user_session(@student)
      end

      it "should not delete" 

    end
  end

  describe "POST 'create_pending'" do
    it "should require authorization" 


    it "should require a pseudonym" 


    it "should create file placeholder (in local mode)" 


    it "should create file placeholder (in s3 mode)" 


    it "allows specifying a content_type" 


    it "should not allow going over quota for file uploads" 


    it "should allow going over quota for homework submissions" 


    it "should associate assignment submission for a group assignment with the group" 


    it "should create the file in unlocked state if :usage_rights_required is disabled" 


    it "should create the file in locked state if :usage_rights_required is enabled" 


    it "refuses to create a file in a submissions folder" 


    it "creates a file in the submissions folder if intent=='submit'" 


    it "uses a submissions folder for group assignments" 


    it "does not require usage rights for group submissions to be visible to students" 


    context "sharding" do
      specs_require_sharding

      it "should create the attachment on the context's shard" 


      it "should create the attachment on the user's shard when submitting" 

    end
  end

  describe "POST 'api_create'" do
    before :once do
      # this endpoint does not need a logged-in user or api token auth, it's
      # based completely on the policy signature
      pseudonym(@teacher)
      @attachment = factory_with_protected_attributes(Attachment, :context => @course, :file_state => 'deleted', :workflow_state => 'unattached', :filename => 'test.txt', :content_type => 'text')
    end

    before :each do
      @content = Rack::Test::UploadedFile.new(File.join(ActionController::TestCase.fixture_path, 'courses.yml'), '')
      request.env['CONTENT_TYPE'] = 'multipart/form-data'
      enable_forgery_protection
    end

    it "should accept the upload data if the policy and attachment are acceptable" 


    it "opens up cors headers" 


    it "has a preflight point for options requests (mostly safari)" 


    it "should reject a blank policy" 


    it "should reject an expired policy" 


    it "should reject a modified policy" 


    it "should reject a good policy if the attachment data is already uploaded" 


    it "should forward params[:success_include] to the api_create_success redirect as params[:include] if present" 


    it "should add 'include=avatar' to the api_create_success redirect for profile pictures" 

  end

  describe "POST api_capture" do
    before :each do
      allow(InstFS).to receive(:enabled?).and_return(true)
      allow(InstFS).to receive(:jwt_secret).and_return("jwt signing key")
      @token = Canvas::Security.create_jwt({}, nil, InstFS.jwt_secret)
    end

    it "rejects if InstFS integration is disabled" 


    it "rejects if JWT is excluded or improperly formed" 


    it "rejects if required params aren't included" 


    it "should create a new attachment" 


    it "works with a ContentMigration as the context" 


    it "works with a Quizzes::QuizSubmission as the context" 


    it "works with an Assignment as the context" 


    it "completes the Progress object given in params[:progress_id], if any" 

  end

  describe "public_url" do
    before :once do
      assignment_model :course => @course, :submission_types => %w(online_upload)
      attachment_model :context => @student
      @submission = @assignment.submit_homework @student, :attachments => [@attachment]
    end

    context "with direct rights" do
      before :each do
        user_session @student
      end

      it "should give a download url" 

    end

    context "without direct rights" do
      before :each do
        user_session @teacher
      end

      it "should fail if no submission_id is given" 


      it "should allow a teacher to download a student's submission" 


      it "should verify that the requested file belongs to the submission" 


      it "allows downloading an attachment to a previous version" 

    end
  end
end

