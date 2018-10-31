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

require_relative "common"
require_relative "helpers/wiki_and_tiny_common"
require_relative "helpers/quizzes_common"

describe "Wiki pages and Tiny WYSIWYG editor Images" do
  include_context "in-process server selenium tests"
  include QuizzesCommon
  include WikiAndTinyCommon

  context "wiki and tiny images as a teacher" do

    before(:each) do
      course_with_teacher_logged_in
      @blank_page = @course.wiki_pages.create! :title => 'blank'
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

    it "should lazy load images" 


    it "should infini-scroll images" 


    it "should show images uploaded on the files tab in the image list" 


    it "should add image via url" 


    describe "canvas images" do
      before do
        @course_root = Folder.root_folders(@course).first
        @course_attachment = @course_root.attachments.create! :uploaded_data => jpeg_data_frd, :filename => 'course.jpg', :display_name => 'course.jpg', :context => @course
        @teacher_root = Folder.root_folders(@teacher).first
        @teacher_attachment = @teacher_root.attachments.create! :uploaded_data => jpeg_data_frd, :filename => 'teacher.jpg', :display_name => 'teacher.jpg', :context => @teacher
        get "/courses/#{@course.id}/pages/blank"
        wait_for_ajaximations
        f('a.edit-wiki').click
      end

      it "should add a course image" 

    end

    it "should put images into the right editor" 

  end
end

