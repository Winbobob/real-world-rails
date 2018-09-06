#
# Copyright (C) 2014 - present Instructure, Inc.
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

describe ContextModulesHelper do
  include ContextModulesHelper

  let_once(:t_course) { course_factory(active_all: true) }
  let_once(:t_module) { t_course.context_modules.create! name: "test module" }

  describe "module_item_unpublishable?" do
    it "should return true for a nil item" 


    it "should return true for an itemless item like a subheader" 


    it "should return true for an item that doesn't respond to can_unpublish?" 


    it "should return the content's can_unpublish?" 

  end

  describe "module_item_translated_content_type" do
    it 'returns "" for nil item' 


    it 'returns a string for a recognized content type' 


    it 'returns unknown if the content_type is not recognized' 

  end

  describe "process_module_data" do
    let_once(:assg) { t_course.assignments.create }
    let_once(:item) { t_module.add_item(type: 'assignment', id: assg.id) }

    before do
      @context = t_course
      allow(ConditionalRelease::Service).to receive(:rules_for).and_return([
        {
          trigger_assignment: assg.id,
          locked: false,
          assignment_sets: [{}, {}],
        }
      ])
    end

    it "should not set mastery_paths if cyoe is disabled" 


    describe "show_cyoe_placeholder with cyoe enabled" do
      before do
        allow(ConditionalRelease::Service).to receive(:enabled_in_context?).and_return(true)
      end

      it "should set mastery_paths for a cyoe trigger assignment module item" 


      it "should return the correct choose_url for a cyoe trigger assignment module item" 


      it "should be true if no set has been selected and the rule is locked" 


      it "should be true if no set has been selected and sets are available" 


      it "should be true if still processing results" 


      it "should be false if no set has been selected and no sets are available" 


      it "should be false if set has been selected for a cyoe trigger assignment module item" 

    end
  end

  describe "add_mastery_paths_to_cache_key" do
    before do
      allow(ConditionalRelease::Service).to receive(:enabled_in_context?).and_return(true)
      allow(ConditionalRelease::Service).to receive(:rules_for).and_return([1, 2, 3])
      allow(ConditionalRelease::Service).to receive(:active_rules).and_return([1, 2, 3])
    end

    it "does not affect cache keys unless mastery paths enabled" 


    it "creates the same key for the same mastery paths rules for a student" 


    it "creates different keys for different mastery paths rules for a student" 


    it "creates the same key for the same mastery paths rules for a teacher" 


    it "creates different keys for different mastery paths rules for a teacher" 

  end

  describe "cyoe_able?" do
    before do
      @mod = @course.context_modules.create!
    end

    it "should return true for a graded assignment module item" 


    it "should return false for a ungraded assignment module item" 


    it "should return true for a assignment quiz module item" 


    it "should return false for a non-assignment quiz module item" 


    it "should return true for a graded discussion module item" 


    it "should return false for a non-graded discussion module item" 

  end
end

