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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ConditionalReleaseObserver do
  before :once do
    course_factory.offer!

    @module = @course.context_modules.create!(:name => "cyoe module")
    @assignment = @course.assignments.create!(:name => "cyoe asgn", :submission_types => ["online_text_entry"], :points_possible => 100)
    @assignment.publish! if @assignment.unpublished?
    @assignment_tag = @module.add_item(:id => @assignment.id, :type => 'assignment')
  end

  describe "submission" do
    it "clears cache on create" 


    it "clears cache on update" 


    it "clears cache on delete" 

  end

  describe "assignment" do
    it "clears cache on create" 


    it "clears cache on update" 


    it "clears cache on delete" 

  end
end

