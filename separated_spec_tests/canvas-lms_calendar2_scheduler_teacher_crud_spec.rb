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
require File.expand_path(File.dirname(__FILE__) + '/../helpers/scheduler_common')

describe "scheduler" do
  include_context "in-process server selenium tests"
  include Calendar2Common
  include SchedulerCommon

  context "as a teacher" do

    before(:once) do
      Account.default.tap do |a|
        a.settings[:show_scheduler]   = true
        a.settings[:agenda_view]      = true
        a.save!
      end
    end

    before(:each) do
      course_with_teacher_logged_in
      make_full_screen
    end

    it "should create a new appointment group" 


    it "should create appointment group and go back and publish it", priority: "1", test_id: 85934 do
      get "/calendar2"
      click_scheduler_link

      create_appointment_group_manual(:publish => false)
      new_appointment_group = AppointmentGroup.last
      expect(new_appointment_group.workflow_state).to eq 'pending'
      expect(f('.ag-x-of-x-signed-up')).to include_text('unpublished')
      open_edit_dialog
      edit_form = f('#edit_appointment_form')
      expect(edit_form).to be_displayed
      f('.ui-dialog-buttonset .Button--primary').click
      wait_for_ajaximations
      new_appointment_group.reload
      expect(new_appointment_group.workflow_state).to eq 'active'
    end

    it "should edit an appointment group" 


    it "should edit an appointment group after clicking appointment group link" 


    it "should select the correct course sections when editing an appointment group" 


    it "should allow section limited teachers to create appointment groups for their own sections" 


    it "should delete an appointment group", priority: "1", test_id: 140216 do
      create_appointment_group
      get "/calendar2"
      click_scheduler_link

      appointment_group = f('.appointment-group-item')
      driver.action.move_to(appointment_group).perform
      click_al_option('.delete_link')
      delete_appointment_group
      expect(f('.list-wrapper')).to include_text('You have not created any appointment groups')
    end

    it "should delete an appointment group after clicking appointment group link" 


    it "should delete the appointment group from the calendar" 


    it "should check index page for correct element", priority: "1", test_id: 85949 do
      title = "blarg"
      location = "brighton"

      create_appointment_group(:location_name => location, :title => title)
      get "/calendar2"
      click_scheduler_link

      # Index page should show correct elements for appointment groups
      expect(f(".view_calendar_link")).to include_text(title)
      expect(f(".ag-context")).to include_text @course.name.to_s
      expect(f(".ag-location")).to include_text location
      expect(f(".ag-x-of-x-signed-up")).to include_text "people have signed up"
      expect(f(".icon-settings")).not_to be_nil #Gear icon present
    end
  end
end

