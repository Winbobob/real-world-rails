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

describe "course sections" do
  include_context "in-process server selenium tests"

  def add_enrollment(enrollment_state, section)
    enrollment = student_in_course(:workflow_state => enrollment_state, :course_section => section)
    enrollment.accept! if enrollment_state == 'active' || enrollment_state == 'completed'
  end

  def table_rows
    ff('#enrollment_table tr')
  end

  before (:each) do
    course_with_teacher_logged_in
    @section = @course.default_section
  end

  it "should validate the display when multiple enrollments exist" 


  it "should validate the display when only 1 enrollment exists" 


  it "should display the correct pending enrollments count" 


  it "should display the correct completed enrollments count" 


  it "should edit the section" 


  it "should parse dates" 


  context "account admin" do
    before do
      Account.default.role_overrides.create! role: Role.get_built_in_role('AccountAdmin'), permission: 'manage_sis', enabled: true
      @subaccount = Account.default.sub_accounts.create! name: 'sub'
      course_factory account: @subaccount
      @section = @course.course_sections.create! name: 'sec'
    end

    it "lets a root account admin modify the sis ID" 


    it "does not let a subaccount admin modify the sis ID" 

  end

  context "student tray" do

    before(:each) do
      @account = Account.default
      @account.enable_feature!(:student_context_cards)
    end

    it "course section page should display student name in tray", priority: "1", test_id: 3022068 do
      add_enrollment("active", @section)
      get("/courses/#{@course.id}/sections/#{@section.id}")
      f("a[data-student_id='#{@student.id}']").click
      expect(f(".StudentContextTray-Header__Name h2 a")).to include_text("User")
    end
  end
end

