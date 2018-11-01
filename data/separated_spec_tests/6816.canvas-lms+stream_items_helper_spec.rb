#
# Copyright (C) 2012 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

describe StreamItemsHelper do
  before :once do
    Notification.create!(:name => "Assignment Created", :category => "TestImmediately")
    course_with_teacher(active_all: true)
    @reviewee_student = course_with_student(active_all: true, course: @course).user
    @reviewer_student = course_with_student(active_all: true, course: @course).user
    @other_user = user_factory
    @another_user = user_factory

    @context = @course
    @discussion = discussion_topic_model
    @announcement = announcement_model
    @assignment = assignment_model(:course => @course, peer_reviews: true)
    @assignment.assign_peer_review(@teacher, @student)
    @assignment.assign_peer_review(@reviewer_student, @reviewee_student)
    # this conversation will not be shown, since the teacher is the last author
    conversation(@another_user, @teacher).conversation.add_message(@teacher, 'zomg')
    # whereas this one will be shown
    @participant = conversation(@other_user, @teacher)
    @conversation = @participant.conversation
  end

  context "categorize_stream_items" do
    it "should categorize different types correctly" 


    it "should normalize output into common fields" 


    it "should skip items that are not visible to the current user" 


    it "should skip assessment requests the user doesn't have permission to read" 


    context "across shards" do
      specs_require_sharding

      it "stream item ids should always be relative to the user's shard" 


      it "links to stream item assets should be relative to the active shard" 


      it "links to stream item contexts should be relative to the active shard" 

    end
  end

  context "extract_path" do
    it "should link to correct place" 

  end

  context "extract_context" do
    it "should find the correct context" 

  end

  context "extract_updated_at" do
    it "should find the correct updated_at time for a conversation participant" 

  end

  context "extract_summary" do
    it "should find the right content" 


    it 'should handle anonymous review for AssessmentRequests' 

  end
end

