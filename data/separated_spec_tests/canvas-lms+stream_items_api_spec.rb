#
# Copyright (C) 2011 - 2012 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../sharding_spec_helper')

describe UsersController, type: :request do
  include Api
  include Api::V1::Assignment

  before :once do
    course_with_student(:active_all => true)
  end

  it "should check for auth" 


  it "should return the activity stream" 


  it "should return the activity stream summary" 


  context "cross-shard activity stream" do
    specs_require_sharding
    it "should return the activity stream summary with cross-shard items" 


    it "should filter the activity stream to currently active courses if requested" 


    it "should find cross-shard submission comments" 

  end

  it "should still return notification_category in the the activity stream summary if not set (yet)" 


  it "should format DiscussionTopic" 


  it "should not return discussion entries if user has not posted" 


  it "should return discussion entries to admin without posting " 


  it "should translate user content in discussion topic" 


  it "should translate user content in discussion entry" 


  it "should format Announcement" 


  it "should translate user content in announcement messages" 


  it "should translate user content in announcement discussion entries" 


  it "should format Conversation" 


  it "should format Message" 


  it "should format graded Submission with comments" 


  it "should format ungraded Submission with comments" 


  it "should format graded Submission without comments" 


  it "should not format ungraded Submission without comments" 


  it "should format Collaboration" 


  it "should format WebConference" 


  it "should format AssessmentRequest" 


  it "should return the course-specific activity stream" 


  it "should return the group-specific activity stream" 


  context "stream items" do
    it "should hide the specified stream_item" 


    it "should hide all of the stream items" 

  end
end

