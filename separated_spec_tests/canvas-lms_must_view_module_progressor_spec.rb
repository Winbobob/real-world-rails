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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "MustViewModuleProgressor" do
  def create_item(item_type)
    case item_type
    when :page
      @course.wiki_pages.create!(title: 'some page')
    when :assignment
      @course.assignments.create!(title: 'some assignment')
    when :discussion
      @course.discussion_topics.create!(title: 'some discussion')
    when :attachment
      @course.attachments.create!(uploaded_data: stub_png_data('my-pic.png'))
    else
      raise "unrecognized item type: #{item_type}"
    end
  end

  def item_type_of(item)
    case item
    when WikiPage then 'page'
    when Assignment then 'assignment'
    when DiscussionTopic then 'discussion'
    when Attachment then 'attachment'
    else raise "unknown item type: #{item.class}"
    end
  end

  def add_module_item(mod, item, requirement_type = 'must_view')
    item_tag = mod.add_item(id: item.id, type: item_type_of(item))
    mod.completion_requirements = mod.completion_requirements + [{id: item_tag.id, type: requirement_type.to_s}]
    mod.save!
    item_tag
  end

  def module_with_item_return_all(item_type, requirement_type = 'must_view')
    mod = @course.context_modules.create!(name: 'some module')
    item = create_item(item_type)
    item_tag = add_module_item(mod, item, requirement_type)
    [mod, item, item_tag]
  end

  def module_with_item(item_type, requirement_type = 'must_view')
    module_with_item_return_all(item_type, requirement_type).first
  end

  def sequential_module_progression_fixture(assignment_requirement_type: 'must_view')
    mod = @course.context_modules.create!(name: 'some module')
    initial_page = @course.wiki_pages.create!(title: "initial page")
    initial_page_tag = mod.add_item(id: initial_page.id, type: 'page')
    assignment = @course.assignments.create!(title: "some assignment")
    assignment_tag = mod.add_item(id: assignment.id, type: 'assignment')
    final_page = @course.wiki_pages.create!(title: "some page")
    final_page_tag = mod.add_item(id: final_page.id, type: 'page')
    mod.completion_requirements = {
      initial_page_tag.id => {type: 'must_view'},
      assignment_tag.id => {type: assignment_requirement_type},
      final_page_tag.id => {type: 'must_view'},
    }
    mod.require_sequential_progress = true
    mod.save!
    {
      mod: mod,
      initial_page: {item: initial_page, tag: initial_page_tag},
      assignment: {item: assignment, tag: assignment_tag},
      final_page: {item: final_page, tag: final_page_tag},
    }
  end

  describe "#make_progress" do
    before(:once) do
      course_with_student(active_all: true)
    end

    # needed to get updated info as progress is made
    it "calls evaluate_for on modules" 


    it "marks several must_view requirements in random access module as viewed" 


    it "follows module prerequisites" 


    it "is blocked by prerequisites" 


    it "is blocked by sequential progress" 


    it "can follow sequential progress" 


    it "can follow sequential progress through already completed non-must-view items" 


    it "does not mark locked assignment as complete" 


    it "does not mark locked discussion as complete" 


    it "does not mark locked file as complete" 


    # testing assignments should cover other unpublished things too
    it "does not mark unpublished assignments as complete" 


    it "proceeds through unpublished assignments for sequential modules" 


    # items can be unpublished separately from their content
    it "proceeds through modules with unpublished content tags" 


    it "proceeds through modules with unpublished assignments" 


    it "triggers completion events" 


    it "ignores assignments that are hidden by overrides" 


    it "does not progress items in unpublished modules" 


    it "does not progress items in locked modules" 

  end

  describe '#current_progress' do
    before :once do
      course_with_student(active_all: true)
      @module, @assignment = module_with_item_return_all(:assignment, 'must_contribute')
    end

    it "should export module status into a hash" 


    it "should export module item completion into a hash" 


    it "should not create progressions for non-enrolled admins and allow view if appropriate" 


    it "should not create progressions for non-enrolled non-admins" 

  end
end

