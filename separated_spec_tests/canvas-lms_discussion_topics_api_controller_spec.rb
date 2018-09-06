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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DiscussionTopicsApiController do
  describe 'POST add_entry' do
    before :once do
      Setting.set('enable_page_views', 'db')
      course_with_student :active_all => true
      @topic = @course.discussion_topics.create!(:title => 'discussion')
    end

    before :each do
      user_session(@student)
      allow(controller).to receive_messages(:form_authenticity_token => 'abc', :form_authenticity_param => 'abc')
      post 'add_entry', params: {:topic_id => @topic.id, :course_id => @course.id, :user_id => @user.id, :message => 'message', :read_state => 'read'}, :format => 'json'
    end

    it 'creates a new discussion entry' 


    it 'logs an asset access record for the discussion topic' 


    it 'registers a page view' 

  end

  context "add_entry file quota" do
    before :each do
      course_with_student :active_all => true
      @course.allow_student_forum_attachments = true
      @course.save!
      @topic = @course.discussion_topics.create!(:title => 'discussion')
      user_session(@student)
      allow(controller).to receive_messages(:form_authenticity_token => 'abc', :form_authenticity_param => 'abc')
    end

    it "uploads attachment to submissions folder if topic is graded" 


    it "fails if attachment a file over student quota (not course)" 


    it "succeeds otherwise" 


    it "uses instfs to store attachment if instfs is enabled" 

  end
end

