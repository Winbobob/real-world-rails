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

require File.expand_path(File.dirname(__FILE__) + '/../sharding_spec_helper')

describe CalendarsController do
  def course_event(date=nil)
    date = Date.parse(date) if date
    @event = @course.calendar_events.create(:title => "some assignment", :start_at => date, :end_at => date)
  end

  before(:once) { course_with_student(active_all: true) }
  before(:each) { user_session(@student) }

  describe "GET 'show'" do
    it "should not redirect to the old calendar even with default settings" 


    it "should assign variables" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.due_date_required_for_account? == true" 


    it "js_env DUE_DATE_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.due_date_required_for_account? == false" 


    it "js_env SIS_NAME is SIS when @context does not respond_to assignments" 


    it "js_env SIS_NAME is Foo Bar when AssignmentUtil.post_to_sis_friendly_name is Foo Bar" 


    it "js_env MAX_NAME_LENGTH_REQUIRED_FOR_ACCOUNT is true when AssignmentUtil.name_length_required_for_account? == true" 


    it "js_env MAX_NAME_LENGTH_REQUIRED_FOR_ACCOUNT is false when AssignmentUtil.name_length_required_for_account? == false" 


    it "js_env MAX_NAME_LENGTH is a 15 when AssignmentUtil.assignment_max_name_length returns 15" 


    specs_require_sharding

    it "should set permissions using contexts from the correct shard" 

  end

end

describe CalendarEventsApiController do
  def course_event(date=Time.now)
    @event = @course.calendar_events.create(:title => "some assignment", :start_at => date, :end_at => date)
  end

  describe "GET 'public_feed'" do
    before(:once) do
      course_with_student(:active_all => true)
      course_event
      @course.is_public = true
      @course.save!
      @course.assignments.create!(:title => "some assignment")
    end

    it "should assign variables" 


    it "should use the relevant event for that section, in the course feed" 


    context "for a user context" do
      it "should use the relevant event for that section" 


      it "should require authorization" 


      it "should include absolute path for rel='self' link" 


      it "should include an author for each entry" 


      it "should include description in event for unlocked assignment" 


      it "should not include description in event for locked assignment" 

    end
  end
end

