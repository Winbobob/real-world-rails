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

require File.expand_path(File.dirname(__FILE__) + '/common')
require File.expand_path(File.dirname(__FILE__) + '/helpers/calendar2_common')

describe "course copy" do
  include_context "in-process server selenium tests"
  include Calendar2Common

  def validate_course_main_page
    header = f('#breadcrumbs .home + li a')
    expect(header).to be_displayed
    expect(header.text).to eq @course.course_code
  end

  it "should copy the course" 


  # TODO reimplement per CNVS-29604, but make sure we're testing at the right level
  it "should copy the course with different settings"

  it "should set the course name and code correctly" 


  it "should adjust the dates" 


  it "should remove dates" 


  it "should create the new course in the same sub-account" 


  it "should create the new course with the default enrollment term if needed" 


  it "should not be able to submit invalid course dates" 


  context "with calendar events" do
    around do |example|
      Timecop.freeze(Time.zone.local(2016, 5, 1, 10, 5, 0), &example)
    end

    before(:each) do
      course_with_admin_logged_in
      @date_to_use = 2.weeks.from_now.monday.strftime("%Y-%m-%d")
    end

    it "shifts the dates a week later", priority: "2", test_id: 2953906 do
      get "/calendar"
      quick_jump_to_date(@date_to_use)
      create_calendar_event('Monday Event', true, false, false, @date_to_use, true)
      get "/courses/#{@course.id}/copy"
      new_course_name = "copied course"
      replace_content(f("input[type=text][id=course_name]"), new_course_name)
      replace_content(f("input[type=text][id=course_course_code]"), "copied")
      f("input[type=checkbox][id=dateAdjustCheckbox]").click
      date = 1.week.from_now.strftime("%Y-%m-%d")
      replace_content(f("input[type=text][id=newStartDate]"), date)
      submit_form('#copy_course_form')
      run_jobs
      expect(f('div.progressStatus span')).to include_text 'Completed'
      get "/calendar#view_name=week"
      quick_jump_to_date(@date_to_use)
      f('.fc-event').click
      expect(f('.event-details-content')).to include_text("#{@course.name}")
      f('.navigate_next').click
      f('.fc-event').click
      expect(f('.event-details-content')).to include_text("#{new_course_name}")
    end
  end
end

