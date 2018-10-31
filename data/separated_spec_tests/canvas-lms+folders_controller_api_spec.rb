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

describe "Folders API", type: :request do
  before :once do
    course_with_teacher(:active_all => true, :user => user_with_pseudonym)
    @root = Folder.root_folders(@course).first

    @folders_path = "/api/v1/folders"
    @folders_path_options = { :controller => "folders", :action => "api_index", :format => "json", :id => @root.id.to_param }
  end

  describe "#index" do
    context "with folders" do
      before(:once) do
        @f1 = @root.sub_folders.create!(:name => "folder1", :context => @course , :position => 1)
        @f2 = @root.sub_folders.create!(:name => "folder2" , :context => @course, :position => 2)
        @f3 = @root.sub_folders.create!(:name => "11folder", :context => @course, :position => 3)
        @f4 = @root.sub_folders.create!(:name => "zzfolder", :context => @course, :position => 4, :locked => true)
        @f5 = @root.sub_folders.create!(:name => "aafolder", :context => @course, :position => 5, :hidden => true)
      end

      it "should list folders in alphabetical order" 


      it "should list folders in saved order if flag set" 


      it "should allow getting locked folder if authed" 


      it "should not list hidden folders if not authed" 


      it "should not list locked folders if not authed" 


    end

    it "should 404 for no folder found" 


    it "should paginate" 


    context "student" do
      before(:once) do
        student_in_course
        @root = Folder.root_folders(@student).first
        @normal_folder = @student.folders.create! name: "Normal folder", parent_folder_id: @root
        @student.submissions_folder
      end

      it "indicates submissions folders" 

    end
  end

  describe "#show" do
    describe "file and folder counts" do
      before(:once) do
        @root.sub_folders.create!(:name => "folder1", :context => @course)
        @root.sub_folders.create!(:name => "folder2", :context => @course, :workflow_state => 'hidden')
        Attachment.create!(:filename => 'test1.txt', :display_name => "test1.txt", :uploaded_data => StringIO.new('file'), :folder => @root, :context => @course)
        Attachment.create!(:filename => 'test2.txt', :display_name => "test2.txt", :uploaded_data => StringIO.new('file'), :folder => @root, :context => @course).update_attribute(:file_state, 'hidden')
      end

      it "should count hidden items for teachers" 


      it "should not count hidden items for students" 

    end

    it "should have url to list file and folder listings" 


    it "should return unauthorized error" 


    it "should 404 for no folder found" 


    it "should 404 for deleted folder" 


    it "should return correct locked values" 


    it "should show if the user can upload files to the folder" 


    describe "folder in context" do
      it "should get the root folder for a course" 


      it "should get a folder in a context" 


      it "should 404 for a folder in a different context" 


      it "should get the root folder for a user" 


      it "should get the root folder for a group" 

    end
  end

  describe "#destroy" do
    it "should delete an empty folder" 


    it "should not allow deleting root folder of context" 


    it "should not allow deleting folders with contents without force flag" 


    it "should allow deleting folders with contents with force flag" 


    it "will not delete a submissions folder" 


    it "should return unauthorized error" 

  end

  describe "#create" do
    append_before do
      @folders_path_options = { :controller => "folders", :action => "create", :format => "json" }
    end

    it "should create in unfiled folder" 


    it "should create by folder id" 


    it "should create by folder id in the path" 


    it "should error with invalid folder id" 


    it "should give error folder is used and path sent" 


    it "should give error folder is used and id sent" 


    it "should create by folder path" 


    it "should error with invalid parent id" 


    it "should give error if path and id are passed" 


    it "should return unauthorized error" 


    it "should error if the name is too long" 


    it "should fail to create in a submissions folder (user context)" 


    it "should fail to create in a submissions folder (folder context)" 

  end

  describe "#update" do
    before :once do
      @sub1 = @root.sub_folders.create!(:name => "sub1", :context => @course)
      @update_url = @folders_path + "/#{@sub1.id}"
      @folders_path_options = { :controller => "folders", :action => "update", :format => "json", :id => @sub1.id.to_param }
    end

    it "should update" 


    it "should return unauthorized error" 


    it "should 404 with invalid parent id" 


    it "should not allow moving to different context" 


    it "should not move a folder into a submissions folder" 

  end

  describe "#create_file" do
    it "should create a file in the correct folder" 


    it "should not create a file in a submissions folder" 

  end

  describe "#resolve_path" do
    before :once do
      @params_hash = { controller: 'folders', action: 'resolve_path', format: 'json' }
    end

    context "course" do
      before :once do
        course_factory active_all: true
        @root_folder = Folder.root_folders(@course).first
        @request_path = "/api/v1/courses/#{@course.id}/folders/by_path"
        @params_hash.merge!(course_id: @course.to_param)
      end

      it "should check permissions" 


      it "should operate on an empty path" 


      describe "with full_path" do
        before :once do
          @folder = @course.folders.create! parent_folder: @root_folder, name: 'a folder'
          @sub_folder = @course.folders.create! parent_folder: @folder, name: 'locked subfolder', locked: true
          @path = [@folder.name, @sub_folder.name].join('/')
          @request_path += "/#{URI.encode(@path)}"
          @params_hash.merge!(full_path: @path)
        end

        it "should return a list of path components" 


        it "should 404 on an invalid path" 


        it "should not traverse hidden or locked paths for students" 

      end
    end

    context "group" do
      before :once do
        group_with_user
        @root_folder = Folder.root_folders(@group).first
        @params_hash.merge!(group_id: @group.id)
      end

      it "should accept an empty path" 


      it "should accept a non-empty path" 

    end

    context "user" do
      before :once do
        user_factory active_all: true
        @root_folder = Folder.root_folders(@user).first
        @params_hash.merge!(user_id: @user.id)
      end

      it "should accept an empty path" 


      it "should accept a non-empty path" 

    end
  end

  describe "copy_folder" do
    before :once do
      @source_context = course_factory active_all: true
      @source_folder = @source_context.folders.create! name: 'teh folder'
      @file = attachment_model context: @source_context, folder: @source_folder, display_name: 'foo'
      @params_hash = { controller: 'folders', action: 'copy_folder', format: 'json' }

      @dest_context = course_factory active_all: true
      @dest_folder = @dest_context.folders.create! name: 'put stuff here', parent_folder: Folder.root_folders(@dest_context).first

      user_model
    end

    it "should require :source_folder_id parameter" 


    it "should require :manage_files permission on the source context" 


    it "should require :create permission on the destination folder" 


    it "should copy a folder" 


    context "within context" do
      before :once do
        @source_context.enroll_teacher(@user, enrollment_state: 'active')
      end

      it "should copy a folder within a context" 


      it "should rename if the folder already exists" 


      it "should refuse to copy a folder into itself" 


      it "should refuse to copy a folder into a descendant" 


      it "should refuse to copy a folder into a submissions folder" 

    end
  end

  describe "copy_file" do
    before :once do
      @params_hash = { controller: 'folders', action: 'copy_file', format: 'json' }
      @dest_context = course_factory active_all: true
      @dest_folder = @dest_context.folders.create! name: 'put stuff here', parent_folder: Folder.root_folders(@dest_context).first

      user_model
      @source_file = attachment_model context: @user, display_name: 'baz'
    end

    it "should require :source_file_id parameter" 


    it "should require :download permission on the source file" 


    it "should require :manage_files permission on the destination context" 


    it "should copy a file" 


    it "should omit verifier in-app" 


    context "within context" do
      before :once do
        @dest_context.enroll_teacher @user, enrollment_state: 'active'
        @file = attachment_model context: @dest_context, folder: Folder.root_folders(@dest_context).first
      end

      it "should copy a file within a context" 


      it "should fail if the file already exists and on_duplicate was not given" 


      it "should overwrite if asked" 


      it "should rename if asked" 

    end

    it "should refuse to copy a file into a submissions folder" 

  end

  describe "#list_all_folders" do

    def make_folders_in_context(context)
      @root = Folder.root_folders(context).first
      @f1 = @root.sub_folders.create!(:name => "folder1", :context => context , :position => 1)
      @f2 = @root.sub_folders.create!(:name => "folder2" , :context => context, :position => 2)
      @f3 = @f2.sub_folders.create!(:name => "folder2.1", :context => context, :position => 3)
      @f4 = @f3.sub_folders.create!(:name => "folder2.1.1", :context => context, :position => 4)
      @f5 = @f4.sub_folders.create!(:name => "folderlocked", :context => context, :position => 5, :locked => true)
      @f6 = @f5.sub_folders.create!(:name => "folderhidden", :context => context, :position => 6, :hidden => true)
    end

    context "course" do

      before :once do
         course_with_teacher(active_all: true)
         student_in_course(active_all: true)
         make_folders_in_context @course
       end

      it "should list all folders in a course including subfolders" 


      it "should not show hidden and locked files to unauthorized users" 


      it "should return a 401 for unauthorized users" 


      it "should paginate the folder list" 

    end

    context "group" do
      it "should list all folders in a group including subfolders" 

    end

    context "user" do
      it "should list all folders owned by a user including subfolders" 

    end

  end
end

