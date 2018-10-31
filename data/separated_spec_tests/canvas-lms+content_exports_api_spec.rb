#
# Copyright (C) 2011 - 2014 Instructure, Inc.
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

require 'nokogiri'

describe ContentExportsApiController, type: :request do
  let_once(:t_teacher) do
    user_factory(active_all: true)
  end

  let_once(:t_course) do
    course_with_teacher(user: t_teacher, active_all: true)
    @course.wiki_pages.create! title: "something to export"
    @course
  end

  let_once(:t_student) do
    student_in_course(course: t_course, active_all: true).user
  end

  def past_export(context = t_course, user = t_teacher, type = 'common_cartridge')
    export = context.content_exports.create
    export.export_type = type
    export.workflow_state = 'exported'
    export.user = user
    att = export.attachments.create! filename: 'blah', uploaded_data: StringIO.new('blah')
    export.attachment_id = att.id
    export.save
    progress = Progress.new(context: export, completion: 100, tag: 'course_export')
    progress.workflow_state = 'completed'
    progress.save!
    export
  end

  def pending_export
    export = t_course.content_exports.create
    export.export_type = 'qti'
    export.save
    progress = Progress.create!(context: export, tag: 'course_export')
    export
  end

  def course_copy_export
    export = t_course.content_exports.create
    export.export_type = 'course_copy'
    export.save!
    export
  end

  describe "index" do
    it "should check permissions" 


    it "should return the correct data" 


    it "should paginate" 


    it "should not return attachments for expired exports" 

  end

  describe "show" do
    it "should check permissions" 


    it "should return the correct data" 


    it "should not find course copy exports" 


    it "should not read other users' zip exports" 

  end

  describe "create" do
    it "should check permissions" 


    it "should require an export_type parameter" 


    it "should require a sensible export_type parameter" 


    it "should set skip notifications flag" 


    it "should create a qti export" 


    it "should create a course export and update progress" 


    it "should create a 1.3 common cartridge if specified" 


    context "selective exports" do
      let_once :att_to_copy do
        Attachment.create!(:context => t_course, :filename => 'hi.txt',
                           :uploaded_data => StringIO.new("stuff"), :folder => Folder.unfiled_folder(t_course))
      end
      let_once :att_to_not_copy do
        Attachment.create!(:context => t_course, :filename => 'derp.txt',
                           :uploaded_data => StringIO.new("more stuff"), :folder => Folder.unfiled_folder(t_course))
      end
      let_once :page_to_copy do
        page_to_copy = t_course.wiki_pages.create!(:title => "other page")
        page_to_copy.body = "<p><a href=\"/courses/#{t_course.id}/files/#{att_to_copy.id}/preview\">hey look a link</a></p>"
        page_to_copy.save!
        page_to_copy
      end
      let_once(:page_to_not_copy){ t_course.wiki_pages.create!(:title => "another page") }
      let_once(:mod) do
        # both the wiki page and the referenced attachment should be exported implicitly through the module
        mod = t_course.context_modules.create!(:name => "who cares")
        mod.add_item(:id => page_to_copy.id, :type => "wiki_page")
        mod
      end
      let_once(:quiz_to_copy) do
        t_course.quizzes.create! title: 'thaumolinguistics'
      end
      let_once(:announcement) do
        t_course.announcements.create! title: 'hear ye!', message: 'wat'
      end

      it "should create a selective course export with old migration id format" 


      it "should create a selective course export with arrays of ids" 


      it "should select quizzes correctly" 


      it "should select announcements correctly" 


      it "should select announcements even when specifically called as a discussion topic" 


      it "should not select announcements when selecting all discussion topics" 


      it "should select using shortened collection names" 


      it "should export by module item id" 


      it "should export rubrics attached to discussions" 


    end
  end

  describe "#content_list" do
    it "should return a list of exportable content for a course directly" 

  end

  describe "quizzes2 exports" do
    before do
      t_course.enable_feature!(:quizzes_next)
    end

    context "quiz_id param" do
      it "should require a quiz_id param" 


      it "verifies quiz_id param is a number" 

    end

    context "with invalid quiz" do
      it "verifies quiz exists in course" 

    end

    context "with valid quiz" do
      before do
        @quiz = t_course.quizzes.create!(:title => 'valid_quiz')
      end

      it "should create a quizzes2 export" 

    end
  end

  describe "zip exports" do
    context "course" do
      before do
        @root_folder = Folder.root_folders(t_course).first
        @file1 = attachment_model context: t_course, display_name: 'file1.txt', folder: @root_folder, uploaded_data: stub_file_data('file1.txt', 'file1', 'text/plain')
        @sub_folder = t_course.folders.create! name: 'teh_folder', parent_folder: @root_folder, locked: true
        @file2 = attachment_model context: t_course, display_name: 'file2.txt', folder: @sub_folder, uploaded_data: stub_file_data('file2.txt', 'file2', 'text/plain')
        @empty_folder = t_course.folders.create! name: 'empty_folder', parent_folder: @sub_folder
        @hiddenfile = attachment_model context: t_course, display_name: 'hidden.txt', folder: @root_folder, uploaded_data: stub_file_data('hidden.txt', 'hidden', 'text/plain'), hidden: true
      end

      it "should download course files" 


      it "should support content selection" 


      it "should support 'files' in addition to 'attachments'" 


      it "should log an error report and skip unreadable files" 


      context "as a student" do
        it "should exclude non-zip and/or other users' exports from #index" 


        it "should deny access to admin exports in #show" 


        it "should exclude locked, deleted, and hidden folders and files from archive" 


        it "should include files in public-to-institution courses" 


        it "should reject common cartridge export due to permissions" 

      end
    end

    context "group" do
      let(:t_group) do
        group_with_user(active_all: true, context: t_course.account, user: t_teacher)
        @group
      end

      it "should require :read permission" 


      it "should create a group file export" 


      it "should reject common cartridge format with bad_request" 


      it "should list exports" 


      it "should show an export" 

    end

    context "user" do
      it "should require :read permission" 


      it "should create a user file export" 


      it "should reject qti format with bad_request" 


      it "should list exports created by the user" 


      it "should show an export" 


      it "should not show another user's export" 

    end
  end
end

