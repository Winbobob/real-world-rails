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

describe AnnouncementsController do
  before :once do
    course_with_student(:active_all => true)
  end

  def course_announcement(opts = {})
    @announcement = @course.announcements.create!({
      :title => "some announcement",
      :message => "some message"
    }.merge(opts))
  end

  describe "GET 'index'" do
    it "should return unauthorized without a valid session" 


    it "should redirect 'disabled', if disabled by the teacher" 


    it "returns new bundle for group announcements" 


    it "returns new bundle for course announcements if section specific enabled" 

  end

  describe "GET 'public_feed.atom'" do
    before :once do
      @context = @course
      announcement_model
    end

    it "should require authorization" 


    it "should include absolute path for rel='self' link" 


    it "should include an author for each entry" 


    it "shows the 15 most recent announcements" 


    it "only shows announcements that are visible to the caller" 

  end
end

