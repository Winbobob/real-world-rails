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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PlannerApiHelper do
  include PlannerApiHelper

  describe "#formatted_planner_date" do
    it 'should create errors for bad dates' 

  end

  context "mark-done and planner-complete synchronization" do
    before(:once) do
      student_in_course(active_all: true)
      @module1 = @course.context_modules.create!(:name => "module1")
      @assignment = @course.assignments.create!(:name => "pls submit", :submission_types => ["online_text_entry"], :points_possible => 42)
      @assignment.publish
      @wiki_page = @course.wiki_pages.create!(:title => "my page")
      @wiki_page.publish

      # add assignment as a completion requirement in one module
      @assignment_tag = @module1.add_item(:id => @assignment.id, :type => 'assignment')
      @wiki_page_tag = @module1.add_item(:id => @wiki_page.id, :type => 'wiki_page')
      @module1.completion_requirements = {
        @assignment_tag.id => { :type => 'must_mark_done' },
        @wiki_page_tag.id => { :type => 'must_mark_done' }
      }
      @module1.save!
    end

    describe "#sync_module_requirement_done" do
        it "sets module requirement as done when completed in planner for assignment" 


        it "sets module requirement as not done when un-completed in planner for assignment" 


        it "sets module requirement as done when completed in planner for wiki page" 


        it "sets module requirement as not done when un-completed in planner for wiki page" 


        it "catches error if tried on non-module object types" 

    end

    describe "#sync_planner_completion" do
      it "updates existing override for assignment" 


      it "creates new override if none exists for assignment" 


      it "updates existing override for wiki page" 


      it "creates new override if none exists for wiki page" 


      it "does not throw error if tried on object type not valid for override" 


      it "does nothing if mark-doneable in zero modules" 


      it "does nothing if mark-doneable in multiple modules" 

    end
  end
end

