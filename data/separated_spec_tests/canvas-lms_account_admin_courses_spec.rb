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

describe "account admin courses tab" do
  include_context "in-process server selenium tests"

  def add_course(course_name, has_student = false)
    Account.default.courses.create(:name => course_name).offer!
    course = Course.where(name: course_name).first
    if (has_student)
      user = User.create(:name => "student 1")
      course.enroll_user(user, "StudentEnrollment", {:enrollment_state => "active"})
    end
    # we need to refresh the page so the course shows up
    refresh_page
    expect(f("#course_#{course.id}")).to be_displayed
    expect(f("#course_#{course.id}")).to include_text course_name
    if (has_student)
      expect(f("#course_#{course.id}")).to include_text "1 Student"
    end
    course
  end

  context "add course basic" do
    describe "shared course specs" do
      let(:account) { Account.default }
      let(:url) { "/accounts/#{Account.default.id}" }

      before (:each) do
        course_with_admin_logged_in
      end

      it "should add a new course" 

    end
  end

  context "add courses" do

    before (:each) do
      course_with_admin_logged_in
      get "/accounts/#{Account.default.id}"
    end

    it "should search a course and verify it goes to the course" 


    it "should search a bogus course and it should not show up" 


    it "should hide enrollmentless courses" 


    it "should hide and then show enrollmentless courses" 

  end
end


