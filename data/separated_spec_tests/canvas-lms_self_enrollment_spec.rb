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

describe "self enrollment" do
  include_context "in-process server selenium tests"

  context "in a full course" do
    it "should not be allowed" 

  end

  shared_examples_for "open registration" do
    before do
      Account.default.update_attribute(:settings, :self_enrollment => 'any', :open_registration => true)
      Account.default.canvas_authentication_provider.update_attribute(:self_registration, true)
      course_factory(:active_all => active_course)
      set_up_course
      @course.update_attribute(:self_enrollment, true)
    end

    it "should register a new user" 


    it "should authenticate and register an existing user" 


    it "should register an authenticated user" 


    it "should not error with a user that is already enrolled" 

  end

  shared_examples_for "closed registration" do
    before do
      Account.default.allow_self_enrollment!
      course_factory(:active_all => active_course)
      set_up_course
      @course.update_attribute(:self_enrollment, true)
    end

    it "should not register a new user" 


    it "should authenticate and register an existing user" 


    it "should register an authenticated user" 


    it "should not error with a user that is already enrolled" 

  end

  context "in a published course" do
    let(:active_course){ true }
    let(:set_up_course){ }
    let(:primary_action){ "Go to the Course" }
    let(:assert_valid_dashboard) {
      expect(f('#global_nav_courses_link')).to include_text("Courses")
    }

    context "with open registration" do
      include_examples "open registration"
    end
    context "without open registration" do
      include_examples "closed registration"
    end
  end

  context "in a not-yet-started course" do
    let(:active_course){ true }
    let(:set_up_course) {
      @course.start_at = 1.week.from_now
      @course.restrict_enrollments_to_course_dates = true
      @course.save!
    }
    let(:primary_action){ "Go to your Dashboard" }
    let(:assert_valid_dashboard) {
      expect(f('#global_nav_courses_link')).to include_text("Courses") # show for future course
      expect(f('#dashboard')).to include_text("You've enrolled in one or more courses that have not started yet")
    }
    context "with open registration" do
      include_examples "open registration"
    end
    context "without open registration" do
      include_examples "closed registration"
    end
  end

  context "in an unpublished course" do
    let(:active_course){ false }
    let(:set_up_course){ }
    let(:primary_action){ "Go to your Dashboard" }
    let(:assert_valid_dashboard) {
      expect(f('#global_nav_courses_link')).to include_text("Courses")
      expect(f('#dashboard')).to include_text("You've enrolled in one or more courses that have not started yet")
    }
    context "with open registration" do
      include_examples "open registration"
    end
    context "without open registration" do
      include_examples "closed registration"
    end
  end

end

