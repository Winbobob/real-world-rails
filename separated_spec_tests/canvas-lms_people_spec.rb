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

describe "people" do
  include_context "in-process server selenium tests"

  before(:once) do
    make_full_screen
  end

  def add_user(option_text, username, user_list_selector)
    click_option('#enrollment_type', option_text)
    f('textarea.user_list').send_keys(username)
    f('.verify_syntax_button').click
    wait_for_ajax_requests
    expect(f('#user_list_parsed')).to include_text(username)
    f('.add_users_button').click
    wait_for_ajaximations
    expect(f(user_list_selector)).to include_text(username)
  end

  def open_student_group_dialog
    f('#add-group-set').click
    dialog = fj('.ui-dialog:visible')
    expect(dialog).to be_displayed
    dialog
  end

  def create_student_group(group_text = "new student group")
    expect_new_page_load do
      f("#people-options .Button").click
      fln('View User Groups').click
    end
    open_student_group_dialog
    replace_content(f('#new_category_name'), group_text)
    submit_form('.group-category-create')
    wait_for_ajaximations
    expect(f('.collectionViewItems')).to include_text(group_text)
  end

  def enroll_student(student)
    e1 = @course.enroll_student(student)
    e1.workflow_state = 'active'
    e1.save!
    @course.reload
  end

  def enroll_ta(ta)
    e1 = @course.enroll_ta(ta)
    e1.workflow_state = 'active'
    e1.save!
    @course.reload
  end

  def create_user(student_name)
    user = User.create!(:name => student_name)
    user.register!
    user.pseudonyms.create!(:unique_id => student_name, :password => 'qwertyuiop', :password_confirmation => 'qwertyuiop')
    @course.reload
    user
  end

  def enroll_more_students
    student_1 = create_user("jake@test.com")
    student_2 = create_user("test@test.com")
    student_3 = create_user("new@test.com")
    student_4 = create_user("this@test.com")
    enroll_student(student_1)
    enroll_student(student_2)
    enroll_student(student_3)
    enroll_student(student_4)
  end

  def open_dropdown_menu(selector = ".rosterUser")
    row = f(selector)
    driver.action.move_to(row).perform
    f("#{selector} .admin-links a.al-trigger").click
    expect(f("#{selector} .admin-links ul.al-options")).to be_displayed
  end

  def expect_dropdown_item(option, selector = ".rosterUser")
    expect(f("#{selector} .admin-links ul.al-options li a[data-event=#{option}]")).to be_truthy
  end

  def expect_no_dropdown_item(option, selector = ".rosterUser")
    expect(f("#{selector} .admin-links ul.al-options")).not_to contain_css("li a[data-event=#{option}]")
  end

  # Returns visibility boolean, assumes existence
  def dropdown_item_visible?(option, selector = ".rosterUser")
    f("#{selector} .admin-links ul.al-options li a[data-event=#{option}]").displayed?
  end

  def close_dropdown_menu
    driver.action.send_keys(:escape).perform
  end

  context "people as a teacher" do

    before (:each) do
      course_with_teacher_logged_in

      # add first student
      @student_1 = create_user('student@test.com')

      enroll_student(@student_1)

      # adding users for tests to work correctly
      @test_teacher = create_user('teacher@test.com')
      @student_2 = create_user('student2@test.com')
      @test_ta = create_user('ta@test.com')
      @test_observer = create_user('observer@test.com')

      enroll_ta(@test_ta)
    end

    it "should have tabs" 


    it "should display a dropdown menu when item cog is clicked" 


    it "should display the option to remove a student from a course if manually enrolled" 


    it "should display the option to remove a student from a course has a SIS ID", priority: "1", test_id: 336018 do
      @course.sis_source_id = 'xyz'
      @course.save
      enroll_student(@student_2)
      # need to hit /users page again to show enrollment of 2nd student
      get "/courses/#{@course.id}/users"
      wait_for_ajaximations
      # check 1st student
      open_dropdown_menu("tr[id=user_#{@student_1.id}]")
      expect(dropdown_item_visible?('removeFromCourse', "tr[id=user_#{@student_1.id}]")).to be true
      close_dropdown_menu
      # check 2nd student
      open_dropdown_menu("tr[id=user_#{@student_2.id}]")
      expect(dropdown_item_visible?('removeFromCourse', "tr[id=user_#{@student_2.id}]")).to be true
    end

    it "should display remove option for student with/without SIS id", priority: "1", test_id: 332576 do
      enroll_student(@student_2)
      @student = user_with_managed_pseudonym
      @course.enroll_student(@student)
      @course.save
      get "/courses/#{@course.id}/users"
      # check 1st student
      open_dropdown_menu("tr[id=user_#{@student_1.id}]")
      expect(dropdown_item_visible?('removeFromCourse', "tr[id=user_#{@student_1.id}]")).to be true
      close_dropdown_menu
      # check 2nd student
      open_dropdown_menu("tr[id=user_#{@student_2.id}]")
      expect(dropdown_item_visible?('removeFromCourse', "tr[id=user_#{@student_2.id}]")).to be true
    end

    it "should display the option to remove a ta from the course" 


    it "should display activity report on clicking Student Interaction button", priority: "1", test_id: 244446 do
      get "/courses/#{@course.id}/users"
      f("#people-options .Button").click
      fln("Student Interactions Report").click
      expect(f("h1").text).to eq "Teacher Activity Report for #{@user.name}"
    end

    it "should not display Student Interaction button for a student", priority: "1", test_id: 244450  do
      user_session(@student_1)
      get "/courses/#{@course.id}/users"
      expect(f("#content")).not_to contain_link("Student Interactions Report")
    end

    it "should focus on the + Group Set button after the tabs" 


    it "should validate the main page" 


    it "should navigate to registered services on profile page" 


    it "should make a new set of student groups" 


    it "should test self sign up functionality" 


    it "should test self sign up / group structure functionality" 


    it "should test group structure functionality" 


    it "should edit a student group" 


    it "should delete a student group" 


    it "should test prior enrollment functionality" 


    it "should deal with observers linked to multiple students" 


    it "allows conclude/restore without profiles enabled" 


    it "allows conclude/restore with profiles enabled" 

  end

  context "people as a TA" do

    before (:each) do
      course_with_ta_logged_in(:active_all => true)
    end

    it "should validate that the TA cannot delete / conclude or reset course" 


    # TODO reimplement per CNVS-29609, but make sure we're testing at the right level
    it "should validate that a TA cannot rename a teacher"
  end

  context "people as a student" do

    before (:each) do
      course_with_student_logged_in(:active_all => true)
    end

    it "should not link avatars to a user's profile page if profiles are disabled" 


  end

  context "course with multiple sections", priority: "2" do
    before(:each) do
      course_with_teacher_logged_in
      @section2 = @course.course_sections.create!(name: 'section2')
    end

    it "should save add people form data" 


    it "should add a student to a section", priority: "1", test_id: 296460 do
      student = create_user("student@example.com")
      enroll_student(student)
      get "/courses/#{@course.id}/users"
      f(".StudentEnrollment .icon-more").click
      fln("Edit Sections").click
      f(".token_input.browsable").click
      section_input_element = driver.find_element(:name, "token_capture")
      section_input_element.send_keys("section2")
      f('.last.context').click
      wait_for_ajaximations
      ff('.ui-button-text')[1].click
      wait_for_ajaximations
      expect(ff(".StudentEnrollment")[0]).to include_text("section2")
    end

    it "should remove a student from a section", priority: "1", test_id: 296461 do
     @student = user_factory
     @course.enroll_student(@student, allow_multiple_enrollments: true)
     @course.enroll_student(@student, section: @section2, allow_multiple_enrollments: true)
     get "/courses/#{@course.id}/users"
     f(".StudentEnrollment .icon-more").click
     fln("Edit Sections").click
     fln("Remove user from section2").click
     ff('.ui-button-text')[1].click
     wait_for_ajaximations
     expect(ff(".StudentEnrollment")[0]).not_to include_text("section2")
    end

    it "removes students linked to an observer" 


    it "should gray out sections the user doesn't have permission to remove" 

  end

  it "should get the max total activity time" 


  it "should filter by role ids" 


  context "editing role" do
    before :once do
      course_factory
      @section = @course.course_sections.create!(name: "section1")

      @teacher = user_with_pseudonym(:active_all => true)
      @enrollment = @course.enroll_teacher(@teacher)
    end

    before :each do
      admin_logged_in
    end

    it "should let observers have their roles changed if they don't have associated users" 


    it "should not let observers with associated users have their roles changed" 


    def open_role_dialog(user)
      f("#user_#{user.id} .admin-links a.al-trigger").click
      f("#user_#{user.id} .admin-links a[data-event='editRoles']").click
    end

    it "should let users change to an observer role" 


    it "should not let users change to a type they don't have permission to manage" 


    it "should retain the same enrollment state" 


    it "should work with enrollments in different sections" 


    it "should work with preexiting enrollments in the destination role" 


    it "should work with multiple enrollments in one section" 


    it "should not show the option to edit roles for a soft-concluded course" 


    it "should not show the option to edit roles for a SIS imported enrollment" 


    it "should redirect to groups page " 


    context "student tray" do

      before(:each) do
        @account = Account.default
        @account.enable_feature!(:student_context_cards)
        @student = create_user('student@test.com')
        @course.enroll_student(@student, enrollment_state: :active)
      end

      it "course people page should display student name in tray", priority: "1", test_id: 3022066 do
        get("/courses/#{@course.id}/users")
        f("a[data-student_id='#{@student.id}']").click
        expect(f(".StudentContextTray-Header__Name h2 a")).to include_text("student@test.com")
      end
    end
  end

  it "should not show unenroll link to admins without permissions" 

end

