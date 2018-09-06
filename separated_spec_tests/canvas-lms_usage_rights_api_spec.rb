#
# Copyright (C) 2014 Instructure, Inc.
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
# with this program. If not, see <http://www.gnu.org/content_licenses/>.

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe UsageRightsController, type: :request do
  context "Course" do
    before(:once) do
      teacher_in_course active_all: true
      @root = Folder.root_folders(@course).first
      @folderA = @course.folders.create! parent_folder: @root, name: 'folder_A'
      @folderB = @course.folders.create! parent_folder: @folderA, name: 'folder_B'
      @fileR = attachment_model context: @course, folder: @root, display_name: 'file_R'
      @fileA1 = attachment_model context: @course, folder: @folderA, display_name: 'file_A1'
      @fileA2 = attachment_model context: @course, folder: @folderA, display_name: 'file_A2'
      @fileB = attachment_model context: @course, folder: @folderB, display_name: 'file_B'
    end

    describe "licenses" do
      it "should require :read on the context" 


      it "should list licenses" 

    end

    describe "set_usage_rights" do
      it "should require :manage_files on the context" 


      it "should publish on save when usage_rights & publish have been set" 


      it "should not publish when usage_rights have not been set" 


      it "should require usage_rights hash" 


      it "should require file_ids or folder_ids parameters" 


      it "should require valid usage_rights parameters" 


      it "should infer a default license from the use_justification" 


      it "should reuse usage_rights objects" 


      it "should process folder contents recursively" 


      it "should skip deleted files and folders" 

    end

    describe "remove_usage_rights" do
      it "should require :manage_files on the context" 


      it "should remove usage rights" 

    end
  end

  context "User" do
    before(:once) do
      user_model
      attachment_model(context: @user)
    end

    it "should list licenses" 


    it "should set usage rights" 

  end

  context "Group" do
    before(:once) do
      group_model
      attachment_model(context: @group)
      account_admin_user(account: @group.account)
    end

    it "should list licenses" 


    it "should set usage rights" 

  end
end

