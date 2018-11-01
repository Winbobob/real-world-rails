# coding: utf-8
#
# Copyright (C) 2017 - present Instructure, Inc.
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

require 'spec_helper'

describe "ZipPackage" do
  def add_file(fixture, context, name, folder = Folder.root_folders(context).first)
    context.attachments.create! do |attachment|
      attachment.uploaded_data = fixture
      attachment.filename = name
      attachment.folder = folder
    end
  end

  before :once do
    course_with_student(active_all: true)
    @cartridge_path = 'spec/fixtures/migration/unicode-filename-test-export.imscc'
    @cache_key = 'cache_key'
  end

  before do
    @module = @course.context_modules.create!(name: 'first_module')
    @exporter = CC::Exporter::WebZip::Exporter.new(File.open(@cartridge_path), false, :web_zip)
  end

  context "parse_module_data" do
    it "should map context module data from Canvas" 


    it "should show modules locked by prerequisites with status of locked" 


    it "should show modules locked by date with status of locked" 


    it "should not export module lock dates that are in the past" 


    it "should not show module status as locked if it only has require sequential progress set to true" 


    it "should show module status as completed if there are no further module items to complete" 


    it "should show module status of started if only some items are completed" 


    it "should not export unpublished context modules" 


    it "does not include unpublished prerequisites" 


    it "should parse module completion requirements settings" 

  end

  context "with cached progress data" do
    before do
      enable_cache
      Rails.cache.write(@cache_key, {@module.id => {status: 'started'}}, expires_in: 30.minutes)
      @zip_package = CC::Exporter::WebZip::ZipPackage.new(@exporter, @course, @student, @cache_key)
    end

    it "should use cached module status" 


    it "should not show module as locked if it is not locked at time of export" 


    it "should show module as locked if it is locked at time of export" 


    it "should use cached module item data" 


    it "should calculate module state for modules created after current_progress" 


    it "should calculate module item state as false for module items created after current_progress" 

  end

  context "parse_module_item_data" do
    it "should parse id, type, title and indent for items in the module" 


    it "should parse external tool items" 


    it "should parse locked and completed status" 


    it "should parse points possible for assignments, quizzes and graded discussions" 


    it "should parse graded status for assignments, quizzes and graded discussions" 


    it "should parse assignmentExportId for quizzes and graded discussions" 


    it "should parse graded status for not graded assignments, quizzes and discussions" 


    it "should parse due dates for assignments, quizzes and graded discussions" 


    it "should parse lock dates for ungraded discussions" 


    it "should parse submission types for assignments" 


    it "should parse question count, time limit and allowed attempts for quizzes" 


    it "should parse module item requirements" 


    it "should parse required points if module item requirement is min_score" 


    it "should parse export id for assignments, quizzes, discussions and wiki pages" 


    it "should parse content for assignments and quizzes" 


    it "should parse content for discussions" 


    it "should parse content for wiki pages" 


    it "should parse URL for url items" 


    it "should parse file data for attachments" 


    it "should not export item content for items in locked modules" 


    it "should not export item content for items locked by prerequisites" 


    it "should not export items contents for items locked by content dates" 


    it "should not export unpublished module items" 


    it "should not export items not visible to the user" 


    it "should export correct dates for assignments with due date overrides" 

  end

  context "non module items" do
    def create_zip_package
      export = @course.content_exports.build
      export.export_type = ContentExport::COMMON_CARTRIDGE
      export.user = @student
      export.save
      export.export_course
      exporter = CC::Exporter::WebZip::Exporter.new(export.attachment.open, false, :web_zip)
      CC::Exporter::WebZip::ZipPackage.new(exporter, @course, @student, @cache_key)
    end

    context "with course navigation tabs enabled" do
      before :once do
        @course.tab_configuration = [
          {'id' => Course::TAB_ASSIGNMENTS},
          {'id' => Course::TAB_PAGES},
          {'id' => Course::TAB_QUIZZES},
          {'id' => Course::TAB_DISCUSSIONS},
          {'id' => Course::TAB_FILES}
        ]
      end

      it "should parse non-module assignments" 


      it "should parse non-module discussions" 


      it "should parse non-module quizzes" 


      it "should parse non-module wiki pages" 


      it "should parse front page" 


      it "should not fail on missing items" 


      it "should export files" 

    end

    context "with course navigation tabs disabled" do
      before :once do
        @course.tab_configuration = [
          {'id' => Course::TAB_ASSIGNMENTS, 'hidden' => true},
          {'id' => Course::TAB_PAGES, 'hidden' => true},
          {'id' => Course::TAB_QUIZZES, 'hidden' => true},
          {'id' => Course::TAB_DISCUSSIONS, 'hidden' => true},
          {'id' => Course::TAB_FILES, 'hidden' => true}
        ]
      end

      it "should not export items not linked elsewhere" 


      it "should export items that are module items" 


      it "should export assignments linked from module items" 


      it "should export quizzes linked from module items" 


      it "should export pages linked from module items" 


      it "should export discussion topics linked from module items" 


      it "should export files linked from module items" 


      it "should export items linked from other linked items" 


      it "should handle circle-linked items" 


      it "should export items linked as images" 


      it "should export quizzes and discussions that are linked as assignments" 


      it "should not export quizzes when locked by date" 


      it "should export linked file items in sub-folders" 


      it "should not crash on index links" 


      it "should not mark locked items as exported" 

    end

    context "with assignment tab enabled, but quizzes/discussion tab disabled" do
      before :once do
        @course.tab_configuration = [
          {'id' => Course::TAB_ASSIGNMENTS},
          {'id' => Course::TAB_PAGES, 'hidden' => true},
          {'id' => Course::TAB_QUIZZES, 'hidden' => true},
          {'id' => Course::TAB_DISCUSSIONS, 'hidden' => true},
          {'id' => Course::TAB_FILES, 'hidden' => true}
        ]
      end

      it "should export linked graded quizzes/discussions if item tab is hidden but assignments tab is available" 

    end
  end

  context "convert_html_to_local" do
    before do
      @zip_package = CC::Exporter::WebZip::ZipPackage.new(@exporter, @course, @student, 'key')
    end

    it "should export html file links as local file links" 


    it "should export html content links as local content links" 


    it "should convert html content links that are locked" 

  end
end

