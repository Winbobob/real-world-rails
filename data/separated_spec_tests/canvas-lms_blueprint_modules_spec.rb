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

require_relative '../helpers/context_modules_common'

describe "master courses - child courses - module item locking" do
  include_context "in-process server selenium tests"
  include ContextModulesCommon

  context "in the child course" do
    before :once do
      Account.default.enable_feature!(:master_courses)

      @copy_from = course_factory(active_all: true)
      @template = MasterCourses::MasterTemplate.set_as_master_course(@copy_from)
      @original_page = @copy_from.wiki_pages.create!(title: "blah", body: "bloo")
      @page_mc_tag = @template.create_content_tag_for!(@original_page, restrictions: {content: true})

      @original_topic = @copy_from.discussion_topics.create!(title: "blah", message: "bloo")
      @topic_mc_tag = @template.create_content_tag_for!(@original_topic)

      course_with_teacher(active_all: true)
      @copy_to = @course
      @sub = @template.add_child_course!(@copy_to)

      @page_copy = @copy_to.wiki_pages.create!(title: "locked page", migration_id: @page_mc_tag.migration_id)
      @topic_copy = @copy_to.discussion_topics.create!(title: "unlocked topic", migration_id: @topic_mc_tag.migration_id)
      [@page_copy, @topic_copy].each{|obj| @sub.create_content_tag_for!(obj)}
      @assmt = @copy_to.assignments.create!(title: "normal assignment")

      @mod = @copy_to.context_modules.create!(name: "modle")
      @locked_tag = @mod.add_item(id: @page_copy.id, type: "wiki_page")
      @unlocked_tag = @mod.add_item(id: @topic_copy.id, type: "discussion_topic")
      @normal_tag = @mod.add_item(id: @assmt.id, type: "assignment")
    end

    before :each do
      user_session(@teacher)
    end

    it "should show all the icons on the modules index" 


    it "should disable the title edit input for locked items" 


    it "should not disable the title edit input for unlocked items" 


    it "loads new restriction info as needed when adding an item" 

  end

  context "in the master course" do
    before :once do
      Account.default.enable_feature!(:master_courses)

      @course = course_factory(active_all: true)
      @template = MasterCourses::MasterTemplate.set_as_master_course(@course)

      @assmt = @course.assignments.create!(title: "assmt blah", description: "bloo")
      @assmt_tag = @template.create_content_tag_for!(@assmt)

      @page = @course.wiki_pages.create!(title: "page blah", body: "bloo")
      @page_tag = @template.create_content_tag_for!(@page, restrictions: {all: true})

      @topic = @course.discussion_topics.create!(title: "topic blah", message: "bloo")
      # note the lack of a content tag

      @mod = @course.context_modules.create!(name: "modle")
      @assmt_mod_tag = @mod.add_item(id: @assmt.id, type: "assignment")
      @page_mod_tag  = @mod.add_item(id: @page.id, type: "wiki_page")
      @topic_mod_tag = @mod.add_item(id: @topic.id, type: "discussion_topic")
      @header_tag = @mod.add_item(:type => 'context_module_sub_header', :title => 'header')
    end

    before :each do
      user_session(@teacher)
    end

    it "should show all the icons on the modules index" 

  end
end

