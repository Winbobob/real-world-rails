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

describe CalendarEventsController do
  before :once do
    course_with_teacher(active_all: true)
    student_in_course(active_all: true)
    course_event
  end

  def course_event
    @event = @course.calendar_events.create(:title => "some assignment")
  end

  describe "GET 'show'" do
    it "should require authorization" 


    it "should assign variables" 


    it "should render show page" 


    it "should redirect for course section events" 

  end

  describe "GET 'new'" do
    it "should require authorization" 


    it "should not allow students to create" 


    it "doesn't create an event" 


    it "allows creating recurring calendar events on a user's calendar if the user's account allows them to" 

  end

  describe "POST 'create'" do
    it "should require authorization" 


    it "should not allow students to create" 


    it "should create a new event" 

  end

  describe "GET 'edit'" do
    it "should require authorization" 


    it "should not allow students to update" 

  end

  describe "PUT 'update'" do
    it "should require authorization" 


    it "should not allow students to update" 


    it "should update the event" 

  end

  describe "DELETE 'destroy'" do
    it "should require authorization" 


    it "should not allow students to delete" 


    it "should delete the event" 

  end
end

