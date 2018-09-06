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

describe "Canvas Cartridge importing" do
  before(:each) do
    @converter = get_cc_converter
    @copy_from = course_model
    @from_teacher = @user
    @copy_to = course_model
    @copy_to.conclude_at = nil
    @copy_to.start_at = nil
    @copy_to.name = "alt name"
    @copy_to.course_code = "alt name"

    @exporter = CC::CCExporter.new(nil, :course=>@copy_from, :user=>@from_teacher, :for_course_copy => true)
    manifest = CC::Manifest.new(@exporter)
    @resource = CC::Resource.new(manifest, nil)
    @migration = ContentMigration.new
    @migration.context = @copy_to
    @migration.save
  end

  it "should import assignment groups" 


  it "should import external tools" 


  it "should import multiple module links to same external tool" 


  it "should import external feeds" 


  it "should import grading standards" 


  it "should import v1 grading standards" 


  def create_learning_outcome
    lo = @copy_from.created_learning_outcomes.new
    lo.context = @copy_from
    lo.short_description = "Lone outcome"
    lo.description = "<p>Descriptions are boring</p>"
    lo.workflow_state = 'active'
    lo.data = {:rubric_criterion=>{:mastery_points=>3, :ratings=>[{:description=>"Exceeds Expectations", :points=>5}, {:description=>"Meets Expectations", :points=>3}, {:description=>"Does Not Meet Expectations", :points=>0}], :description=>"First outcome", :points_possible=>5}}
    lo.save!
    default = @copy_from.root_outcome_group
    default.add_outcome(lo)
    lo
  end

  def import_learning_outcomes
    #export to xml
    builder = Builder::XmlMarkup.new(:indent=>2)
    @resource.create_learning_outcomes(builder)
    #convert to json
    doc = Nokogiri::XML(builder.target!)
    data = @converter.convert_learning_outcomes(doc)
    data = data.map{|h| h.with_indifferent_access}

    #import json into new course
    Importers::LearningOutcomeImporter.process_migration({'learning_outcomes'=>data}, @migration)
    @copy_to.save!
  end

  it "should import learning outcomes" 


  it "should import rubrics" 


  it "should import modules" 


  it "should translate attachment links on import" 


  it "should translate media file links on import" 


  it "should import wiki pages" 


  it "should import migrate inline external tool URLs in wiki pages" 


  it "should import assignments" 


  it "should import external tool assignments" 


  it "should add error for invalid external tool urls" 


  it "should import announcements (discussion topics)" 


  it "should import assignment discussion topic" 


  it "should not fail when importing discussion topic when both group_id and assignment are specified" 


  it "should import quizzes into correct assignment group" 


  it "should import quizzes' assignment from a migration id" 


  it "should convert media tracks" 


  it "should import media tracks" 


  context "warnings for missing links in imported html" do
    it "should add warnings for assessment questions" 


    it "should add warnings for assignments" 


    it "should add warnings for calendar events" 


    it "should add warnings for course syllabus" 


    it "should add warnings for discussion topics" 


    it "should add warnings for quizzes" 


    it "should add warnings for quiz questions" 


    it "should add warnings for wiki pages" 

  end
end

describe "cc assignment extensions" do
  before(:once) do
    archive_file_path = File.join(File.dirname(__FILE__) + "/../../../fixtures/migration/cc_assignment_extension.zip")
    unzipped_file_path = create_temp_dir!
    converter = CC::Importer::Canvas::Converter.new(:export_archive_path=>archive_file_path, :course_name=>'oi', :base_download_dir=>unzipped_file_path)
    converter.export
    @course_data = converter.course.with_indifferent_access

    @course = course_factory
    @migration = ContentMigration.create(:context => @course)
    @migration.migration_type = "canvas_cartridge_importer"
    @migration.migration_settings[:migration_ids_to_import] = {:copy => {}}
    Importers::CourseContentImporter.import_content(@course, @course_data, nil, @migration)
  end

  it "should parse canvas data from cc extension" 

end

describe "matching question reordering" do
  before(:once) do
    skip unless Qti.qti_enabled?
    archive_file_path = File.join(File.dirname(__FILE__) + "/../../../fixtures/migration/canvas_matching_reorder.zip")
    unzipped_file_path = create_temp_dir!
    converter = CC::Importer::Canvas::Converter.new(:export_archive_path=>archive_file_path, :course_name=>'oi', :base_download_dir=>unzipped_file_path)
    converter.export
    @course_data = converter.course.with_indifferent_access

    @course = course_factory
    @migration = ContentMigration.create(:context => @course)
    @migration.migration_type = "common_cartridge_importer"
    @migration.migration_settings[:migration_ids_to_import] = {:copy => {}}
    Importers::CourseContentImporter.import_content(@course, @course_data, nil, @migration)
  end

  it "should reorder matching question answers with images if possible (and warn otherwise)" 


  describe "announcements vs. discussion topics" do
    before(:once) do
      archive_file_path = File.join(File.dirname(__FILE__) + "/../../../fixtures/migration/canvas_announcement.zip")
      unzipped_file_path = create_temp_dir!
      converter = CC::Importer::Canvas::Converter.new(:export_archive_path=>archive_file_path, :course_name=>'oi', :base_download_dir=>unzipped_file_path)
      converter.export
      @course_data = converter.course.with_indifferent_access

      @course = course_factory
      @migration = ContentMigration.create(:context => @course)
      @migration.migration_type = "canvas_cartridge_importer"
    end

    it "should separate the announcements into a separate array in the course hash" 


    it "should not import announcements with discussion topics" 


    it "should not import discussion topics with announcements" 

  end
end

