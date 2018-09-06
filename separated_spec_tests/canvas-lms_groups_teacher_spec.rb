#
# Copyright (C) 2015 - present Instructure, Inc.
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
require File.expand_path(File.dirname(__FILE__) + '/helpers/groups_common')
require_relative '../selenium/people/pages/course_groups_page'

describe "new groups" do
  include_context "in-process server selenium tests"
  include GroupsCommon

  context "as a teacher" do
    before(:each) do
      course_with_teacher_logged_in
    end

    it "should allow teachers to add a group set", priority: "1", test_id: 94152 do
      get "/courses/#{@course.id}/groups"
      click_add_group_set
      f('#new_category_name').send_keys("Test Group Set")

      save_group_set
      wait_for_ajaximations
      # Looks in the group tab list for the last item, which should be the group set
      expect(fj('.collectionViewItems[role=tablist]>li:last-child').text).to match "Test Group Set"
    end

    it "should allow teachers to create groups within group sets", priority: "1", test_id: 94153 do
      seed_groups(1,0)

      get "/courses/#{@course.id}/groups"

      expect(f('.btn.add-group')).to be_displayed
      f('.btn.add-group').click
      wait_for_ajaximations
      f('#group_name').send_keys("Test Group")
      f('#groupEditSaveButton').click
      wait_for_ajaximations
      expect(fj('.collectionViewItems.unstyled.groups-list>li:last-child')).to include_text("Test Group")
    end

    it "should allow teachers to add a student to a group", priority: "1", test_id: 94155 do
      # Creates one user, and one groupset with a group inside it
      group_test_setup(1,1,1)

      get "/courses/#{@course.id}/groups"

      # Tests the list of groups in the + button menu popup to see if it has the correct groups
      f('.assign-to-group').click
      wait_for_ajaximations
      setgroup = f('.set-group')
      expect(setgroup).to include_text(@testgroup[0].name)
      setgroup.click
      wait_for_ajaximations

      # Adds student to test group and then expands the group display to the right to verify he is in the group
      f('.toggle-group').click
      wait_for_ajaximations
      expect(f('.group-summary')).to include_text("1 student")
      expect(f('.group-user-name')).to include_text(@students.first.name)
    end

    it "should allow teachers to move a student to a different group", priority: "1", test_id: 94157 do
      # Creates 1 user, 1 groupset, and 2 groups within the groupset
      group_test_setup(1,1,2)
      # Add seeded student to first seeded group
      add_user_to_group(@students.first,@testgroup[0])

      get "/courses/#{@course.id}/groups"

      # Toggles the first group collapse arrow to see the student
      fj('.toggle-group :contains("Test Group 1")').click
      wait_for_ajaximations

      # Verifies the student is in their group
      expect(f('.group-user')).to include_text(@students[0].name)

      # Moves the student
      f('.group-user-actions').click
      wait_for_ajaximations
      f('.edit-group-assignment').click
      wait_for_ajaximations
      click_option('.move-select .move-select__group select', "#{@testgroup[1].name}")
      f('.move-select button[type="submit"]').click
      wait_for_ajaximations

      # Verifies the student count updates
      expect(ff('.group-summary')[1]).to include_text("1 student")

      # Verifies student is within new group
      fj('.toggle-group :contains("Test Group 2")').click
      wait_for_ajaximations
      expect(f('.group-user')).to include_text(@students.first.name)
    end

    it "should allow teachers to remove a student from a group", priority: "1", test_id: 94158 do
      group_test_setup
      add_user_to_group(@students.first,@testgroup[0])

      get "/courses/#{@course.id}/groups"

      f('.toggle-group').click
      wait_for_ajaximations

      remove_student_from_group

      expect(f('.ui-cnvs-scrollable')).to include_text(@students.first.name)
      expect(f('.unassigned-users-heading')).to include_text("Unassigned Students (1)")
      expect(f('.group-summary')).to include_text("0 students")
    end

    it "should not allow teachers to see sections specific dropdown on announcement page" 


    it "should allow teachers to make a student a group leader", priority: "1", test_id: 96021 do
      group_test_setup
      add_user_to_group(@students.first,@testgroup[0])

      get "/courses/#{@course.id}/groups"

      fj('.toggle-group :contains("Test Group 1")').click
      wait_for_ajaximations

      # Sets user as group leader
      f('.group-user-actions').click
      wait_for_ajaximations
      f('.set-as-leader').click
      wait_for_ajaximations

      # Looks for student to have a group leader icon
      expect(f('.group-leader .icon-user')).to be_displayed
      # Verifies group leader silhouette and leader's name appear in the group header
      expect(f('.span3.ellipsis.group-leader')).to be_displayed
      expect(f('.span3.ellipsis.group-leader')).to include_text(@students.first.name)

      check_element_has_focus f(".group-user-actions[data-user-id='user_#{@students.first.id}']")
    end

    it "should allow teachers to message unassigned students" 


    it "should allow a teacher to set up a group set with member limits", priority: "1", test_id: 94160 do
      group_test_setup(3,0,0)
      get "/courses/#{@course.id}/groups"

      click_add_group_set
      f('#new_category_name').send_keys("Test Group Set")
      f('.self-signup-toggle').click
      manually_set_groupset_limit("2")
      expect(f('.group-category-summary')).to include_text("Groups are limited to 2 members.")

      # Creates a group and checks to see if group set's limit is inherited by its groups
      manually_create_group
      expect(f('.group-summary')).to include_text("0 / 2 students")
    end

    it "should update student count when they're added to groups limited by group set", priority: "1", test_id: 94162 do
      seed_students(3)
      @category = create_category(has_max_membership:true, member_limit:3)
      @group = @course.groups.create!(name:"test group", group_category:@category)

      get "/courses/#{@course.id}/groups"

      expect(f('.group-summary')).to include_text("0 / 3 students")
      f('.al-trigger.btn').click
      f('.icon-edit.edit-category').click

      manually_set_groupset_limit("2")
      expect(f('.group-summary')).to include_text("0 / 2 students")
      manually_fill_limited_group("2",2)
    end

    it "should allow a teacher to set up a group with member limits", priority: "1", test_id: 94161 do
      group_test_setup(3,1,0)
      get "/courses/#{@course.id}/groups"

      manually_create_group(has_max_membership:true, member_limit:2)
      expect(f('.group-summary')).to include_text("0 / 2 students")
    end

    it "should Allow teacher to join students to groups in unpublished courses", priority: "1", test_id: 245957 do
      group_test_setup(3,1,2)
      @course.workflow_state = 'unpublished'
      @course.save!
      get "/courses/#{@course.id}/groups"
      @group_category.first.update_attribute(:group_limit,2)
      2.times do |n|
        add_user_to_group(@students[n],@testgroup[0],false)
      end
      add_user_to_group(@students.last,@testgroup[1],false)
      get "/courses/#{@course.id}/groups"
      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] span.show-group-full")).to be_displayed
      ff(".group-name")[0].click
      ff(".group-user-actions")[0].click
      fln("Set as Leader").click
      wait_for_ajaximations
      f(".group-user-actions[data-user-id=\"user_#{@students[0].id}\"]").click
      wait_for_ajaximations
      f(".ui-menu-item .edit-group-assignment").click
      wait_for_ajaximations
      ff(".move-select .move-select__group option").last.click
      f('.move-select button[type="submit"]').click
      wait_for_ajaximations
      f(".group[data-id=\"#{@testgroup[1].id}\"] .toggle-group").click
      expect(f("#content")).not_to contain_css(".group-leader .icon-user")
      expect(f(".group[data-id=\"#{@testgroup[1].id}\"] .group-user")).to include_text("Test Student 1")
    end

    it "should update student count when they're added to groups limited by group", priority: "1", test_id: 94167 do
      group_test_setup(3,1,0)
      create_group(group_category:@group_category.first,has_max_membership:true,member_limit:2)
      get "/courses/#{@course.id}/groups"

      expect(f('.group-summary')).to include_text("0 / 2 students")
      manually_fill_limited_group("2",2)
    end

    it "should show the FULL icon moving from one group to the next", priority: "1", test_id: 94163 do
      group_test_setup(4,1,2)
      @group_category.first.update_attribute(:group_limit,2)

      2.times do |n|
        add_user_to_group(@students[n],@testgroup.first,false)
      end

      add_user_to_group(@students.last,@testgroup[1],false)
      get "/courses/#{@course.id}/groups"

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] span.show-group-full")).to be_displayed
      expect(f(".group[data-id=\"#{@testgroup[1].id}\"] span.show-group-full")).not_to be_displayed

      f(".group[data-id=\"#{@testgroup[0].id}\"] .toggle-group").click
      wait_for_ajaximations

      f(".group-user-actions[data-user-id=\"user_#{@students[0].id}\"]").click
      wait_for_ajaximations

      f('.ui-menu-item .edit-group-assignment').click
      wait_for_ajaximations

      ff('.move-select .move-select__group option').last.click
      wait_for_ajaximations

      f('.move-select button[type="submit"]').click
      wait_for_ajaximations

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] span.show-group-full")).not_to be_displayed
      expect(f(".group[data-id=\"#{@testgroup[1].id}\"] span.show-group-full")).to be_displayed
    end

    it "should remove a student from a group and update the group status", priority: "1", test_id: 94165 do
      group_test_setup(4, 1, 2)
      @group_category.first.update_attribute(:group_limit,2)

      2.times do |n|
        add_user_to_group(@students[n],@testgroup.first,false)
      end

      add_user_to_group(@students.last,@testgroup[1],false)
      get "/courses/#{@course.id}/groups"

      expect(f('.unassigned-users-heading')).to include_text("Unassigned Students (1)")
      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-summary")).to include_text("2 / 2 students")
      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] span.show-group-full")).to be_displayed

      f(".group[data-id=\"#{@testgroup[0].id}\"] .toggle-group").click
      wait_for_ajaximations

      f(".group-user-actions[data-user-id=\"user_#{@students[0].id}\"]").click
      wait_for_ajaximations

      f('.ui-menu-item .remove-from-group').click
      wait_for_ajaximations

      expect(f('.ui-cnvs-scrollable')).to include_text(@students[0].name)
      expect(f('.unassigned-users-heading')).to include_text("Unassigned Students (2)")
      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-summary")).to include_text("1 / 2 students")
      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] span.show-group-full").css_value 'display').to eq 'none'
    end

    it 'should move group leader', priority: "1", test_id: 96023 do
      group_test_setup(4,1,2)
      add_user_to_group(@students[0],@testgroup.first,true)
      2.times do |n|
        add_user_to_group(@students[n+1], @testgroup.first,false)
      end
      get "/courses/#{@course.id}/groups"

      f(".group[data-id=\"#{@testgroup[0].id}\"] .toggle-group").click

      expect(f(".group-leader .icon-user")).to be_displayed

      f(".group-user-actions[data-user-id=\"user_#{@students[0].id}\"]").click

      f(".ui-menu-item .edit-group-assignment").click

      ff(".move-select .move-select__group option").last.click

      f('.move-select button[type="submit"]').click
      wait_for_ajaximations

      f(".group[data-id=\"#{@testgroup[1].id}\"] .toggle-group").click

      expect(f("#content")).not_to contain_css(".group-leader .icon-user")
      expect(f(".group[data-id=\"#{@testgroup[1].id}\"] .group-user")).to include_text("Test Student 1")
    end

    it 'moves non-leader', priority: "1", test_id: 96024 do
      skip_if_chrome('research')
      group_test_setup(4,1,2)
      add_user_to_group(@students[0], @testgroup.first, true)
      2.times do |n|
        add_user_to_group(@students[n+1], @testgroup.first, false)
      end
      add_user_to_group(@students[3], @testgroup.last, false)

      get "/courses/#{@course.id}/groups"

      f(".group[data-id=\"#{@testgroup[0].id}\"] .toggle-group").click

      expect(f(".group-leader .icon-user")).to be_displayed

      f(".group-user-actions[data-user-id=\"user_#{@students[1].id}\"]").click

      f(".ui-menu-item .edit-group-assignment").click
      wait_for_ajaximations

      click_option(".move-select .move-select__group select", @testgroup[1].id.to_s, :value)
      wait_for_ajaximations
      f('.move-select button[type="submit"]').click
      wait_for_ajaximations

      f(".group[data-id=\"#{@testgroup[1].id}\"] .toggle-group").click

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-user")).to include_text("Test Student 1")
      expect(f(".group[data-id=\"#{@testgroup[1].id}\"] .group-user")).to include_text("Test Student 2")
      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-leader")).to be_displayed
      expect(f("#content")).not_to contain_css(".group[data-id=\"#{@testgroup[1].id}\"] .group-leader")
    end

    it 'should remove group leader', priority: "1", test_id: 96025 do
      group_test_setup(4,1,2)
      add_user_to_group(@students[0], @testgroup.first, true)
      2.times do |n|
        add_user_to_group(@students[n+1], @testgroup.first, false)
      end
      add_user_to_group(@students[3], @testgroup.last, false)

      get "/courses/#{@course.id}/groups"

      f(".group[data-id=\"#{@testgroup[0].id}\"] .toggle-group").click
      wait_for_ajaximations

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-user")).to include_text('Test Student 1')
      expect(f('.group-leader .icon-user')).to be_displayed

      f(".group-user-actions[data-user-id=\"user_#{@students[0].id}\"]").click
      f('.ui-menu-item .icon-trash').click
      wait_for_ajaximations

      get "/courses/#{@course.id}/groups"

      f(".group[data-id=\"#{@testgroup[0].id}\"] .toggle-group").click
      wait_for_ajaximations
      f(".group[data-id=\"#{@testgroup[1].id}\"] .toggle-group").click
      wait_for_ajaximations

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-user")).not_to include_text('Test Student 1')
      expect(f("#content")).not_to contain_css('.row-fluid .group-leader')
    end

    it "should split students into groups automatically", priority: "1", test_id: 163990 do
      seed_students(4)

      get "/courses/#{@course.id}/groups"

      click_add_group_set
      f('#new_category_name').send_keys('Test Group Set')
      f('#split_groups').click
      expect(f('.auto-group-leader-controls')).to be_displayed

      replace_content(fj('.input-micro[name="create_group_count"]'),2)
      save_group_set
      # Need to run delayed jobs for the random group assignments to work, and then refresh the page
      run_jobs
      get "/courses/#{@course.id}/groups"
      2.times do |n|
        expect(ffj('.toggle-group.group-summary:visible')[n]).to include_text('2 students')
      end
      expect(ffj('.group-name:visible').size).to eq 2
    end

    it 'should respect individual group member limits when randomly assigning', priority: "1", test_id: 134767 do
      group_test_setup(16,1,2)
      @testgroup.first.update_attribute(:max_membership,7)
      get "/courses/#{@course.id}/groups"

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-summary")).to include_text('0 / 7 students')
      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] span.show-group-full").css_value 'display').to eq 'none'

      f('a.al-trigger.btn').click
      wait_for_ajaximations
      f('.icon-user.randomly-assign-members.ui-corner-all').click
      wait_for_ajaximations
      f('button.btn.btn-primary.randomly-assign-members-confirm').click
      wait_for_ajaximations

      # Run delayed jobs for randomly assigning students to the groups
      run_jobs

      get "/courses/#{@course.id}/groups"

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-summary")).to include_text('7 / 7 students')
      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] span.show-group-full")).to be_displayed
      expect(f(".group[data-id=\"#{@testgroup[1].id}\"] span.show-group-full").css_value 'display').to eq 'none'
    end

    it 'should create a group with a given name and limit', priority: "2", test_id: 94166 do
      skip("broken qa-729")
      group_test_setup(5,1,1)
      3.times do |n|
        add_user_to_group(@students[n+1], @testgroup.first, false)
      end

      get "/courses/#{@course.id}/groups"

      f('.people.active').click
      wait_for_ajaximations
      fj('.btn.button-sidebar-wide:contains("View User Groups")').click
      wait_for_ajaximations
      fj('.ui-tabs-anchor:contains("Everyone")').click
      wait_for_ajaximations
      fj('.ui-tabs-anchor:contains("Test Group Set 1")').click
      wait_for_ajaximations

      2.times do |n|
        f('.btn.add-group').click
        wait_for_ajaximations
        f('#group_name').send_keys("Test Group #{n+2}")
        wait_for_ajaximations
        f('#group_max_membership').send_keys('2')
        wait_for_ajaximations
        f('#groupEditSaveButton').click
        wait_for_ajaximations
        @testgroup << Group.last
      end

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-name")).to include_text('Test Group 1')
      expect(f(".group[data-id=\"#{@testgroup[1].id}\"] .group-name")).to include_text('Test Group 2')
      expect(f(".group[data-id=\"#{@testgroup[2].id}\"] .group-name")).to include_text('Test Group 3')
    end

    it 'should add students via drag and drop', priority: "1", test_id: 94154 do
      group_test_setup(2,1,2)
      get "/courses/#{@course.id}/groups"

      drag_item1 = '.group-user-name:contains("Test Student 1")'
      drag_item2 = '.group-user-name:contains("Test Student 2")'
      drop_target1 = '.group:contains("Test Group 1")'

      drag_and_drop_element(fj(drag_item1), fj(drop_target1))
      f(".group[data-id=\"#{@testgroup[0].id}\"] .toggle-group").click
      wait_for_ajaximations

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-summary")).to include_text('1 student')

      drag_and_drop_element(fj(drag_item2), fj(drop_target1))
      wait_for_ajaximations

      group_to_check = ff('.group .group-user .group-user-name')
      expect(group_to_check[0]).to include_text('Test Student 1')
      expect(group_to_check[1]).to include_text('Test Student 2')
      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-summary")).to include_text('2 students')
    end

    it 'should move student using drag and drop', priority: "1", test_id: 94156 do
      group_test_setup(2,1,2)
      add_user_to_group(@students[0], @testgroup.first, false)
      add_user_to_group(@students[1], @testgroup.last, false)

      drag_item1 = '.group-user-name:contains("Test Student 2")'
      drop_target1 = '.group:contains("Test Group 1")'

      get "/courses/#{@course.id}/groups"
      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-summary")).to include_text('1 student')
      expect(f(".group[data-id=\"#{@testgroup[1].id}\"] .group-summary")).to include_text('1 student')

      f(".group[data-id=\"#{@testgroup[0].id}\"] .toggle-group").click
      # click opens the group to display details, wait for it to complete
      expect(fj('.group-user-name:contains("Test Student 1")')).to be_displayed

      f(".group[data-id=\"#{@testgroup[1].id}\"] .toggle-group").click
      # click opens the group to display details, wait for it to complete
      expect(fj('.group-user-name:contains("Test Student 2")')).to be_displayed

      drag_and_drop_element(fj(drag_item1), fj(drop_target1))
      wait_for_ajaximations

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-summary")).to include_text('2 students')
      expect(f(".group[data-id=\"#{@testgroup[1].id}\"] .group-summary")).to include_text('0 students')
    end

    it 'should remove student using drag and drop', priority: "1", test_id: 94159 do
      group_test_setup(1,1,1)
      add_user_to_group(@students[0], @testgroup.first, false)

      drag_item1 = '.group-user-name:contains("Test Student 1")'
      drop_target1 = '.ui-cnvs-scrollable'

      get "/courses/#{@course.id}/groups"

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-summary")).to include_text('1 student')
      expect(fj('.unassigned-users-heading.group-heading')).to include_text('Unassigned Students (0)')

      f(".group[data-id=\"#{@testgroup[0].id}\"] .toggle-group").click
      wait_for_ajaximations

      drag_and_drop_element(fj(drag_item1), fj(drop_target1))
      wait_for_ajaximations

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-summary")).to include_text('0 students')
      expect(fj(drop_target1)).to include_text('Test Student 1')
      expect(fj('.unassigned-users-heading.group-heading')).to include_text('Unassigned Students (1)')
    end

    it 'should change group limit status with student drag and drop', priority: "1", test_id: 94164 do
      group_test_setup(5,1,1)
      @group_category.first.update_attribute(:group_limit,5)
      5.times do |n|
        add_user_to_group(@students[n], @testgroup.first, false)
      end

      drag_item1 = '.group-user-name:contains("Test Student 3")'
      drop_target1 = '.ui-cnvs-scrollable'

      get "/courses/#{@course.id}/groups"

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-summary")).to include_text('5 / 5 students')
      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] span.show-group-full")).to be_displayed
      expect(fj('.unassigned-users-heading.group-heading')).to include_text('Unassigned Students (0)')

      f(".group[data-id=\"#{@testgroup[0].id}\"] .toggle-group").click
      wait_for_ajaximations

      drag_and_drop_element(fj(drag_item1), fj(drop_target1))
      wait_for_ajaximations

      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] span.show-group-full").css_value 'display').to eq 'none'
      expect(f(".group[data-id=\"#{@testgroup[0].id}\"] .group-summary")).to include_text('4 / 5 students')
      expect(fj('.unassigned-users-heading.group-heading')).to include_text('Unassigned Students (1)')
      expect(fj(drop_target1)).to include_text('Test Student 3')
    end

    it 'should move leader via drag and drop', priority: "1", test_id: 96022 do
      group_test_setup(5,1,2)
      2.times do |n|
        add_user_to_group(@students[n], @testgroup.first, false)
        add_user_to_group(@students[n+2], @testgroup.last, false)
      end
      add_user_to_group(@students[4], @testgroup.last, true)

      get "/courses/#{@course.id}/groups"

      drag_item1 = '.group-user-name:contains("Test Student 5")'
      drop_target1 = ".group[data-id=\"#{@testgroup[0].id}\"]"

      f(".group[data-id=\"#{@testgroup[0].id}\"] .toggle-group").click
      # click opens the group to display details, wait for it to complete
      expect(fj('.group-user-name:contains("Test Student 2")')).to be_displayed

      f(".group[data-id=\"#{@testgroup[1].id}\"] .toggle-group").click
      # click opens the second group, wait for it to complete
      expect(f('.group-leader .icon-user')).to be_displayed

      drag_and_drop_element(fj(drag_item1), fj(drop_target1))
      wait_for_ajaximations

      expect(f("#content")).not_to contain_css('.group-leader .icon-user')
      expect(fj(drop_target1)).to include_text('Test Student 5')
    end

    context "using clone group set modal" do
      it "should clone a group set including its groups and memberships" 


      it "should alert group set name is required and is already in use" 


      it "should change group membership after an assignment has been deleted" 


      context "choosing New Group Set option" do
        it "should clone group set when adding an unassigned student to a group with submission" 


        it "should clone group set when moving a student from a group to a group with submission" 


        it "should clone group set when moving a student from a group with submission to a group" 


        it "should clone group set when removing a student from a group with submission" 


        it "should clone group set when deleting a group with submission" 


        it "should clone group set when using randomly assign students option when group has submission" 


        context "dragging and dropping a student" do
          it "should clone group set when moving an unassigned student to a group with submission" 


          it "should clone group set when moving a student from a group to a group with submission" 


          it "should clone group set when moving a student from a group with submission to a group" 


          it "should clone group set when moving a student from a group to unassigned students" 

        end
      end

      context "choosing Change Groups option" do
        it "changes group membership when an assignment has been submitted by a group" 


        it "changes group membership when using randomly assign students option when group has submission" 


        context "dragging and dropping a student" do
          it "changes group membership when an assignment has been submitted by a group" 

        end
      end
    end
  end
end

