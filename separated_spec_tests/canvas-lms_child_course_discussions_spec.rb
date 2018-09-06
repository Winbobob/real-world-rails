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

describe "master courses - child courses - discussion locking" do
  include_context "in-process server selenium tests"

  before :once do
    Account.default.enable_feature!(:master_courses)

    due_date = format_date_for_view(Time.zone.now + 1.month)
    @copy_from = course_factory(:active_all => true)
    @template = MasterCourses::MasterTemplate.set_as_master_course(@copy_from)
    @original_topic = @copy_from.discussion_topics.create!(
      :title => "blah", :message => "bloo"
    )
    @tag = @template.create_content_tag_for!(@original_topic)

    course_with_teacher(:active_all => true)
    @copy_to = @course
    @template.add_child_course!(@copy_to)
    # just create a copy directly instead of doing a real migration
    @topic_copy = @copy_to.discussion_topics.new(
      :title => "blah", :message => "bloo"
    )
    @topic_copy.migration_id = @tag.migration_id
    @topic_copy.save!
  end

  before :each do
    user_session(@teacher)
  end

  it "should not show the deletion cog-menu option on the index when locked" 


  it "should show all the cog-menu options on the index when not locked" 


  it "should not show the delete options on the show page when locked" 


  it "should show the delete cog-menu options on the show when not locked" 


  it "should not allow popup editing of restricted items" 

end

