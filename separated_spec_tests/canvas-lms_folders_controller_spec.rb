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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FoldersController do
  def io
    fixture_file_upload('docs/doc.doc', 'application/msword', true)
  end

  def root_folder
    @root = Folder.root_folders(@course).first
  end

  def course_folder
    @folder = @root.sub_folders.create!(:name => "some folder", :context => @course)
  end

  before :once do
    course_with_teacher(active_all: true)
    student_in_course(active_all: true)
    root_folder
  end

  describe "GET 'show'" do
    it "should not return hidden files for students" 

  end

  describe "PUT 'update'" do
    before(:once) { course_folder }
    it "should require authorization" 


    it "should update folder" 

  end

  describe "POST 'create'" do
    it "should require authorization" 


    it "should create folder" 


    it "should force new folders to be sub_folders" 


    it "should create sub_folder" 

  end

  describe "DELETE 'destroy'" do
    before(:once) { course_folder }
    it "should require authorization" 


    def delete_folder
      user_session(@teacher)
      yield if block_given?
      delete 'destroy', params: {:course_id => @course.id, :id => @folder.id}
      expect(response).to be_redirect
      expect(assigns[:folder]).not_to be_frozen
      expect(assigns[:folder]).to be_deleted
      @course.reload
      expect(@course.folders).to be_include(@folder)
      expect(@course.folders.active).not_to be_include(@folder)
    end

    it "should delete folder" 


    it "should delete folder with contents" 

  end
end

