# coding: utf-8
#
# Copyright (C) 2015 - present Instructure, Inc.
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

describe "Exportable" do
  # this class is only necessary until we get our package into a public repo
  # (canvas_offline_course_viewer npm package)
  class ZipPackageTest < CC::Exporter::WebZip::ZipPackage

    def initialize(exporter, course, user, progress_key)
      super(exporter, course, user, progress_key)
      @index_file = 'dist/index.html'
      @bundle_file = 'dist/viewer/bundle.js'
      @dist_dir = 'dist'
      @viewer_dir = 'dist/viewer'
    end

    def dist_package_path
      Dir.mkdir(@dist_dir) unless Dir.exist?(@dist_dir)
      Dir.mkdir(@viewer_dir) unless Dir.exist?(@viewer_dir)
      index_file = File.new(@index_file, "w+")
      index_file.write("<html></html>")
      index_file.close
      bundle_file = File.new(@bundle_file, "w+")
      bundle_file.write("{}")
      bundle_file.close
      @dist_dir
    end

    def cleanup_files
      super
      File.delete(@index_file) if File.exist?(@index_file)
      File.delete(@bundle_file) if File.exist?(@bundle_file)
      Dir.delete(@viewer_dir) if Dir.exist?(@viewer_dir)
      Dir.delete(@dist_dir) if Dir.exist?(@dist_dir)
    end
  end

  class ExportableTest
    include CC::Exporter::WebZip::Exportable

    def initialize(course, user, cartridge_path)
      @course = course
      @user = user
      @cartridge_path = cartridge_path
    end

    def attachment
      @_attachment ||= Attachment.create({
        context: Course.create,
        filename: 'exportable-test-file',
        uploaded_data: File.open(@cartridge_path)
      })
    end

    def cartridge_path
      File.join(File.dirname(__FILE__), "/../../../../fixtures/migration/unicode-filename-test-export.imscc")
    end

    def create_zip(exporter, progress_key)
      ZipPackageTest.new(exporter, @course, @user, progress_key)
    end
  end

  context "#convert_to_web_zip" do

    before do
      @create_date = 1.minute.ago
      course_with_teacher(active_all: true)
      student_in_course(active_all: true, user_name: 'a student')
      @course.web_zip_exports.create!(created_at: @create_date, user: @student)
      cartridge_path = "spec/fixtures/migration/unicode-filename-test-export.imscc"
      @web_zip_export = ExportableTest.new(@course, @student, cartridge_path).convert_to_offline_web_zip('cache_key')
    end

    let(:zip_path) do
      @web_zip_export
    end

    let(:zip) do
      File.open(zip_path)
    end

    it "should create a zip file" 


    it "exports zip file if there are no files in the course" 


    context "course-data.js file" do
      it "should create a course-data.js file" 


      it "should create a 'files' key in the course-data.js file" 


      it "should create the right structure in the 'files' key" 


      it "should add course data to the course-data.js file" 

    end

    context "canvas_offline_course_viewer files" do
      it "should insert the index.html file" 


      it "should insert the viewer/bundle.js file" 

    end

    it "creates a zip file whose name includes the cartridge's name" 


    after do
      File.delete(zip_path) if File.exist?(zip_path)
    end
  end

end

