#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/helpers/wiki_and_tiny_common')

describe "Wiki pages and Tiny WYSIWYG editor Files" do
  include_context "in-process server selenium tests"
  include WikiAndTinyCommon

  context "wiki and tiny files as a student" do
    before(:each) do
      course_factory(active_all: true, :name => 'wiki course')
      @student = user_with_pseudonym(:active_user => true, :username => 'student@example.com', :name => 'student@example.com', :password => 'asdfasdf')
      @teacher = user_with_pseudonym(:active_user => true, :username => 'teacher@example.com', :name => 'teacher@example.com', :password => 'asdfasdf')
      @course.enroll_student(@student).accept
      @course.enroll_teacher(@teacher).accept
    end

    it "should add a file to the page and validate a student can see it" 

  end

  context "wiki sidebar files and locking/hiding" do
    before(:each) do
      course_with_teacher(:active_all => true, :name => 'wiki course')
      @student = user_with_pseudonym(:active_user => true, :username => 'student@example.com', :name => 'student@example.com', :password => 'asdfasdf')
      @course.enroll_student(@student).accept
      user_session(@student)
      @root_folder = Folder.root_folders(@course).first
      @sub_folder = @root_folder.sub_folders.create!(:name => "visible subfolder", :context => @course)
    end

    it "should not show root folder in the sidebar if it is locked" 


    it "should not show root folder in the sidebar if it is hidden" 


    it "should not show root folder in the sidebar if the files navigation tab is hidden" 


    it "should not show sub-folder in the sidebar if it is locked" 


    it "should not show sub-folder in the sidebar if it is hidden" 


    it "should not show file in the sidebar if it is hidden" 


    it "should not show file in the sidebar if it is locked" 

  end

  context "wiki sidebar images and locking/hiding" do
    before(:each) do
      course_with_teacher(:active_all => true, :name => 'wiki course')
      @student = user_with_pseudonym(:active_user => true, :username => 'student@example.com', :name => 'student@example.com', :password => 'asdfasdf')
      @course.enroll_student(@student).accept
      user_session(@student)
      @root_folder = Folder.root_folders(@course).first
      @sub_folder = @root_folder.sub_folders.create!(:name => "subfolder", :context => @course)

      @visible_attachment = @course.attachments.build(:filename => 'foo.png', :folder => @root_folder)
      @visible_attachment.content_type = 'image/png'
      @visible_attachment.save!

      @attachment = @course.attachments.build(:filename => 'foo2.png', :folder => @sub_folder)
      @attachment.content_type = 'image/png'
      @attachment.save!
    end

    it "should not show image files if their containing folder is locked" 


    it "should not show image files if their containing folder is hidden" 


    it "should not show any image files if the files navigation tab is hidden" 


    it "should not show image files if they are hidden" 


    it "should not show image files if they are locked" 

  end
end

