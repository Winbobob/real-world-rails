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

    describe "main month calendar" do

      it "should remember the selected calendar view" 


      it "should create an event through clicking on a calendar day", priority: "1", test_id: 138638 do
        create_middle_day_event
      end

      it "should show scheduler button if it is enabled" 


      it "should not show scheduler button if it is disabled" 


      it "should create an assignment by clicking on a calendar day" 


      it 'should translate am/pm time strings in assignment event datepicker', priority: "2", test_id: 467482 do
        skip('CNVS-28437')
        @user.locale = 'fa'
        @user.save!
        load_month_view
        f('#create_new_event_link').click
        f('#edit_event .edit_assignment_option').click
        f('#assignment_title').send_keys('test assignment')
        f('#edit_assignment_form .ui-datepicker-trigger.btn').click
        wait_for_ajaximations
        expect(f('#ui-datepicker-div .ui-datepicker-time-ampm')).to include_text('قبل از ظهر')
        expect(f('#ui-datepicker-div .ui-datepicker-time-ampm')).to include_text('بعد از ظهر')
      end

      context "drag and drop" do

        def element_location
          driver.execute_script("return $('#calendar-app .fc-content-skeleton:first')
          .find('tbody td.fc-event-container').index()")
        end

        before(:each) do
          @monday = 1
          @friday = 5
          @initial_time = Time.zone.parse('2015-1-1').beginning_of_day + 9.hours
          @initial_time_str = @initial_time.strftime('%Y-%m-%d')
          @one_day_later = @initial_time + 24.hours
          @one_day_later_str = @one_day_later.strftime('%Y-%m-%d')
          @three_days_earlier = @initial_time - 72.hours
        end

        it "should drag and drop assignment override forward" 


        it "should drag and drop assignment forward", priority: "1", test_id: 495537 do
          assignment1 = @course.assignments.create!(title: 'new month view assignment', due_at: @initial_time)
          get "/calendar2"
          quick_jump_to_date(@initial_time_str)

          # Move assignment from Thursday to Friday
          drag_and_drop_element(find('.calendar .fc-event'),
                                find('.calendar .fc-day.fc-widget-content.fc-fri.fc-past'))

          # Expect no pop up errors with drag and drop
          expect_no_flash_message :error

          # Assignment should be moved to Friday
          expect(element_location).to eq @friday

          # Assignment time should stay at 9:00am
          assignment1.reload
          expect(assignment1.start_at).to eql(@one_day_later)
        end

        it "should drag and drop event forward", priority: "1", test_id: 495538 do
          event1 = make_event(start: @initial_time, title: 'new week view event')
          get "/calendar2"
          quick_jump_to_date(@initial_time_str)

          # Move event from Thursday to Friday
          drag_and_drop_element(find('.calendar .fc-event'),
                                find('.calendar .fc-day.fc-widget-content.fc-fri.fc-past'))

          # Expect no pop up errors with drag and drop
          expect_no_flash_message :error

          # Event should be moved to Friday
          expect(element_location).to eq @friday

          # Event time should stay at 9:00am
          event1.reload
          expect(event1.start_at).to eql(@one_day_later)
        end

        it "should drag and drop assignment back", priority: "1", test_id: 567749 do
          assignment1 = @course.assignments.create!(title: 'new month view assignment', due_at: @initial_time)
          get "/calendar2"
          quick_jump_to_date(@initial_time_str)

          # Move assignment from Thursday to Monday
          drag_and_drop_element(find('.calendar .fc-event'),
                                find('.calendar .fc-day.fc-widget-content.fc-mon.fc-past'))

          # Expect no pop up errors with drag and drop
          expect_no_flash_message :error

          # Assignment should be moved to Monday
          expect(element_location).to eq @monday

          # Assignment time should stay at 9:00am
          assignment1.reload
          expect(assignment1.start_at).to eql(@three_days_earlier)
        end

        it "should drag and drop event back", priority: "1", test_id: 567750 do
          event1 = make_event(start: @initial_time, title: 'new week view event')
          get "/calendar2"
          quick_jump_to_date(@initial_time_str)

          # Move event from Thursday to Monday
          drag_and_drop_element(find('.calendar .fc-event'),
                                find('.calendar .fc-day.fc-widget-content.fc-mon.fc-past'))

          # Expect no pop up errors with drag and drop
          expect_no_flash_message :error

          # Event should be moved to Monday
          expect(element_location).to eq @monday

          # Event time should stay at 9:00am
          event1.reload
          expect(event1.start_at).to eql(@three_days_earlier)
        end

        it "should extend event to multiple days by draging", priority: "2", test_id: 419527 do
          create_middle_day_event
          date_of_middle_day = find_middle_day.attribute('data-date')
          date_of_next_day = (date_of_middle_day.to_datetime + 1.day).strftime('%Y-%m-%d')
          f('.fc-content-skeleton .fc-event-container .fc-resizer')
          next_day = fj("[data-date = #{date_of_next_day}]")
          drag_and_drop_element(f('.fc-content-skeleton .fc-event-container .fc-resizer'), next_day)
          fj('.fc-event:visible').click
          # observe the event details show date range from event start to date to end date
          original_day_text = format_time_for_view(date_of_middle_day.to_datetime)
          extended_day_text = format_time_for_view(date_of_next_day.to_datetime + 1.day)
          expect(f('.event-details-timestring .date-range').text).to eq("#{original_day_text} - #{extended_day_text}")
        end

        it "allows dropping onto the minical" 

      end

      it "more options link should go to calendar event edit page" 


      it "should go to assignment page when clicking assignment title" 


      it "more options link on assignments should go to assignment edit page" 


      it "should publish a new assignment when toggle is clicked" 


      it "should delete an event" 


      it "should delete an assignment" 


      it "should not have a delete link for a frozen assignment" 


      it "should correctly display next month on arrow press", priority: "1", test_id: 197555 do
        load_month_view
        quick_jump_to_date('Jan 1, 2012')
        change_calendar(:next)

        # Verify known dates in calendar header and grid
        expect(header_text).to include('February 2012')
        first_wednesday = '.fc-day-number.fc-wed:first'
        expect(fj(first_wednesday).text).to eq('1')
        expect(fj(first_wednesday)).to have_attribute('data-date', '2012-02-01')
        last_thursday = '.fc-day-number.fc-thu:last'
        expect(fj(last_thursday).text).to eq('1')
        expect(fj(last_thursday)).to have_attribute('data-date', '2012-03-01')
      end

      it "should correctly display previous month on arrow press", priority: "1", test_id: 419290 do
        load_month_view
        quick_jump_to_date('Jan 1, 2012')
        change_calendar(:prev)

        # Verify known dates in calendar header and grid
        expect(header_text).to include('December 2011')
        first_thursday = '.fc-day-number.fc-thu:first'
        expect(fj(first_thursday).text).to eq('1')
        expect(fj(first_thursday)).to have_attribute('data-date', '2011-12-01')
        last_saturday = '.fc-day-number.fc-sat:last'
        expect(fj(last_saturday).text).to eq('31')
        expect(fj(last_saturday)).to have_attribute('data-date', '2011-12-31')
      end

      it "should fix up the event's date for events after 11:30pm" 


      it "should change the month" 


      it "should navigate with jump-to-date control" 


      it "should show section-level events, but not the parent event" 


      it "should have a working today button", priority: "1", test_id: 142041 do
        load_month_view
        date = Time.now.strftime("%-d")

        # Check for highlight to be present on this month
        # this class is also present on the mini calendar so we need to make
        #   sure that they are both present
        expect(find_all(".fc-state-highlight").size).to eq 4

        # Switch the month and verify that there is no highlighted day
        2.times { change_calendar }
        expect(f('body')).not_to contain_css(".fc-state-highlight")

        # Go back to the present month. Verify that there is a highlighted day
        change_calendar(:today)
        expect(find_all(".fc-state-highlight").size).to eq 4
        # Check the date in the second instance which is the main calendar
        expect(ffj(".fc-state-highlight")[1].text).to include(date)
      end

      it "should show the location when clicking on a calendar event" 


      it "should bring up a calendar date picker when clicking on the month" 


      it "should strikethrough past due assignment", priority: "1", test_id: 518370 do
        date_due = Time.zone.now.utc - 2.days
        @assignment = @course.assignments.create!(
          title: 'new outdated assignment',
          name: 'new outdated assignment',
          due_at: date_due
        )
        get '/calendar2'

        # go to the same month as the date_due
        quick_jump_to_date(date_due.strftime '%Y-%m-%d')

        # verify assignment has line-through
        expect(find('.fc-title').css_value('text-decoration')).to include('line-through')
      end

      it "should strikethrough past due graded discussion", priority: "1", test_id: 518371 do
        date_due = Time.zone.now.utc - 2.days
        a = @course.assignments.create!(title: 'past due assignment', due_at: date_due, points_possible: 10)
        @pub_graded_discussion_due = @course.discussion_topics.build(assignment: a, title: 'graded discussion')
        @pub_graded_discussion_due.save!
        get '/calendar2'

        # go to the same month as the date_due
        quick_jump_to_date(date_due.strftime '%Y-%m-%d')

        # verify discussion has line-through
        expect(find('.fc-title').css_value('text-decoration')).to include('line-through')
      end
    end
  end

  context "as a student" do

    before(:each) do
      course_with_student_logged_in
    end

    describe "main month calendar" do

      it "should strikethrough completed assignment title", priority: "1", test_id: 518372 do
        date_due = Time.zone.now.utc + 2.days
        @assignment = @course.assignments.create!(
          title: 'new outdated assignment',
          name: 'new outdated assignment',
          due_at: date_due,
          submission_types: 'online_text_entry'
        )

        # submit assignment
        submission = @assignment.submit_homework(@student)
        submission.submission_type = 'online_text_entry'
        submission.save!
        get '/calendar2'

        # go to the same month as the date_due
        quick_jump_to_date(date_due.strftime '%Y-%m-%d')

        # verify assignment has line-through
        expect(find('.fc-title').css_value('text-decoration')).to include('line-through')
      end

      it "should strikethrough completed graded discussion", priority: "1", test_id: 518373 do
        date_due = Time.zone.now.utc + 2.days
        reply = 'Replying to discussion'

        a = @course.assignments.create!(title: 'past due assignment', due_at: date_due, points_possible: 10)
        @pub_graded_discussion_due = @course.discussion_topics.build(assignment: a, title: 'graded discussion')
        @pub_graded_discussion_due.save!

        get "/courses/#{@course.id}/discussion_topics/#{@pub_graded_discussion_due.id}"
        find('.discussion-reply-action').click
        type_in_tiny(".reply-textarea", reply)
        find('.btn.btn-primary').click
        wait_for_ajaximations
        get '/calendar2'

        # go to the same month as the date_due
        quick_jump_to_date(date_due.strftime '%Y-%m-%d')

        # verify discussion has line-through
        expect(find('.fc-title').css_value('text-decoration')).to include('line-through')
      end

      it "should load events from adjacent months correctly" 


      it "doesn't duplicate events when enabling calendars" 

    end
  end
end

