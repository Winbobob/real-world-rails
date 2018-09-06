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

describe "course people" do
  include_context "in-process server selenium tests"

  before(:once) do
    # in the people table, the kyle menu can be off the screen
    # and uninteractable if the window is too small
    make_full_screen
  end

  before (:each) do
    course_with_teacher_logged_in :limit_privileges_to_course_section => false
    @account = @course.account # for custom roles
    @custom_student_role = custom_student_role("custom stu")
  end

  def add_user(email, type, section_name=nil)
    get "/courses/#{@course.id}/users"
    add_button = f('#addUsers')
    expect(add_button).to be_displayed
    add_button.click
    wait_for_ajaximations

    click_option("#peoplesearch_select_role", type)
    click_option("#peoplesearch_select_section", section_name) if section_name
    replace_content(f(".addpeople__peoplesearch textarea"), email)

    f("#addpeople_next").click
    expect(f(".addpeople__peoplereadylist tbody tr")).to include_text(email)

    f("#addpeople_next").click
  end

  describe "course users" do
    def select_from_auto_complete(text, input_id)
      fj(".token_input input:visible").send_keys(text)
      wait_for_ajaximations

      keep_trying_until { driver.execute_script("return $('##{input_id}').data('token_input').selector.list.query.search") == text }
      wait_for_ajaximations
      elements = ffj(".autocomplete_menu:visible .list:last ul:last li").map { |e|
        [e, (e.find_element(:tag_name, :b).text rescue e.text)]
      }
      wait_for_ajaximations
      element = elements.detect { |e| e.last == text }
      expect(element).not_to be_nil
      element.first.click
      wait_for_ajaximations
    end

    def go_to_people_page
      get "/courses/#{@course.id}/users"
    end

    def kyle_menu_css(user, role = nil)
      if role
        role_name = if role.respond_to?(:name)
          role.name
        else
          role
        end
        "#user_#{user.id}.#{role_name} .admin-links"
      else
        "#user_#{user.id} .admin-links"
      end
    end

    def kyle_menu(user, role = nil)
      f(kyle_menu_css(user, role))
    end

    def open_kyle_menu(user, role = nil)
      cog = kyle_menu(user, role)
      f('.al-trigger', cog).click
      wait_for_ajaximations
      cog
    end

    def remove_user(user, role = nil)
      cog = open_kyle_menu(user, role)
      f('a[data-event="removeFromCourse"]', cog).click
      driver.switch_to.alert.accept
      wait_for_ajaximations
    end

    it "should remove a user from the course" 


    def add_user_to_second_section(role = nil, enrollment_state = 'invited')
      role ||= student_role
      student_in_course(:user => user_with_pseudonym, :role => role, :enrollment_state => enrollment_state)
      section_name = 'Another Section'
      add_section(section_name)
      # open tab
      go_to_people_page
      expect(f("#user_#{@student.id} .section")).not_to include_text(section_name)
      # open dialog
      use_edit_sections_dialog(@student) do
        # choose section
        select_from_auto_complete(section_name, 'section_input')
      end
      # expect
      expect(f("#user_#{@student.id}")).to include_text(section_name)
      expect(ff("#user_#{@student.id} .section").length).to eq 2
      @student.reload
      @student.enrollments.each{|e|expect(e.role_id).to eq role.id}
      @student.enrollments.each{|e|expect(e.workflow_state).to eq enrollment_state}
    end

    it "should add a user without custom role to another section" 


    it "adds an active enrollment to another section if the user has already accepted their enrollment" 


    it "should add a user to a second (active) section in a concluded course" 


    it "should view the users enrollment details" 


    it "should be able to deactivate and reactivate users" 


    def use_link_dialog(observer, role = nil)
      cog = open_kyle_menu(observer, role)
      f('a[data-event="linkToStudents"]', cog).click
      wait_for_ajaximations
      yield
      f('.ui-dialog-buttonpane .btn-primary').click
      wait_for_ajaximations
    end

    def use_edit_sections_dialog(user, role = nil)
      cog = open_kyle_menu(user, role)
      f('a[data-event="editSections"]', cog).click
      wait_for_ajaximations
      yield
      f('.ui-dialog-buttonpane .btn-primary').click
      wait_for_ajaximations
    end

    it "should deal with observers linked to multiple students" 


    it "should handle deleted observee enrollments" 


    %w[ta designer].each do |et|
      it "should not let #{et}s remove admins from the course" 

    end

    it "should not show the student view student" 


    context "multiple enrollments" do
      it "should link an observer enrollment when other enrollment types exist" 

    end

    context "custom roles" do
      it "should create new observer enrollments as custom type when adding observees" 


      it "should create new enrollments as custom type when adding sections" 


      def select_new_role_type(type)
        get "/courses/#{@course.id}/users"
        add_button = f('#addUsers')
        keep_trying_until { expect(add_button).to be_displayed }
        add_button.click
        click_option('#role_id', type)
      end

      %w[student teacher ta designer observer].each do |base_type|
        it "should allow adding custom #{base_type} enrollments" 

      end
    end

    it "should not remove a base enrollment when adding a custom enrollment of the same base type" 

  end

end

