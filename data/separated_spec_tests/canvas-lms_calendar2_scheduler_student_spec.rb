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

require File.expand_path(File.dirname(__FILE__) + '/../common')
require File.expand_path(File.dirname(__FILE__) + '/../helpers/calendar2_common')
require File.expand_path(File.dirname(__FILE__) + '/../helpers/scheduler_common')

describe "scheduler" do
  include_context "in-process server selenium tests"
  include Calendar2Common
  include SchedulerCommon

  context "as a student" do

    before(:once) do
      Account.default.tap do |a|
        a.settings[:show_scheduler]   = true
        a.settings[:agenda_view]      = true
        a.save!
      end
      course_with_student(:active_all => true)
    end

    before(:each) do
      user_session(@student)
      make_full_screen
    end

    def reserve_appointment_manual(n, comment = nil)
      all_agenda_items[n].click
      if comment
        # compiled/util/Popover sets focus on the close button twice
        # within the first 100ms, which can cause it to hijack
        # keypresses, making a " " close the modal
        sleep 0.1
        replace_content(f('#appointment-comment'), comment)
      end
      force_click('.reserve_event_link') # force the click because the button can move unexpectedly.
      wait_for_ajax_requests
    end

    it "should let me reserve appointment groups for contexts I am in", :priority  => "1", test_id: 140195 do
      my_course = @course
      course_with_student(:active_all => true)
      other_course = @course

      create_appointment_group(:contexts => [other_course, my_course])

      get "/calendar2"
      click_scheduler_link
      click_appointment_link
      reserve_appointment_manual(0, "my comments")
      expect(agenda_item).to include_text "Reserved"
      agenda_item.click
      expect(f('.event-details-content')).to include_text "my comments"

      load_month_view
      # navigate to the next month for end of month
      f('.navigate_next').click unless Time.now.utc.month == (Time.now.utc + 1.day).month
      f('.fc-event').click
      expect(f('.event-details-content')).to include_text "my comments"
    end

    it "reserves appointment groups via Find Appointment mode" 


    it "reserves group appointment groups via Find Appointment Mode" 


    it "should allow me to replace existing reservation when at limit", priority: "1", test_id: 505291 do
      tomorrow = (Date.today + 1).to_s
      create_appointment_group(:max_appointments_per_participant => 1,
                               :new_appointments => [
                                   [tomorrow + ' 12:00:00', current_date = tomorrow + ' 13:00:00'],
                                   [tomorrow + ' 14:00:00', current_date = tomorrow + ' 15:00:00'],
                               ])
      get "/calendar2"
      click_scheduler_link
      click_appointment_link

      reserve_appointment_manual(0)
      expect(agenda_item).to include_text "Reserved"

      # try to reserve the second appointment
      reserve_appointment_manual(1)
      fj('.ui-button:contains(Reschedule)').click
      wait_for_ajax_requests

      event1, event2 = all_agenda_items
      expect(event1).to include_text "Available"
      expect(event2).to include_text "Reserved"
    end

    it "does not allow me to reschedule a past appointment" 


    it "should not let me book too many appointments", priority: "1", test_id: 502964 do
      tomorrow = (Date.today + 1).to_s
      create_appointment_group(:max_appointments_per_participant => 2,
                               :new_appointments => [
                                   [tomorrow + ' 12:00:00', current_date = tomorrow + ' 13:00:00'],
                                   [tomorrow + ' 14:00:00', current_date = tomorrow + ' 15:00:00'],
                                   [tomorrow + ' 16:00:00', current_date = tomorrow + ' 17:00:00'],
                               ])
      get "/calendar2"
      click_scheduler_link
      click_appointment_link

      reserve_appointment_manual(0)
      reserve_appointment_manual(1)
      e1, e2 = all_agenda_items
      expect(e1).to include_text "Reserved"
      expect(e2).to include_text "Reserved"

      reserve_appointment_manual(2)
      fj('.ui-button:contains("OK")').click # "can't reserve" dialog
      expect(fj('.agenda-event__item .agenda-event__item-container:eq(2)')).to include_text "Available"
    end

    it "should allow other users to fill up available timeslots" 


    it "should not allow me to cancel reservations from the attendees list" 


    it "should check index page for correct element", priority: "1", test_id: 140217 do
      title = "blarg"
      location = "brighton"

      create_appointment_group(:location_name => location, :title => title)
      get "/calendar2"
      click_scheduler_link

      # Index page should show correct elements for appointment groups
      expect(f(".view_calendar_link")).to include_text(title)
      expect(f(".ag-context")).to include_text @course.name.to_s
      expect(f(".ag-location")).to include_text(location)
    end

    context "when un-reserving appointments" do
      before :once do
        create_appointment_group(
          max_appointments_per_participant: 1,
          # if participant_visibility is 'private', the event_details popup resizes,
          # causing fragile tests in Chrome
          participant_visibility: 'protected',
          new_appointments: [
            [ 30.minutes.from_now, 1.hour.from_now ]
          ]
        )
        AppointmentGroup.last.appointments.first.reserve_for(@student, @teacher)
      end

      it "should let me do so from the month view", priority: "1", test_id: 140200 do
        load_month_view

        scheduler_event.click
        move_to_click('.event-details .unreserve_event_link')
        wait_for_ajaximations
        f('#delete_event_dialog~.ui-dialog-buttonpane .btn-primary').click

        expect(f("#content")).not_to contain_css('.fc-event.scheduler-event')
      end

      it "should let me do so from the week view", priority: "1", test_id: 502483 do
        load_week_view

        scheduler_event.click
        move_to_click('.event-details .unreserve_event_link')
        wait_for_ajaximations
        f('#delete_event_dialog~.ui-dialog-buttonpane .btn-primary').click

        expect(f("#content")).not_to contain_css('.fc-event.scheduler-event')
      end

      it "should let me do so from the agenda view", priority: "1", test_id: 502484 do
        load_agenda_view

        agenda_item.click
        move_to_click('.event-details .unreserve_event_link')
        wait_for_ajaximations
        f('#delete_event_dialog~.ui-dialog-buttonpane .btn-primary').click

        expect(f("#content")).not_to contain_css('.agenda-event__item-container')
      end

      it "should let me do so from the scheduler", priority: "1", test_id: 502485 do
        get "/calendar2"
        click_scheduler_link
        click_appointment_link

        agenda_item.click
        f('.unreserve_event_link').click
        f('#delete_event_dialog~.ui-dialog-buttonpane .btn-primary').click

        wait_for_ajaximations

        expect(agenda_item).to include_text "Available"
      end
    end

    it "does not allow unreserving past appointments" 

  end
end

