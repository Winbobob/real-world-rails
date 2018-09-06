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

describe "account" do
  include_context "in-process server selenium tests"

  before(:each) do
    course_with_admin_logged_in
  end

  def verify_displayed_term_dates(term, dates)
    dates.each do |en_type, date|
      expect(term.find_element(:css, ".#{en_type}_dates .start_date .show_term").text).to match(/#{date[0]}/)
      expect(term.find_element(:css, ".#{en_type}_dates .end_date .show_term").text).to match(/#{date[1]}/)
    end
  end

  describe "course and term create/update" do

    it "should show Login and Email fields in add user dialog for delegated auth accounts" 


    it "should be able to create a new course" 


    it "should be able to create a new course when no other courses exist" 


    it "should be able to add a term" 


    it 'general term dates', priority: 1, test_id: 1621631 do
      get "/accounts/#{Account.default.id}/terms"
      term = f("tr.term")
      f('.edit_term_link').click
      f('.editing_term .general_dates .start_date .edit_term input').send_keys("2011-07-01")
      f('.editing_term .general_dates .end_date .edit_term input').send_keys("2011-07-31")
      f(".submit_button").click
      expect(term).not_to have_class("editing_term")
      verify_displayed_term_dates(term, {
          :general => ["Jul 1", "Jul 31"],
          :student_enrollment => ["term start", "term end"],
          :teacher_enrollment => ["whenever", "term end"],
          :ta_enrollment => ["whenever", "term end"]
      })
    end

    it 'student enrollment dates', priority: 1, test_id: 1621632 do
      get "/accounts/#{Account.default.id}/terms"
      term = f("tr.term")
      f('.edit_term_link').click
      f('.editing_term .student_enrollment_dates .start_date .edit_term input').send_keys("2011-07-02")
      f('.editing_term .student_enrollment_dates .end_date .edit_term input').send_keys("2011-07-30")
      f(".submit_button").click
      expect(term).not_to have_class("editing_term")
      verify_displayed_term_dates(term, {
          :general => ["whenever", "whenever"],
          :student_enrollment => ["Jul 2", "Jul 30"],
          :teacher_enrollment => ["whenever", "term end"],
          :ta_enrollment => ["whenever", "term end"]
      })
    end

    it 'teacher enrollment dates', priority: 1, test_id: 1621633 do
      get "/accounts/#{Account.default.id}/terms"
      term = f("tr.term")
      f('.edit_term_link').click
      f('.editing_term .teacher_enrollment_dates .start_date .edit_term input').send_keys("2011-07-03")
      f('.editing_term .teacher_enrollment_dates .end_date .edit_term input').send_keys("2011-07-29")
      f(".submit_button").click
      expect(term).not_to have_class("editing_term")
      verify_displayed_term_dates(term, {
          :general => ["whenever", "whenever"],
          :student_enrollment => ["term start", "term end"],
          :teacher_enrollment => ["Jul 3", "Jul 29"],
          :ta_enrollment => ["whenever", "term end"]
      })
    end

    it 'ta enrollment dates', priority: 1, test_id: 1621934 do
      get "/accounts/#{Account.default.id}/terms"
      term = f("tr.term")
      f('.edit_term_link').click
      f('.editing_term .ta_enrollment_dates .start_date .edit_term input').send_keys("2011-07-04")
      f('.editing_term .ta_enrollment_dates .end_date .edit_term input').send_keys("2011-07-28")
      f(".submit_button").click
      expect(term).not_to have_class("editing_term")
      verify_displayed_term_dates(term, {
          :general => ["whenever", "whenever"],
          :student_enrollment => ["term start", "term end"],
          :teacher_enrollment => ["whenever", "term end"],
          :ta_enrollment => ["Jul 4", "Jul 28"]
      })
    end
  end

  describe "user/course search" do
    def submit_input(form_element, input_field_css, input_text, expect_new_page_load = true)
      form_element.find_element(:css, input_field_css).send_keys(input_text)
      go_button = form_element.find_element(:css, 'button')
      if expect_new_page_load
        expect_new_page_load { go_button.click }
      else
        go_button.click
      end
    end

    before(:each) do
      @student_name = 'student@example.com'
      @course_name = 'new course'
      @error_text = 'No Results Found'

      @course = Course.create!(:account => Account.default, :name => @course_name, :course_code => @course_name)
      @course.reload
      student_in_course(:name => @student_name)
      get "/accounts/#{Account.default.id}/courses"
    end

    it "should search for an existing course" 


    it "should correctly autocomplete for courses" 


    it "should search for an existing user" 


    it "should behave correctly when searching for a course that does not exist" 


    it "should behave correctly when searching for a user that does not exist" 

  end

  describe "user details view" do
    def create_sub_account(name = 'sub_account', parent_account = Account.default)
      Account.create(:name => name, :parent_account => parent_account)
    end

    it "should be able to view user details from parent account" 

  end
end

