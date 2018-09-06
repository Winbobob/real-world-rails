#
# Copyright (C) 2013 - present Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/../cassandra_spec_helper')

describe "admin_tools" do
  include_context "in-process server selenium tests"
  include Calendar2Common
  include CustomScreenActions

  def load_admin_tools_page
    get "/accounts/#{@account.id}/admin_tools"
    wait_for_ajaximations
  end

  def perform_user_search(form_sel, search_term, click_row = 0)
    set_value f("#{form_sel} input[name=search_term]"), search_term
    sleep 0.2 # 0.2 s delay before the search fires
    wait_for_ajaximations
    fj("#{form_sel} .roster tbody tr:nth(#{click_row}) td").click
  end

  def perform_autocomplete_search(field_sel, search_term, click_row = 0)
    set_value f(field_sel), search_term
    sleep 0.5
    wait_for_ajaximations
    autocomplete_value = fj(".ui-autocomplete.ui-menu > .ui-menu-item:nth(#{click_row}) > a")
    autocomplete_value.click
    autocomplete_value
  end

  def setup_users
    # Setup a student (@student)
    course_with_student(:active_all => true, :account => @account, :user => user_with_pseudonym(:name => 'Student TestUser'))
    user_with_pseudonym(:user => @student, :account => @account)

    setup_account_admin
  end

  def setup_account_admin(permissions = {:view_notifications => true})
    # Setup an account admin (@account_admin) and logged in.
    account_admin_user_with_role_changes(:account => @account, :role_changes => permissions)
    @account_admin = @admin
    user_with_pseudonym(:user => @account_admin, :account => @account)
    user_session(@account_admin)
  end

  def click_view_tab(tab_name)
    wait_for_ajaximations
    tab = fj("#adminToolsTabs .#{tab_name} > a")
    tab.click
    wait_for_ajaximations
  end

  def change_log_type(log_type)
    wait_for_ajaximations
    click_option("#loggingType", "\#logging#{log_type}", :value)
    wait_for_ajaximations
  end

  def show_event_details(event_type, search_term = nil, event = nil)
    search_term ||= @course.name
    event ||= @event

    perform_autocomplete_search("#course_id-autocompleteField", search_term)
    f('#loggingCourse button[name=course_submit]').click
    wait_for_ajaximations

    cols = ffj('#courseLoggingSearchResults table tbody tr:last td')
    expect(cols[3].text).to eq event_type

    fj('#courseLoggingSearchResults table tbody tr:last td:last a').click
    expect(fj('.ui-dialog dl dd:first').text).to eq event.id
  end

  before do
    @account = Account.default
    setup_users
  end

  context "View Notifications" do
    before :each do
      @account.settings[:admins_can_view_notifications] = true
      @account.save!
    end

    def click_view_notifications_tab
      click_view_tab("notifications")
    end

    context "as SiteAdmin" do
      it "should perform search without account setting or user permission" 

    end

    context "as AccountAdmin" do
      context "with permissions" do
        it "should perform search" 


        it "should display nothing found" 


        it "should display valid search params used" 


        it "should display an error when given invalid input data" 


        it "should hide tab if account setting disabled" 

      end

      context "without permissions" do
        it "should not see tab" 

      end
    end
  end

  context "Logging" do
    include_examples "cassandra audit logs"

    it "should change log types with dropdown" 


    context "permissions" do
      it "should include options activity with permissions" 


      context "without permissions" do
        it "should not see tab" 


        it "should not include login activity option for revoked permission" 


        it "should not include grade change activity option for revoked permission" 


        it "should not include course change activity option for revoked permission" 

      end
    end
  end

  context "Authentication Logging" do
    include_examples "cassandra audit logs"

    before do
      Timecop.freeze(8.seconds.ago) do
        Auditors::Authentication.record(@student.pseudonyms.first, 'login')
      end
      Auditors::Authentication.record(@student.pseudonyms.first, 'logout')
      load_admin_tools_page
      click_view_tab "logging"
      change_log_type("Authentication")
    end

    it "should show log history" 


    it "should search by user name" 

  end

  context "Grade Change Logging" do
    include_examples "cassandra audit logs"

    before do
      Timecop.freeze(8.seconds.ago) do
        course_with_teacher(course: @course, :user => user_with_pseudonym(:name => 'Teacher TestUser'))
        @assignment = @course.assignments.create!(:title => 'Assignment', :points_possible => 10)
      end

      Timecop.freeze(5.seconds.ago) do
        @submission = @assignment.grade_student(@student, grade: 7, grader: @teacher).first
      end

      Timecop.freeze(3.seconds.ago) do
        @submission = @assignment.grade_student(@student, grade: 8, grader: @teacher).first
      end

      @submission = @assignment.grade_student(@student, grade: 9, grader: @teacher, graded_anonymously: true).first

      load_admin_tools_page
      click_view_tab "logging"
      change_log_type("GradeChange")
    end

    it "should search by grader name and show history" 


    it "displays 'y' if graded anonymously" 


    it "should search by student name" 


    it "should search by course id" 


    it "should search by assignment id" 


    it "should fail gracefully with invalid ids" 

  end

  context "Course Logging" do
    it_should_behave_like "cassandra audit logs"

    before do
      course_with_teacher(course: @course, :user => user_with_pseudonym(:name => 'Teacher TestUser'))

      load_admin_tools_page
      click_view_tab "logging"
      change_log_type("Course")
    end

    it "should search by course name and show history" 


    it "should search by course id" 


    it "should fail gracefully with invalid ids" 


    it "should find courses in any workflow state" 


    it "should show created event details" 


    it "should show updated event details" 


    it "should show sis batch id if source is sis" 


    it "should show concluded event details" 


    it "should show unconcluded event details" 


    it "should show deleted event details" 


    it "should show restored event details" 


    it "should show published event details" 


    it "should show copied_to event details" 


    it "should show copied_from event details" 


    it "should show reset_to event details" 


    it "should show reset_from event details" 

  end
end

