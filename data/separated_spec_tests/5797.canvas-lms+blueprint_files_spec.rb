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

require_relative '../common'
require_relative '../helpers/blueprint_common'

describe "blueprint courses - file locking" do
  include_context "in-process server selenium tests"
  include_context "blueprint courses files context"

  context "In the associated course" do

    before :once do
      Account.default.enable_feature!(:master_courses)

      @copy_from = course_factory(:active_all => true)
      @template = MasterCourses::MasterTemplate.set_as_master_course(@copy_from)
      @filename = 'file.txt'
      @original_file = Attachment.create!(:filename => @filename, :uploaded_data => StringIO.new('1'),
                                          :folder => Folder.root_folders(@copy_from).first, :context => @copy_from)
      @tag = @template.create_content_tag_for!(@original_file)

      course_with_teacher(:active_all => true)
      @copy_to = @course
      @template.add_child_course!(@copy_to)
      @file_copy = Attachment.create!(:filename => @filename, :uploaded_data => StringIO.new('1'),
                                      :folder => Folder.root_folders(@copy_to).first, :context => @copy_to,
                                      :migration_id => @tag.migration_id)
    end

    before :each do
      user_session(@teacher)
    end

    it "should not show the manageable cog-menu options when a file is locked" 


    it "should not show the manageable cog-menu options when a folder contains a locked file" 


    it "should show the manageable cog-menu options when a file is unlocked" 


    it "should show the manageable cog-menu options when a folder contains an unlocked file" 

  end

  context "in the blueprint course" do

    before :once do
      Account.default.enable_feature!(:master_courses)

      @copy_from = course_factory(:active_all => true)
      @template = MasterCourses::MasterTemplate.set_as_master_course(@copy_from)
      @filename = 'file.txt'
      @original_file = Attachment.create!(:filename => @filename, :uploaded_data => StringIO.new('1'),
                                          :folder => Folder.root_folders(@copy_from).first, :context => @copy_from)
      @tag = @template.create_content_tag_for!(@original_file)

    end

    before :each do
      user_session(@teacher)
    end

    it "should show the manageable cog-menu options when a file is locked" 


    it "should show the manageable cog-menu options when a folder contains a locked file" 


    it "should show the manageable cog-menu options when a file is unlocked" 


    it "should show the manageable cog-menu options when a folder contains an unlocked file" 


  end
end

