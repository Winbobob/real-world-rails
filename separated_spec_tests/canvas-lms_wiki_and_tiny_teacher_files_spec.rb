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

  context "wiki and tiny files as a teacher" do

    before(:each) do
      course_with_teacher_logged_in
    end

    after(:each) do
      # wait for all images to be done loading, since they may be thumbnails which hit the rails stack
      keep_trying_until do
        driver.execute_script <<-SCRIPT
          var done = true;
          var images = $('img:visible');
          for(var idx in images) {
            if(images[idx].src && !images[idx].complete) {
              done = false;
              break;
            }
          }
          return done;
        SCRIPT
      end
    end

    describe "keyboard navigation and accessiblity" do
      context "when on the Files tab" do
        before do
          wiki_page_tools_file_tree_setup
          f('#editor_tabs .ui-tabs-nav li:nth-child(2) a').click
          driver.execute_script('$("#editor_tabs .ui-tabs-nav li:nth-child(2) a").focus()')
        end

        it "sets the first root folder with aria-selected=true when initialized" 


        it "expands a folder when you press the right allow key" 


        it "goes to the first child when pressing the right arrow on an expanded folder" 


        it "collapses folders when pressing the left arrow" 


        it "goes to the next file avalible when pressing down" 


        it "goes to the previous file avalible when pressing up" 


        it "doesn't change aria-selected when pressing enter" 

      end

    end
    it "should lazy load files" 


    it "should lazy load directory structure for upload form" 


    it "should be able to upload a file when nothing has been loaded" 


    it "should show uploaded files in file tree and add them to the rce" 


    it "should not show uploaded files in image list" 


    it "should be able to upload a file and add the file to the rce" 


    it "should show files uploaded on the images tab in the file tree" 

  end

  context "wiki sidebar files and locking/hiding" do
    before (:each) do
      course_with_teacher_logged_in(:active_all => true, :name => 'wiki course')
      @root_folder = Folder.root_folders(@course).first
      @sub_folder = @root_folder.sub_folders.create!(:name => "visible subfolder", :context => @course)
    end

    it "should show root folder in the sidebar if it is locked" 


    it "should show root folder in the sidebar if it is hidden" 


    it "should show sub-folder in the sidebar if it is locked" 


    it "should show sub-folder in the sidebar if it is hidden" 


    it "should show file in the sidebar if it is hidden" 


    it "should show file in the sidebar if it is locked" 

  end

  context "wiki sidebar images and locking/hiding" do
    before (:each) do
      course_with_teacher_logged_in(:active_all => true, :name => 'wiki course')
      @root_folder = Folder.root_folders(@course).first
      @sub_folder = @root_folder.sub_folders.create!(:name => "subfolder", :context => @course)

      @visible_attachment = @course.attachments.build(:filename => 'foo.png', :folder => @root_folder)
      @visible_attachment.content_type = 'image/png'
      @visible_attachment.save!

      @attachment = @course.attachments.build(:filename => 'foo2.png', :folder => @sub_folder)
      @attachment.content_type = 'image/png'
      @attachment.save!
    end

    it "should show image files if their containing folder is locked" 


    it "should show image files if their containing folder is hidden" 


    it "should show image files if the files navigation tab is hidden" 


    it "should show image files if they are hidden" 


    it "should show image files if they are locked" 

  end
end

