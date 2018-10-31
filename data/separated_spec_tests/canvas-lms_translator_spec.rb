#
# Copyright (C) 2016 - present Instructure, Inc.
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

require_relative '../../../../spec_helper.rb'

describe Canvas::Migration::ExternalContent::Translator do
  context "#translate_data" do
    before :once do
      @copy_from = course_model
      @quiz = @copy_from.quizzes.create!
      @mig_id = CC::CCHelper.create_key(@quiz)

      @copy_to = course_model
      @quiz_copy = @copy_to.quizzes.new
      @quiz_copy.migration_id = @mig_id
      @quiz_copy.save!

      @cm = @course.content_migrations.create!
      @cm.add_imported_item(@quiz_copy)
      @translator = described_class.new(content_migration: @cm)
    end

    it "should search through arrays" 


    it "should search through nested hashes" 

  end

  context "#get_canvas_id_from_migration_id" do
    before :once do
      course_model
      @cm = @course.content_migrations.create!
      @translator = described_class.new(content_migration: @cm)
    end

    it "should be able to search for all of the types in the course" 


    it "should be able to find an already imported item" 


    it "should search through recently imported items first" 

  end

  context "#get_migration_id_from_canvas_id" do
    before :once do
      course_model
      template = MasterCourses::MasterTemplate.create!(course: @course)
      mm = template.master_migrations.create!
      @cm = @course.content_migrations.create!
      ce = ContentExport.create!(export_type: ContentExport::MASTER_COURSE_COPY, content_migration: @cm,
        context: @course, workflow_state: 'active', settings: {master_migration_id: mm.id})
      @translator = described_class.new(content_export: ce)
    end

    it "should return the same migration_id for graded item assignments as it does for the item" 

  end
end

