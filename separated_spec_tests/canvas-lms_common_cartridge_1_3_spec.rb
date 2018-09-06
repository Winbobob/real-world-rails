# coding: utf-8
#
# Copyright (C) 2014 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../cc_spec_helper')

require 'tmpdir'

describe "Standard Common Cartridge importing" do

  context 'in a cartridge' do
    before(:once) do
      archive_file_path = File.join(File.dirname(__FILE__) + "/../../../fixtures/migration/asmnt_example.zip")
      unzipped_file_path = create_temp_dir!
      converter = CC::Importer::Standard::Converter.new(:export_archive_path=>archive_file_path, :course_name=>'oi', :base_download_dir=>unzipped_file_path)
      converter.export
      @course_data = converter.course.with_indifferent_access
      @course_data['all_files_export'] ||= {}
      @course_data['all_files_export']['file_path'] = @course_data['all_files_zip']

      @course = course_factory
      @migration = ContentMigration.create(:context => @course)
      @migration.migration_settings[:migration_ids_to_import] = {:copy => {}}
      Importers::CourseContentImporter.import_content(@course, @course_data, nil, @migration)
    end

    it "should import assignments" 


    it "should import multiple question banks"
  end

  def import_from_file(filename)
    archive_file_path = File.join(File.dirname(__FILE__) + "/../../../fixtures/migration/#{filename}")
    unzipped_file_path = create_temp_dir!
    @course = course_factory
    @migration = ContentMigration.create(:context => @course)
    converter = CC::Importer::Standard::Converter.new(:export_archive_path=>archive_file_path, :course_name=>'oi',
      :base_download_dir=>unzipped_file_path, :content_migration => @migration)
    converter.convert
    @course_data = converter.course.with_indifferent_access

    @migration.migration_settings[:migration_ids_to_import] = {:copy => {}}
    Importers::CourseContentImporter.import_content(@course, @course_data, nil, @migration)
  end

  context 'in a flat file' do
    before(:once) do
      import_from_file("flat_imsmanifest.xml")
    end

    it "should import assignments" 


    it "should import links into the module" 


    it "should import external tools" 


    it "should mark teacher role content as unpublished" 


    it "should mark teacher role webcontent as locked and hidden" 

  end

  context 'variant support' do
    before(:once) do
      import_from_file("flat_imsmanifest_with_variants.xml")
    end

    it "should import supported variant" 


    it "should ignore non-preferred variant" 


    it "should reference preferred variant in module" 


    it "should not loop on circular references" 

  end

  context "flat manifest with curriculum standards" do
    it "should produce a warning" 

  end

  context 'flat manifest with qti' do
    before(:once) do
      skip unless Qti.qti_enabled?

      archive_file_path = File.join(File.dirname(__FILE__) + "/../../../fixtures/migration/cc_inline_qti.zip")
      unzipped_file_path = create_temp_dir!
      converter = CC::Importer::Standard::Converter.new(:export_archive_path=>archive_file_path, :course_name=>'oi', :base_download_dir=>unzipped_file_path)
      converter.export
      @course_data = converter.course.with_indifferent_access
      @course_data['all_files_export'] ||= {}
      @course_data['all_files_export']['file_path'] = @course_data['all_files_zip']

      @course = course_factory
      @migration = ContentMigration.create(:context => @course)
      @migration.migration_settings[:migration_ids_to_import] = {:copy => {}}
      Importers::CourseContentImporter.import_content(@course, @course_data, nil, @migration)
    end

    it "should import assessments from qti inside the manifest" 

  end
end

