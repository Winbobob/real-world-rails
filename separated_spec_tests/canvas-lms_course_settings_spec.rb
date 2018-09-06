#
# Copyright (C) 2011 - present Instructure, Inc.
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

describe "course settings" do
  include_context "in-process server selenium tests"

  before (:each) do
    course_with_teacher_logged_in :limit_privileges_to_course_section => false
    @account = @course.account
  end

  it "should show unused tabs to teachers" 


  describe "course details" do
    def test_select_standard_for(context)
      grading_standard_for context
      get "/courses/#{@course.id}/settings"

      f('.grading_standard_checkbox').click unless is_checked('.grading_standard_checkbox')
      f('.edit_letter_grades_link').click
      f('.find_grading_standard_link').click
      wait_for_ajaximations

      fj('.grading_standard_select:visible a').click
      fj('button.select_grading_standard_link:visible').click
      f('.done_button').click
      submit_form('#course_form')
      wait_for_ajaximations

      @course.reload
      expect(@course.grading_standard).to eq(@standard)
    end

    it 'should show the correct course status when published' 


    it 'should show the correct course status when unpublished' 


    it "should show the correct status with a tooltip when published and graded submissions" 


    it "should allow selection of existing course grading standard" 


    it "should allow selection of existing account grading standard" 


    it "should toggle more options correctly" 


    it "should show the self enrollment code and url once enabled" 


    it "should enable announcement limit if show announcements enabled" 

  end

  describe "course items" do

    it "should change course details" 


    it "should only allow less resrictive options in Customize visibility" 


    it "should disable from Course Navigation tab", priority: "1", test_id: 112172 do
      get "/courses/#{@course.id}/settings#tab-navigation"
      ff(".al-trigger")[0].click
      ff(".icon-x")[0].click
      wait_for_ajaximations
      f('#nav_form > p:nth-of-type(2) > button.btn.btn-primary').click
      wait_for_ajaximations
      f('.student_view_button').click
      wait_for_ajaximations
      expect(f("#content")).not_to contain_link("Home")
    end

    describe "move dialog" do
      it "should return focus to cog menu button when disabling an item" 

    end

    it "should add a section" 


    it "should delete a section" 


    it "should edit a section" 


    # TODO reimplement per CNVS-29605, but make sure we're testing at the right level
    it "should move a nav item to disabled"
  end

  context "right sidebar" do
    it "should allow entering student view from the right sidebar" 


    it "should allow leaving student view" 


    it "should allow resetting student view" 


    it "should not include student view student in the statistics count" 


    it "should show the count of custom role enrollments" 

  end

  it "should disable inherited settings if locked by the account" 


  it "should disable editing settings if :manage rights are not granted" 


  it "should let a sub-account admin edit enrollment term" 


  context "link validator" do
    it "should validate all the links" 


    it "should be able to filter links to unpublished content" 

  end
end

