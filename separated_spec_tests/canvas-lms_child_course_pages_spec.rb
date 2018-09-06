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

require_relative '../common'
require_relative '../helpers/blueprint_common'

describe "master courses - child courses - wiki page locking" do
  include_context "in-process server selenium tests"
  include_context "blueprint courses files context"

  before :once do
    Account.default.enable_feature!(:master_courses)

    @copy_from = course_factory(:active_all => true)
    @template = MasterCourses::MasterTemplate.set_as_master_course(@copy_from)
    @original_page = @copy_from.wiki_pages.create!(:title => "blah", :body => "bloo")
    @tag = @template.create_content_tag_for!(@original_page)

    course_with_teacher(:active_all => true)
    @copy_to = @course
    @template.add_child_course!(@copy_to)
    @page_copy = @copy_to.wiki_pages.new(:title => "bloo", :body => "bloo") # just create a copy directly instead of doing a real migraiton
    @page_copy.migration_id = @tag.migration_id
    @page_copy.save!
  end

  before :each do
    user_session(@teacher)
  end

  it "should not show the edit/delete cog-menu options on the index when locked" 


  it "should show the edit/delete cog-menu options on the index when not locked" 


  it "should not show the delete option on the show page when locked" 


  it "should show the edit/delete cog-menu options on the show page when not locked" 

end

