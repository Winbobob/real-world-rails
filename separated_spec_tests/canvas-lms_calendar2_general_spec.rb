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

  before(:once) do
    # or some stuff we need to click is "below the fold"
    make_full_screen
  end

  before(:each) do
    Account.default.tap do |a|
      a.settings[:show_scheduler] = true
      a.save!
    end
  end

  context "as a teacher" do
    before(:each) do
      course_with_teacher_logged_in
    end

    context "with Better Scheduler enabled" do
      before(:each) do
        account = Account.default
        account.enable_feature! :better_scheduler
      end

      it "should let me go to the Edit Appointment group page from the appointment group slot dialog" 


    end

    it "should let me message students who have signed up for an appointment" 


    it "editing an existing assignment should select the correct assignment group" 


    it "editing an existing assignment should preserve more options link", priority: "1", test_id: 138854 do
      assignment = @course.active_assignments.create!(:name => "to edit", :due_at => Time.zone.now)
      get "/calendar2"
      f('.fc-event').click
      wait_for_ajaximations
      hover_and_click '.edit_event_link'
      wait_for_ajaximations
      original_more_options = f('.more_options_link')['href']
      expect(original_more_options).not_to match(/undefined/)
      replace_content(f('.ui-dialog #assignment_title'), "edited title")
      submit_form('#edit_assignment_form')
      wait_for_ajaximations
      assignment.reload
      wait_for_ajaximations
      expect(assignment.title).to include("edited title")

      f('.fc-event').click
      wait_for_ajaximations
      hover_and_click '.edit_event_link'
      wait_for_ajaximations
      expect(f('.more_options_link')['href']).to match(original_more_options)
    end

    it "should make an assignment undated if you delete the start date" 


    context "event editing", priority: "1", test_id: 138853 do
      it "should allow editing appointment events" 


      it "allows moving events between calendars" 

    end

    context "time zone" do
      before do
        @user.time_zone = 'America/Denver'
        @user.save!
      end

      it "should display popup with correct day on an event" 


      it "should display popup with correct day on an assignment" 


      it "should display popup with correct day on an assignment override" 

    end

    it "should test the today button" 


    it "should allow viewing an unenrolled calendar via include_contexts" 


    it "should only consider active enrollments for upcoming events list", priority: "2", test_id: 854796 do
      make_event(title: "Test Event", start: Time.zone.now + 1.day, context: @course)
      get "/"
      expect(f('.coming_up').text).to include('Test Event')
      term = EnrollmentTerm.find(@course.enrollment_term_id)
      term.end_at = Time.zone.now.advance(days: -5)
      term.save!
      refresh_page
      expect(f('.coming_up')).to include_text('Nothing for the next week')
    end

    it "graded discussion appears on all calendars", priority: "1", test_id: 138851 do
      create_graded_discussion

      # Even though graded discussion overwrites its assignment's title, less fragile to grab discussion's title
      assert_views(@gd.title,@assignment.due_at)
    end

    it "event appears on all calendars", priority: "1", test_id: 138846 do
      title = 'loom'
      due_time = 5.minutes.from_now
      @course.calendar_events.create!(title: title, start_at: due_time)

      assert_views(title,due_time)
    end

    it "assignment appears on all calendars", priority: "1", test_id: 238862 do
      title = 'Zak McKracken'
      due_time = 5.minutes.from_now
      @assignment = @course.assignments.create!(name: title, due_at: due_time)

      assert_views(title,due_time)
    end

    it "quiz appears on all calendars", priority: "1", test_id: 238863 do
      create_quiz

      assert_views(@quiz.title,@quiz.due_at)
    end
  end
end

