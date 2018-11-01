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

  context "as a teacher" do
    before(:each) do
      course_with_teacher_logged_in
    end
    context "event creation" do
      it "should create an event by hitting the '+' in the top bar" 


      it "should create an event with a location name" 


      it 'should create an event with name and address' 


      it 'should cosistently format date <input> value to what datepicker would set it as, even in langs that have funky formatting' 


      it "should go to calendar event modal when a syllabus link is clicked", priority: "1", test_id: 186581 do
        event_title = "Test Event"
        make_event(title: event_title, context: @course)

        # Verifies we are taken to the event in Calendar after clicking on it in Syllabus
        get "/courses/#{@course.id}/assignments/syllabus"
        fj("a:contains('#{event_title}')").click
        wait_for_ajaximations

        expect(fj('.event-details-header:visible')).to be_displayed
        expect(f('.view_event_link')).to include_text(event_title)
      end

      it "should be able to create an event for a group" 


      it "should create an event that is recurring", priority: "1", test_id: 223510 do
        Account.default.enable_feature!(:recurring_calendar_events)
        make_full_screen
        get '/calendar2'
        expect(f('#context-list li:nth-of-type(1)').text).to include(@teacher.name)
        expect(f('#context-list li:nth-of-type(2)').text).to include(@course.name)
        f('.calendar .fc-week .fc-today').click
        edit_event_dialog = f('#edit_event_tabs')
        expect(edit_event_dialog).to be_displayed
        edit_event_form = edit_event_dialog.find('#edit_calendar_event_form')
        title = edit_event_form.find('#calendar_event_title')
        replace_content(title, "Test Event")
        replace_content(f("input[type=text][name= 'start_time']"), "6:00am")
        replace_content(f("input[type=text][name= 'end_time']"), "6:00pm")
        click_option(f('.context_id'), @course.name)
        expect_new_page_load { f('.more_options_link').click }
        wait_for_tiny(f(".mce-edit-area"))
        expect(f('.title')).to have_value "Test Event"
        move_to_click('#duplicate_event')
        replace_content(f("input[type=number][name='duplicate_count']"), 2)
        expect_new_page_load { f('#editCalendarEventFull').submit }
        expect(CalendarEvent.count).to eq(3)
        repeat_event = CalendarEvent.where(title: "Test Event")
        first_start_date = repeat_event[0].start_at.to_date
        expect(repeat_event[1].start_at.to_date).to eq(first_start_date + 1.week)
        expect(repeat_event[2].start_at.to_date).to eq(first_start_date + 2.weeks)
      end

      it "should create recurring section-specific events" 


      it "should query for all the sections in a course when creating an event" 

    end
  end

  context "to-do dates" do
    before :once do
      Account.default.enable_feature!(:student_planner)
      @course = Course.create!(name: "Course 1")
      @course.offer!
      @student1 = User.create!(name: 'Student 1')
      @course.enroll_student(@student1).accept!
    end

    before(:each) do
      user_session(@student1)
    end

    context "student to-do event" do
      before :once do
        @todo_date = Time.zone.now
        @student_to_do = @student1.planner_notes.create!(todo_date: @todo_date, title: "Student to do")
      end

      it "shows student to-do events in the calendar", priority: "1", test_id: 3357313 do
        get "/calendar2"
        expect(f('.fc-content .fc-title')).to include_text(@student_to_do.title)
      end

      it "shows the correct date and context for student to-do item in calendar", priority: "1", test_id: 3357315 do
        get "/calendar2"
        f('.fc-content .fc-title').click
        event_content = fj('.event-details-content:visible')
        expect(event_content.find_element(:css, '.event-details-timestring').text).
          to eq format_time_for_view(@todo_date, :short)
        expect(event_content).to contain_link('Student 1')
      end
    end

    context "course to-do event" do
      before :once do
        @todo_date = Time.zone.now
        @course_to_do = @student1.planner_notes.create!(todo_date: @todo_date, title: "Course to do",
                                                        course_id: @course.id)
      end

      it "shows course to do events in the calendar", priority: "1", test_id: 3357314 do
        get "/calendar2"
        expect(f('.fc-content .fc-title')).to include_text(@course_to_do.title)
      end

      it "shows the correct date and context for courseto-do item in calendar", priority: "1", test_id: 3357316 do
        get "/calendar2"
        f('.fc-content .fc-title').click
        event_content = fj('.event-details-content:visible')
        expect(event_content.find_element(:css, '.event-details-timestring').text).
          to eq format_time_for_view(@todo_date, :short)
        expect(event_content).to contain_link('Course 1')
      end
    end

    context "edit to-do event" do
      before :once do
        @todo_date = Time.zone.now
        @to_do = @student1.planner_notes.create!(todo_date: @todo_date, title: "A new to do")
      end

      it "respects the calendars checkboxes" 


      it "edits the event in calendar", priority: "1", test_id: 3415211 do
        get "/calendar2"
        f('.fc-content .fc-title').click
        f('.edit_event_link').click
        replace_content(f('input[name=title]'), 'new to-do edited')
        datetime = @todo_date
        datetime = if datetime.to_date().mday() == '15'
                      datetime.change({day: 20})
                   else
                      datetime.change({day: 15})
                   end
        replace_content(f('input[name=date]'), format_date_for_view(datetime, :short))
        f('.validated-form-view').submit
        refresh_page
        f('.fc-content .fc-title').click
        event_content = fj('.event-details-content:visible')
        expect(event_content.find_element(:css, '.event-details-timestring').text).
          to eq format_time_for_view(datetime, :short)
        @to_do.reload
        expect(format_time_for_view(@to_do.todo_date, :short)).to eq(format_time_for_view(datetime, :short))
      end
    end
  end
end

