#
# Copyright (C) 2017 - present Instructure, Inc.
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

require_relative '../common'

shared_context "blueprint course settings context" do

  def blueprint_settings_options
    f('.blueprint_setting_options')
  end

  def content_checkbox_state
    is_checked('input[name="course[blueprint_restrictions][content]"][type=checkbox]')
  end

  def points_checkbox_state
    is_checked('input[name="course[blueprint_restrictions][points]"][type=checkbox]')
  end

  def due_dates_checkbox_state
    is_checked('input[name="course[blueprint_restrictions][due_dates]"][type=checkbox]')
  end

  def availability_dates_checkbox_state
    is_checked('input[name="course[blueprint_restrictions][availability_dates]"][type=checkbox]')
  end

end

describe "course settings/blueprint" do
  include_context "in-process server selenium tests"
  include_context "blueprint course settings context"

  before :once do
    Account.default.enable_feature! :master_courses
    account_admin_user
    course_factory :active_all => true
  end

  describe "as admin" do
    before :each do
      user_session @admin
    end

    it "enables blueprint course and set default restrictions", priority: "1", test_id: 3166299 do
      get "/courses/#{@course.id}/settings"
      f('.bcs_check-box').find_element(:xpath, "../div").click
      wait_for_animations
      expect(blueprint_settings_options).to be_displayed

      expect(content_checkbox_state).to eq true # checked by default
      expect(points_checkbox_state).to eq false
      expect(due_dates_checkbox_state).to eq false
      expect(availability_dates_checkbox_state).to eq false
      expect_new_page_load { submit_form('#course_form') }
      expect(MasterCourses::MasterTemplate.full_template_for(@course).default_restrictions).to eq(
        { content: true, points: false, due_dates: false, availability_dates: false }
      )
    end

    it "manipulates checkboxes" 


    it "disables blueprint course and hides restrictions" 


    it "can set granular locks" 

  end

  describe "as teacher" do
    before :each do
      user_session @teacher
    end

    it "shows No instead of a checkbox for normal courses" 


    it "shows Yes instead of a checkbox for blueprint courses" 


  end
end

