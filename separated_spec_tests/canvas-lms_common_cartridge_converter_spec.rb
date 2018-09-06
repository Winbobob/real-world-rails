# coding: utf-8
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

require File.expand_path(File.dirname(__FILE__) + '/../cc_spec_helper')

require 'nokogiri'
require 'tmpdir'

describe "Standard Common Cartridge importing" do
  before(:once) do
    archive_file_path = File.join(File.dirname(__FILE__) + "/../../../fixtures/migration/cc_full_test.zip")
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

  it "should import webcontent" 


  it "should import files as assignments with intended_use set" 


  it "should import discussion topics" 


  # This also tests the WebLinks, they are just content tags and don't have their own class
  it "should import modules from organization" 


  it "should import external tools" 


  it "should import assessment data" 


  it "should import assessment data into an active question bank" 


  it "should find update urls in questions" 


  context "re-importing the cartridge" do

    append_before do
      @migration2 = ContentMigration.create(:context => @course)
      @migration2.migration_settings[:migration_ids_to_import] = {:copy=>{}}
      Importers::CourseContentImporter.import_content(@course, @course_data, nil, @migration2)
    end

    it "should import webcontent" 


    it "should point to new attachment from module" 

  end

  context "selective import" do
    it "should selectively import files" 




    it "should not import all attachments if :files does not exist" 

  end

  context "position conflicts" do
    append_before do
      @import_json =
          {
              "modules" => [
                  {
                      "title" => "monkeys",
                      "position" => 1,
                      "migration_id" => 'm_monkeys'
                  },
                  {
                      "title" => "ponies",
                      "position" => 2,
                      "migration_id" => 'm_ponies'
                  },
                  {
                      "title" => "last",
                      "position" => 3,
                      "migration_id" => "m_last"
                  }
              ],
              "assignment_groups" => [
                  {
                      "title" => "monkeys",
                      "position" => 1,
                      "migration_id" => "ag_monkeys"
                  },
                  {
                      "title" => "ponies",
                      "position" => 2,
                      "migration_id" => "ag_ponies"
                  },
                  {
                      "title" => "last",
                      "position" => 3,
                      "migration_id" => "ag_last"
                  }
              ]
          }
    end

    it "should fix position conflicts for modules" 


    it "should fix position conflicts for assignment groups" 

  end

  context "sub-modules" do
    it "list submodules in the overview" 


    it "should import submodules individually if selected" 

  end
end

describe "More Standard Common Cartridge importing" do
  before(:each) do
    @converter = get_standard_converter
    @copy_to = course_model
    @copy_to.name = "alt name"
    @copy_to.course_code = "alt name"

    @migration = ContentMigration.new
    allow(@migration).to receive(:to_import).and_return(nil)
    allow(@migration).to receive(:context).and_return(@copy_to)
    allow(@migration).to receive(:import_object?).and_return(true)
    allow(@migration).to receive(:add_imported_item)
  end

  it "should properly handle top-level resource references" 


  it "should handle back-slashed paths" 

    <file href="a1\\a1.html"/>
  </resource>
  <resource identifier="w1" type="webcontent">
    <file href="w1\\w1.html"/>
    <file href="w1\\w2.html"/>
  </resource>
  <resource identifier="q1" type="imsqti_xmlv1p2/imscc_xmlv1p2/assessment">
    <file href="q1\\q1.xml"/>
  </resource>
</resources>
    XML

    doc = Nokogiri::XML(resources)
    @converter.get_all_resources(doc)
    expect(@converter.resources['a1'][:href]).to eq 'a1/a1.html'
    expect(@converter.resources['w1'][:files].first[:href]).to eq 'w1/w1.html'
    expect(@converter.resources['w1'][:files][1][:href]).to eq 'w1/w2.html'
    expect(@converter.resources['q1'][:files].first[:href]).to eq 'q1/q1.xml'
  end
end

describe "non-ASCII attachment names" do
  it "should not fail to create all_files.zip" 

end

describe "LTI tool combination" do
  before(:once) do
    archive_file_path = File.join(File.dirname(__FILE__) + "/../../../fixtures/migration/cc_lti_combine_test.zip")
    unzipped_file_path = create_temp_dir!
    converter = CC::Importer::Standard::Converter.new(:export_archive_path=>archive_file_path, :course_name=>'oi', :base_download_dir=>unzipped_file_path)
    converter.export
    @course_data = converter.course.with_indifferent_access
    @course_data['all_files_export'] ||= {}
    @course_data['all_files_export']['file_path'] = @course_data['all_files_zip']

    @course = course_factory
    @migration = ContentMigration.create(:context => @course)
    @migration.migration_type = "common_cartridge_importer"
    @migration.migration_settings[:migration_ids_to_import] = {:copy => {}}
    Importers::CourseContentImporter.import_content(@course, @course_data, nil, @migration)
  end

  it "should combine lti tools in cc packages when possible" 

end

describe "other cc files" do
  def import_cc_file(filename)
    archive_file_path = File.join(File.dirname(__FILE__) + "/../../../fixtures/migration/#{filename}")
    unzipped_file_path = create_temp_dir!

    @course = course_factory
    @migration = ContentMigration.create(:context => @course)
    @migration.migration_type = "common_cartridge_importer"
    @migration.migration_settings[:migration_ids_to_import] = {:copy => {}}

    converter = CC::Importer::Standard::Converter.new(:export_archive_path=>archive_file_path, :course_name=>'oi',
      :base_download_dir=>unzipped_file_path, :content_migration => @migration)
    converter.export
    @course_data = converter.course.with_indifferent_access
    Importers::CourseContentImporter.import_content(@course, @course_data, nil, @migration)
  end

  describe "cc assignment extensions" do
    before(:once) do
      import_cc_file("cc_assignment_extension.zip")
    end

    it "should parse canvas data from cc extension" 

  end

  describe "cc optional html file to page conversation" do
    it "should do some possibly broken converting" 


    it "should just bring them over as files without the feature" 

  end

  describe "cc pattern match questions" do
    it "should produce a warning" 

  end

  describe "cc unsupported resource types" do
    it "should produce warnings" 

  end

  describe "cc syllabus intendeduse" do
    it "should import" 

  end
end

