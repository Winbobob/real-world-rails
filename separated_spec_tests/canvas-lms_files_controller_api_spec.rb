#
# Copyright (C) 2011 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../locked_spec')

RSpec.configure do |config|
  config.include ApplicationHelper
end

describe "Files API", type: :request do
  context 'locked api item' do
    let(:item_type) { 'file' }

    let(:locked_item) do
      root_folder = Folder.root_folders(@course).first
      Attachment.create!(:filename => 'test.png', :display_name => 'test-frd.png', :uploaded_data => stub_png_data, :folder => root_folder, :context => @course)
    end

    def api_get_json
      api_call(
        :get,
        "/api/v1/files/#{locked_item.id}",
        {:controller=>'files', :action=>'api_show', :format=>'json', :id => locked_item.id.to_s},
      )
    end

    include_examples 'a locked api item'
  end

  before :once do
    course_with_teacher(:active_all => true, :user => user_with_pseudonym)
  end

  describe 'create file' do
    def call_course_create_file
      api_call(:post, "/api/v1/courses/#{@course.id}/files", {
        controller: 'courses',
        action: 'create_file',
        course_id: @course.id,
        format: 'json',
        name: 'test_file.png',
        size: '12345',
        content_type: 'image/png',
        success_include: ['avatar'],
        no_redirect: 'true'
      })
    end

    it 'includes success_include param in file create url' 


    it 'includes include param in create success url' 


    it 'includes include capture param in inst_fs token' 

  end

  describe 'api_create' do
    it 'includes success_include as include when redirecting' 

  end

  describe "api_create_success" do
    before :once do
      @attachment = Attachment.new
      @attachment.context = @course
      @attachment.filename = "test.txt"
      @attachment.file_state = 'deleted'
      @attachment.workflow_state = 'unattached'
      @attachment.content_type = "text/plain"
      @attachment.save!
    end

    def upload_data
      @attachment.workflow_state = nil
      @content = Tempfile.new(["test", ".txt"])
      def @content.content_type
        "text/plain"
      end
      @content.write("test file")
      @content.rewind
      @attachment.uploaded_data = @content
      @attachment.save!
    end

    def call_create_success(params = {})
      api_call(
        :post,
        "/api/v1/files/#{@attachment.id}/create_success?uuid=#{@attachment.uuid}",
        params.merge({
          controller: "files",
          action: "api_create_success",
          format: "json",
          id: @attachment.to_param,
          uuid: @attachment.uuid
        })
      )
    end

    it "should set the attachment to available (local storage)" 


    it "should set the attachment to available (s3 storage)" 


    it "includes usage rights if overwriting a file that has them already" 


    it "should store long-ish non-ASCII filenames (local storage)" 


    it "should render the response as text/html when in app" 


    it "should fail for an incorrect uuid" 


    it "should fail if the attachment is already available" 


    it "includes canvadoc preview url if requested and available" 


    it "includes nil preview url if requested and not available" 


    context "upload success context callback" do
      before do
        allow_any_instance_of(Course).to receive(:file_upload_success_callback)
        expect_any_instance_of(Course).to receive(:file_upload_success_callback).with(@attachment)
      end

      it "should call back for s3" 


      it "should call back for local storage" 

    end

  end

  describe "api_capture" do
    let(:secret) { 'secret' }
    let(:jwt) { Canvas::Security.create_jwt({}, nil, secret) }
    let(:folder) { Folder.root_folders(@course).first }
    let(:instfs_uuid) { 123 }

    # default set of params; parts will be overridden per test
    let(:base_params) do
      {
        user_id: @user.id,
        context_type: Course,
        context_id: @course.id,
        size: 2.megabytes,
        name: 'test.txt',
        content_type: 'text/plain',
        instfs_uuid: instfs_uuid,
        quota_exempt: true,
        folder_id: folder.id,
        on_duplicate: 'overwrite',
        token: jwt,
      }
    end

    before do
      allow(InstFS).to receive(:enabled?).and_return true
      allow(InstFS).to receive(:jwt_secret).and_return(secret)
    end

    it "is not available without the InstFS feature" 


    it "requires a service JWT to authorize" 


    it "checks quota unless exempt" 


    it "bypasses quota when exempt" 


    it "creates file locked when usage rights required" 


    it "creates file unlocked when usage rights not required" 


    it "handle duplicate paths according to on_duplicate" 


    it "redirect has preview_url include if requested" 

  end

  describe "#index" do
    before :once do
      @root = Folder.root_folders(@course).first
      @f1 = @root.sub_folders.create!(:name => "folder1", :context => @course)
      @a1 = Attachment.create!(:filename => 'ztest.txt', :display_name => "ztest.txt", :position => 1, :uploaded_data => StringIO.new('file'), :folder => @f1, :context => @course)
      @a3 = Attachment.create(:filename => 'atest3.txt', :display_name => "atest3.txt", :position => 2, :uploaded_data => StringIO.new('file'), :folder => @f1, :context => @course)
      @a3.hidden = true
      @a3.save!
      @a2 = Attachment.create!(:filename => 'mtest2.txt', :display_name => "mtest2.txt", :position => 3, :uploaded_data => StringIO.new('file'), :folder => @f1, :context => @course, :locked => true)

      @files_path = "/api/v1/folders/#{@f1.id}/files"
      @files_path_options = { :controller => "files", :action => "api_index", :format => "json", :id => @f1.id.to_param }
    end

    it "should list files in alphabetical order" 


    it "should omit verifiers using session auth" 


    it "should not omit verifiers using session auth if params[:use_verifiers] is given" 


    it "should list files in saved order if flag set" 


    it "should not list locked file if not authed" 


    it "should not list hidden files if not authed" 


    it "should list hidden files with :read_as_admin rights" 


    it "should not list locked folder if not authed" 


    it "should 404 for no folder found" 


    it "should paginate" 


    it "should only return names if requested" 


    context "content_types" do
      before :once do
        txt = attachment_model :display_name => 'thing.txt', :content_type => 'text/plain', :context => @course, :folder => @f1
        png = attachment_model :display_name => 'thing.png', :content_type => 'image/png', :context => @course, :folder => @f1
        gif = attachment_model :display_name => 'thing.gif', :content_type => 'image/gif', :context => @course, :folder => @f1
      end

      it "should match one content-type" 


      it "should match multiple content-types" 

    end

    it "should search for files by title" 


    it "should include user if requested" 


    it "should include usage_rights if requested" 


    it "should include user even for user files" 


    it "includes an instfs_uuid if ?include[]-ed" 


  end

  describe "#index for courses" do
    before :once do
      @root = Folder.root_folders(@course).first
      @f1 = @root.sub_folders.create!(:name => "folder1", :context => @course)
      @a1 = Attachment.create!(:filename => 'ztest.txt', :display_name => "ztest.txt", :position => 1, :uploaded_data => StringIO.new('file'), :folder => @f1, :context => @course)
      @a3 = Attachment.create(:filename => 'atest3.txt', :display_name => "atest3.txt", :position => 2, :uploaded_data => StringIO.new('file_'), :folder => @f1, :context => @course)
      @a3.hidden = true
      @a3.save!
      @a2 = Attachment.create!(:filename => 'mtest2.txt', :display_name => "mtest2.txt", :position => 3, :uploaded_data => StringIO.new('file__'), :folder => @f1, :context => @course, :locked => true)

      @files_path = "/api/v1/courses/#{@course.id}/files"
      @files_path_options = { :controller => "files", :action => "api_index", :format => "json", :course_id => @course.id.to_param }
    end

    describe "sort" do
      it "should list files in alphabetical order" 


      it "should list files in saved order if flag set" 


      it "should sort by size" 


      it "should sort by last-modified time" 


      it "should sort by content_type" 


      it "should sort by user, nulls last" 


      it "should sort in descending order" 

    end

    it "should not list locked file if not authed" 


    it "should not list hidden files if not authed" 


    it "should not list locked folder if not authed" 


    it "should paginate" 


    context "content_types" do
      before :once do
        txt = attachment_model :display_name => 'thing.txt', :content_type => 'text/plain', :context => @course, :folder => @f1
        png = attachment_model :display_name => 'thing.png', :content_type => 'image/png', :context => @course, :folder => @f1
        gif = attachment_model :display_name => 'thing.gif', :content_type => 'image/gif', :context => @course, :folder => @f1
      end

      it "should match one content-type" 


      it "should match multiple content-types" 

    end

    it "should search for files by title" 


    describe "hidden folders" do
      before :once do
        hidden_subfolder = @f1.active_sub_folders.build(:name => "hidden", :context => @course)
        hidden_subfolder.workflow_state = 'hidden'
        hidden_subfolder.save!
        hidden_subsub = hidden_subfolder.active_sub_folders.create!(:name => "hsub", :context => @course)
        @teh_file = Attachment.create!(:filename => "implicitly hidden", :uploaded_data => default_uploaded_data, :folder => hidden_subsub, :context => @course)
      end

      context "as teacher" do
        it "should include files in subfolders of hidden folders" 

      end

      context "as student" do
        before :once do
          student_in_course active_all: true
        end

        it "should exclude files in subfolders of hidden folders" 

      end
    end
  end

  describe "#index other contexts" do
    it "should operate on groups" 


    it "should operate on users" 

  end

  describe "#show" do
    before do
      @root = Folder.root_folders(@course).first
      @att = Attachment.create!(:filename => 'test.png', :display_name => "test-frd.png", :uploaded_data => stub_png_data, :folder => @root, :context => @course)
      @file_path = "/api/v1/files/#{@att.id}"
      @file_path_options = { :controller => "files", :action => "api_show", :format => "json", :id => @att.id.to_param }
    end

    it "should return expected json" 


    it "should work with a context path" 


    it "should 404 with wrong context" 


    it "should omit verifiers when using session auth" 


    it "should not omit verifiers when using session auth and params[:use_verifiers] is given" 


    it "should return lock information" 


    it "should not be locked/hidden for a teacher" 


    def should_be_locked(json)
      expect(json['url']).to eq ""
      expect(json['thumbnail_url']).to eq ""
      expect(json['hidden']).to be_truthy
      expect(json['hidden_for_user']).to be_truthy
      expect(json['locked_for_user']).to be_truthy
    end

    it "should be locked/hidden for a student" 


    it "should return not found error" 


    it "should return not found for deleted attachment" 


    it "should return no permissions error for no context enrollment" 


    it "should return a hidden file" 


    it "should return user if requested" 


    it "should return usage_rights if requested" 

  end

  describe "#destroy" do
    before :once do
      @root = Folder.root_folders(@course).first
      @att = Attachment.create!(:filename => 'test.txt', :display_name => "test.txt", :uploaded_data => StringIO.new('file'), :folder => @root, :context => @course)
      @file_path = "/api/v1/files/#{@att.id}"
      @file_path_options = { :controller => "files", :action => "destroy", :format => "json", :id => @att.id.to_param }
    end

    it "should delete a file" 


    it 'should delete/replace a file' 


    it "should not be authorized to delete/replace a file" 


    it "should return 404" 


    it "should return unauthorized error if not authorized to delete" 

  end

  describe "#update" do
    before :once do
      @root = Folder.root_folders(@course).first
      @att = Attachment.create!(:filename => 'test.txt', :display_name => "test.txt", :uploaded_data => StringIO.new('file'), :folder => @root, :context => @course)
      @file_path = "/api/v1/files/#{@att.id}"
      @file_path_options = { :controller => "files", :action => "api_update", :format => "json", :id => @att.id.to_param }
    end

    it "should update" 


    it "should omit verifier in-app" 


    it "should move to another folder" 


    describe "rename where file already exists" do
      before :once do
        @existing_file = Attachment.create! filename: 'newname.txt', display_name: 'newname.txt', uploaded_data: StringIO.new('blah'), folder: @root, context: @course
      end

      it "should fail if on_duplicate isn't provided" 


      it "should overwrite if asked" 


      it "should rename if asked" 

    end

    describe "move where file already exists" do
      before :once do
        @sub = @root.sub_folders.create! name: 'sub', context: @course
        @existing_file = Attachment.create! filename: 'test.txt', display_name: 'test.txt', uploaded_data: StringIO.new('existing'), folder: @sub, context: @course
      end

      it "should fail if on_duplicate isn't provided" 


      it "should overwrite if asked" 


      it "should rename if asked" 

    end

    describe "submissions folder" do
      before(:once) do
        @student = user_model
        @root_folder = Folder.root_folders(@student).first
        @file = Attachment.create! filename: 'file.txt', display_name: 'file.txt', uploaded_data: StringIO.new('blah'), folder: @root_folder, context: @student
        @sub_folder = @student.submissions_folder
        @sub_file = Attachment.create! filename: 'sub.txt', display_name: 'sub.txt', uploaded_data: StringIO.new('bleh'), folder: @sub_folder, context: @student
      end

      it "should not move a file into a submissions folder" 


      it "should not move a file out of a submissions folder" 

    end

    it "should return unauthorized error" 


    it "should 404 with invalid parent id" 


    it "should not allow moving to different context" 


    context "with usage_rights_required" do
      before do
        @course.enable_feature! :usage_rights_required
        user_session(@teacher)
        @att.update_attribute(:locked, true)
      end

      it "should not publish if usage_rights unset" 


      it "should publish if usage_rights set" 

    end
  end

  describe "quota" do
    let_once(:t_course) do
      course_with_teacher active_all: true
      @course.storage_quota = 111.megabytes
      @course.save
      attachment_model context: @course, size: 33.megabytes
      @course
    end

    let_once(:t_teacher) do
      t_course.teachers.first
    end

    before(:each) do
      user_session(@teacher)
    end

    it "should return total and used quota" 


    it "should require manage_files permissions" 


    it "should operate on groups" 


    it "should operate on users" 

  end
end

