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

require File.expand_path(File.dirname(__FILE__) + '/../common')
require File.expand_path(File.dirname(__FILE__) + '/../helpers/calendar2_common')

describe "calendar2" do
  include_context "in-process server selenium tests"
  include Calendar2Common

  before(:each) do
    Account.default.tap do |a|
      a.settings[:show_scheduler]   = true
      a.save!
    end
  end

  context "as a student" do
    before(:each) do
      @student = course_with_student_logged_in(:active_all => true).user
    end

    describe "main calendar" do
      it "should validate appointment group popup link functionality" 


      it "should show section-level events for the student's section" 


      it "should display title link and go to event details page" 


      it "should not redirect but load the event details page" 


      it "should let the group members create a calendar event for the group", priority: "1", test_id: 323330 do
        group = @course.groups.create!(name: "Test Group")
        group.add_user @student
        group.save!
        get '/calendar2'
        fj('.calendar .fc-week .fc-today').click
        edit_event_dialog = f('#edit_event_tabs')
        expect(edit_event_dialog).to be_displayed
        edit_event_form = edit_event_dialog.find('#edit_calendar_event_form')
        title = edit_event_form.find('#calendar_event_title')
        replace_content(title, "Test Event")
        replace_content(fj("input[type=text][name= 'start_time']"), "6:00am")
        replace_content(fj("input[type=text][name= 'end_time']"), "6:00pm")
        expect(get_options('.context_id').map(&:text)).to include(group.name)
        click_option(f('.context_id'), group.name)
        submit_form(f('#edit_calendar_event_form'))
        wait_for_ajaximations
        expect(CalendarEvent.last.title).to eq("Test Event")
      end
    end
  end

  context "as a spanish student" do
    before (:each) do
      # Setup with spanish locale
      @student = course_with_student_logged_in(:active_all => true).user
      @student.locale = 'es'
      @student.save!
    end

    describe "main calendar" do
      it "should display in Spanish" 

    end

    describe "mini calendar" do
      it "should display in Spanish" 

    end
  end
end

