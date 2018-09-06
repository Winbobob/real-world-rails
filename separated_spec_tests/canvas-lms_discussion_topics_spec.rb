#
# Copyright (C) 2011 - present Instructure, Inc.
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

require 'nokogiri'

describe "discussion_topics" do
  def discussion_assignment
    assignment_model(:course => @course, :submission_types => 'discussion_topic', :title => 'Assignment Discussion')
    @topic = DiscussionTopic.where(assignment_id: @assignment).first
  end

  it "should show assignment group discussions without errors" 


  it "should not allow concluded students to update topic" 


  it "should allow teachers to edit concluded students topics" 


  it "should show speed grader button" 


  it "should show peer reviews button" 

end

