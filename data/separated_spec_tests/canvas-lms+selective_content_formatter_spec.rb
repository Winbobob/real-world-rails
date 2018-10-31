#
# Copyright (C) 2013 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../../../spec_helper.rb')
require File.expand_path(File.dirname(__FILE__) + '/../../../../lti2_course_spec_helper')

describe Canvas::Migration::Helpers::SelectiveContentFormatter do
  context "overview json data" do
    before do
      @overview = {
        'assessments' => [{'title' => 'a1', 'migration_id' => 'a1'}],
        'modules' => [{'title' => 'a1', 'migration_id' => 'a1'}],
        'wikis' => [{'title' => 'a1', 'migration_id' => 'a1'}],
        'external_tools' => [{'title' => 'a1', 'migration_id' => 'a1'}],
        'tool_profiles' => [{'title' => 'a1', 'migration_id' => 'a1'}],
        'outcomes' => [{'title' => 'a1', 'migration_id' => 'a1'}],
        'file_map' => {'oi' => {'title' => 'a1', 'migration_id' => 'a1'}},
        'assignments' => [{'title' => 'a1', 'migration_id' => 'a1'},{'title' => 'a2', 'migration_id' => 'a2', 'assignment_group_migration_id' => 'a1'}],
        'assignment_groups' => [{'title' => 'a1', 'migration_id' => 'a1'}],
        'calendar_events' => [],
        "course" => {
               "migration_id" => "i953adbb6769c915260623f0928fcd527",
               "title" => "1 graded quiz/discussion",
               "syllabus_body"=>"oh, hi there."
        }
      }
      @migration = double()
      allow(@migration).to receive(:migration_type).and_return('common_cartridge_importer')
      allow(@migration).to receive(:overview_attachment).and_return(@migration)
      allow(@migration).to receive(:open).and_return(@migration)
      allow(@migration).to receive(:shard).and_return('1')
      allow(@migration).to receive(:cache_key).and_return('1')
      allow(@migration).to receive(:close)
      allow(@migration).to receive(:read).and_return(@overview.to_json)
      @formatter = Canvas::Migration::Helpers::SelectiveContentFormatter.new(@migration, "https://example.com")
    end

    it "should list top-level items" 


    it "should rename deprecated hash keys" 


    it "should group assignments into assignment groups" 


    it "should group attachments by folder" 


    it "should show announcements separate from discussion topics" 


    it "should link resources for quizzes and submittables" 

  end

  context "course copy" do
    include_context "lti2_course_spec_helper"
    let(:formatter) { Canvas::Migration::Helpers::SelectiveContentFormatter.new(@migration) }

    before do
      course_model
      tool_proxy.context = @course
      tool_proxy.save!
      @topic = @course.discussion_topics.create!(:message => "hi", :title => "discussion title")
      @cm = @course.context_modules.create!(:name => "some module")
      attachment_model(:context => @course, :filename => 'a5.html')
      @wiki = @course.wiki_pages.create!(:title => "wiki", :body => "ohai")
      @category = @course.group_categories.create(:name => "other category")
      @group = Group.create!(:name=>"group1", :group_category => @category, :context => @course)
      @announcement = announcement_model
      @migration = double()
      allow(@migration).to receive(:migration_type).and_return('course_copy_importer')
      allow(@migration).to receive(:source_course).and_return(@course)
      @course_outcome = outcome_model
      @account_outcome = outcome_model(:outcome_context => @course.account)
    end

    it "should list top-level items" 


    it "should list individual types" 


    it "should link resources for quizzes and submittables" 


    context "deleted objects" do
      append_before do
        @cm.destroy
        @attachment.destroy
        @wiki.destroy
        @announcement.destroy
        @topic.destroy
        @course_outcome.destroy
        @account_outcome.destroy
        tool_proxy.destroy

        @course.require_assignment_group
        @course.assignments.create!.destroy
        @course.assignment_groups.create!(:name => "blah").destroy
        @course.quizzes.create!.destroy
        @course.calendar_events.create!.destroy
        @course.rubrics.create!.destroy
      end

      it "should ignore in top-level list" 


      it "should ignore in specific item request" 

    end

    it "should group files by folders" 


  end
end

