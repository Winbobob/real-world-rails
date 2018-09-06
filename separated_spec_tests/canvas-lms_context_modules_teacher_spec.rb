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

require File.expand_path(File.dirname(__FILE__) + '/helpers/context_modules_common')
require File.expand_path(File.dirname(__FILE__) + '/helpers/public_courses_context')

describe "context modules" do
  include_context "in-process server selenium tests"
  include ContextModulesCommon

  context "as a teacher", priority: "1" do
    before(:once) do
      course_with_teacher(active_all: true)
      # have to add quiz and assignment to be able to add them to a new module
      @quiz = @course.assignments.create!(:title => 'quiz assignment', :submission_types => 'online_quiz')
      @assignment = @course.assignments.create!(:title => 'assignment 1', :submission_types => 'online_text_entry')
      @assignment2 = @course.assignments.create!(:title => 'assignment 2',
        :submission_types => 'online_text_entry',
        :due_at => 2.days.from_now,
        :points_possible => 10)
      @assignment3 = @course.assignments.create!(:title => 'assignment 3', :submission_types => 'online_text_entry')

      @ag1 = @course.assignment_groups.create!(:name => "Assignment Group 1")
      @ag2 = @course.assignment_groups.create!(:name => "Assignment Group 2")

      @course.reload
    end

    before(:each) do
      user_session(@teacher)
    end

    def module_with_two_items
      modules = create_modules(1, true)
      modules[0].add_item({id: @assignment.id, type: 'assignment'})
      modules[0].add_item({id: @assignment2.id, type: 'assignment'})
      get "/courses/#{@course.id}/modules"
      f(".collapse_module_link[aria-controls='context_module_content_#{modules[0].id}']").click
      wait_for_ajaximations
    end

    it "should show all module items", priority: "1", test_id: 126743 do
      module_with_two_items
      f(".expand_module_link").click
      wait_for_animations
      expect(f('.context_module .content')).to be_displayed
    end

    it "expands/collapses module with 0 items", priority: "2", test_id: 126731 do
      modules = create_modules(1, true)
      get "/courses/#{@course.id}/modules"
      f(".collapse_module_link[aria-controls='context_module_content_#{modules[0].id}']").click
      expect(f('.icon-mini-arrow-down')).to be_displayed
    end

    it "should hide module items", priority: "1", test_id: 280415 do
      module_with_two_items
      wait_for_animations
      expect(f('.context_module .content')).not_to be_displayed
    end

    it "should create a new module using enter key", priority: "2", test_id: 126705 do
      get "/courses/#{@course.id}/modules"
      add_form = new_module_form
      replace_content(add_form.find_element(:id, 'context_module_name'), "module 1")
      3.times do
        driver.action.send_keys(:tab).perform
        wait_for_ajaximations
      end
      driver.action.send_keys(:return).perform
      expect(f('.name')).to be_present
    end

    it "should rearrange child objects in same module", priority: "1", test_id: 126733 do
      modules = create_modules(1, true)
      # attach 1 assignment to module 1 and 2 assignments to module 2 and add completion reqs
      item1 = modules[0].add_item({:id => @assignment.id, :type => 'assignment'})
      item2 = modules[0].add_item({:id => @assignment2.id, :type => 'assignment'})
      get "/courses/#{@course.id}/modules"
      # setting gui drag icons to pass to driver.action.drag_and_drop
      selector1 = "#context_module_item_#{item1.id} .move_item_link"
      selector2 = "#context_module_item_#{item2.id} .move_item_link"
      list_prior_drag = ff("a.title").map(&:text)
      # performs the change position
      js_drag_and_drop(selector2, selector1)
      list_post_drag = ff("a.title").map(&:text)
      expect(list_prior_drag[0]).to eq list_post_drag[1]
      expect(list_prior_drag[1]).to eq list_post_drag[0]
    end

    it "should rearrange child object to new module", priority: "1", test_id: 126734 do
      modules = create_modules(2, true)
      # attach 1 assignment to module 1 and 2 assignments to module 2 and add completion reqs
      item1_mod1 = modules[0].add_item({:id => @assignment.id, :type => 'assignment'})
      item1_mod2 = modules[1].add_item({:id => @assignment2.id, :type => 'assignment'})
      get "/courses/#{@course.id}/modules"
      # setting gui drag icons to pass to driver.action.drag_and_drop
      selector1 = "#context_module_item_#{item1_mod1.id} .move_item_link"
      selector2 = "#context_module_item_#{item1_mod2.id} .move_item_link"
      # performs the change position
      js_drag_and_drop(selector2, selector1)
      list_post_drag = ff("a.title").map(&:text)
      # validates the module 1 assignments are in the expected places and that module 2 context_module_items isn't present
      expect(list_post_drag[0]).to eq "assignment 2"
      expect(list_post_drag[1]).to eq "assignment 1"
      expect(f("#content")).not_to contain_css('#context_modules .context_module:last-child .context_module_items .context_module_item')
    end

    it "should only display out-of on an assignment min score restriction when the assignment has a total" 


    it "should add and remove completion criteria" 


    it "should delete a module item", priority: "1", test_id: 126739 do
      get "/courses/#{@course.id}/modules"

      add_existing_module_item('#assignments_select', 'Assignment', @assignment.title)
      f('.context_module_item .al-trigger').click()
      f('.delete_item_link').click
      expect(driver.switch_to.alert).not_to be_nil
      driver.switch_to.alert.accept
      expect(f('.context_module_items')).not_to include_text(@assignment.title)
    end

    it "should edit a module item and validate the changes stick", priority: "1", test_id: 126737 do
      get "/courses/#{@course.id}/modules"

      item_edit_text = "Assignment Edit 1"
      module_item = add_existing_module_item('#assignments_select', 'Assignment', @assignment.title)
      tag = ContentTag.last
      edit_module_item(module_item) do |edit_form|
        replace_content(edit_form.find_element(:id, 'content_tag_title'), item_edit_text)
      end
      module_item = f("#context_module_item_#{tag.id}")
      expect(module_item).to include_text(item_edit_text)

      get "/courses/#{@course.id}/assignments/#{@assignment.id}"
      expect(f('h1.title').text).to eq item_edit_text

      expect_new_page_load { f('.modules').click }
      expect(f("#context_module_item_#{tag.id} .title").text).to eq item_edit_text
    end

    it "should focus close button on open edit modal" 


    it "should rename all instances of an item" 


    it "should not create a duplicate page if you publish after renaming" 


    it "publishes a newly created item" 


    it "should add the 'with-completion-requirements' class to rows that have requirements" 


    it "should add a title attribute to the text header" 


    it "should not rename every text header when you rename one" 


    it "should not rename every external tool link when you rename one" 


    it "should add a new quiz to a module in a specific assignment group" 


    it "should add a text header to a module", priority: "1", test_id: 126729  do
      get "/courses/#{@course.id}/modules"
      header_text = 'new header text'
      add_module('Text Header Module')
      f('.ig-header-admin .al-trigger').click
      f('.add_module_item_link').click
      select_module_item('#add_module_item_select', 'Text Header')
      replace_content(f('#sub_header_title'), header_text)
      f('.add_item_button.ui-button').click
      tag = ContentTag.last
      module_item = f("#context_module_item_#{tag.id}")
      expect(module_item).to include_text(header_text)
    end

    it "should always show module contents on empty module", priority: "1", test_id: 126732 do
      get "/courses/#{@course.id}/modules"
      add_module 'Test module'
      ff(".icon-mini-arrow-down")[0].click
      expect(f('.context_module .content')).to be_displayed
      expect(ff(".icon-mini-arrow-down")[0]).to be_displayed
    end

    it "should allow adding an item twice" 


    it "should not save an invalid external tool", priority: "1", test_id: 2624908 do
      get "/courses/#{@course.id}/modules"

      add_module 'Test module'
      f('.ig-header-admin .al-trigger').click
      f('.add_module_item_link').click
      select_module_item('#add_module_item_select', 'External Tool')
      f('.add_item_button.ui-button').click
      expect(ff('.alert.alert-error').length).to eq 1
      expect(fj('.alert.alert-error:visible').text).to eq "An external tool can't be saved without a URL."
    end

    it "shows the added pre requisites in the header of a module", priority: "1", test_id: 250297 do
      add_modules_and_set_prerequisites
      get "/courses/#{@course.id}/modules"
      expect(f('.item-group-condensed:nth-of-type(3) .ig-header .prerequisites_message').text).
        to eq "Prerequisites: #{@module1.name}, #{@module2.name}"
    end

    it "shows the added prerequisites when editing a module" 


    it "does not have a prerequisites section when creating the first module" 


    it "does not have a prerequisites section when editing the first module" 


    it "retains focus when deleting prerequisites" 


    it "should save the requirement count chosen in the Edit Module form" 


    it "should rearrange modules" 


    it "should validate locking a module item display functionality" 


    it "should prompt relock when adding an unlock_at date" 


    it "validates module lock date picker format", priority: "2", test_id: 132519 do
      unlock_date = format_time_for_view(Time.zone.today + 2.days)
      @course.context_modules.create!(name: "name", unlock_at: unlock_date)
      get "/courses/#{@course.id}/modules"
      f(".ig-header-admin .al-trigger").click
      f(".edit_module_link").click
      edit_form = f('#add_context_module_form')
      unlock_date_in_dialog = edit_form.find_element(:id, 'context_module_unlock_at')
      expect(format_time_for_view(unlock_date_in_dialog.attribute("value"))).to eq unlock_date
    end

    it "should properly change indent of an item with arrows" 


    it "should properly change indent of an item from edit dialog" 


    context "edit dialog" do
      before :once do
        @mod = create_modules(2, true)
        @mod[0].add_item({id: @assignment.id, type: 'assignment'})
        @mod[0].add_item({id: @assignment2.id, type: 'assignment'})
      end

      before :each do
        get "/courses/#{@course.id}/modules"
      end

      it "shows all items are completed radio button", priority: "1", test_id: 248023 do
        f("#context_module_#{@mod[0].id} .ig-header-admin .al-trigger").click
        hover_and_click("#context_module_#{@mod[0].id} .edit_module_link")
        f('.add-item .add_completion_criterion_link').click
        expect(f('.ic-Radio')).to contain_css("input[type=radio][id = context_module_requirement_count_]")
        expect(f('.ic-Radio .ic-Label').text).to eq('Students must complete all of these requirements')
      end

      it "shows complete one of these items radio button", priority: "1", test_id: 250294 do
        f("#context_module_#{@mod[0].id} .ig-header-admin .al-trigger").click
        hover_and_click("#context_module_#{@mod[0].id} .edit_module_link")
        f('.add-item .add_completion_criterion_link').click
        expect(ff('.ic-Radio')[1]).to contain_css("input[type=radio][id = context_module_requirement_count_1]")
        expect(ff('.ic-Radio .ic-Label')[1].text).to eq('Student must complete one of these requirements')
      end

      it "does not show the radio buttons for module with no items", priority: "1", test_id: 3028275 do
        f("#context_module_#{@mod[1].id} .ig-header-admin .al-trigger").click
        hover_and_click("#context_module_#{@mod[1].id} .edit_module_link")
        expect(f('.ic-Radio .ic-Label').text).not_to include('Students must complete all of these requirements')
        expect(f('.ic-Radio .ic-Label').text).not_to include('Student must complete one of these requirements')
        expect(f('.completion_entry .no_items_message').text).to eq('No items in module')
      end
    end

    context "module item cog focus management", priority: "1" do

      before :once do
        create_modules(1)[0].add_item({id: @assignment.id, type: 'assignment'})
        @tag = ContentTag.last
      end

      before :each do
        get "/courses/#{@course.id}/modules"
        f("#context_module_item_#{@tag.id} .al-trigger").click
      end

      it "should return focus to the cog menu when closing the edit dialog for an item" 


      it "should return focus to the module item cog when indenting" 


      it "should return focus to the module item cog when outdenting" 


      it "should return focus to the module item cog when cancelling a delete" 


      it "should return focus to the previous module item link when deleting a module item." 


      it "should return focus to the parent module's cog when deleting the first module item." 

    end


    it "should still display due date and points possible after indent change" 


    context "Keyboard Accessibility", priority: "1" do
      before :once do
        modules = create_modules(2, true)
        modules[0].add_item({:id => @assignment.id, :type => 'assignment'})
        modules[0].add_item({:id => @assignment2.id, :type => 'assignment'})
        modules[1].add_item({:id => @assignment3.id, :type => 'assignment'})
      end

      before :each do
        skip_if_chrome('skipped - research find html')
        get "/courses/#{@course.id}/modules"

        # focus the first item
        f('html').send_keys("j")
      end

      def send_keys(*keys)
        driver.switch_to.active_element.send_keys(*keys)
      end

      let(:context_modules) { ff('.context_module .collapse_module_link') }
      let(:context_module_items) { ff('.context_module_item a.title') }

      # Test these shortcuts (access menu by pressing comma key):
      # Up : Previous Module/Item
      # Down : Next Module/Item
      # Space : Move Module/Item
      # k : Previous Module/Item
      # j : Next Module/Item
      # e : Edit Module/Item
      # d : Delete Current Module/Item
      # i : Increase Indent
      # o : Decrease Indent
      # n : New Module
      it "should navigate through modules and module items" 


      it "should edit modules" 


      it "should create a module" 



      it "should indent / outdent" 


      it "should delete" 

    end

    context "multiple overridden due dates", priority: "2" do
      def create_section_override(section, due_at)
        override = assignment_override_model(:assignment => @assignment)
        override.set = section
        override.override_due_at(due_at)
        override.save!
      end

      it "should indicate when course sections have multiple due dates" 


      it "should not indicate multiple due dates if the sections' dates are the same" 


      it "should use assignment due date if there is no section override" 


      it "should only use the sections the user is restricted to" 

    end

    it "should preserve completion criteria after indent change" 


    it "should show a vdd tooltip summary for assignments with multiple due dates" 


    it "should publish a file from the modules page", priority: "1", test_id: 126727 do
      @module = @course.context_modules.create!(:name => "some module")
      @file = @course.attachments.create!(:display_name => "some file", :uploaded_data => default_uploaded_data, :locked => true)
      @tag = @module.add_item({:id => @file.id, :type => 'attachment'})
      expect(@file.reload).not_to be_published
      get "/courses/#{@course.id}/modules"
      f("[data-id='#{@file.id}'] > button.published-status").click
      ff(".permissions-dialog-form input[name='permissions']")[0].click
      f(".permissions-dialog-form [type='submit']").click
      wait_for_ajaximations
      expect(@file.reload).to be_published
    end

    it "should show the file publish button on course home" 


    it "should render publish buttons in collapsed modules" 

  end

  context "as a teacher through course home page (set to modules)", priority: "1" do
    before(:once) do
      course_with_teacher(name: 'teacher', active_all: true)
    end

    context "when adding new module" do
      before(:each) do
        user_session(@teacher)
        get "/courses/#{@course.id}"
      end

      it "should render as course home page", priority: "1", test_id: 126740 do
        create_modules(1)
        @course.default_view = 'modules'
        @course.save!
        get "/courses/#{@course.id}"
        expect(f('.add_module_link').text).not_to be_nil
      end

      it "should add a new module", priority: "1", test_id: 126704 do
        add_module('New Module')
        mod = @course.context_modules.first
        expect(mod.name).to eq 'New Module'
      end

      it "publishes an unpublished module", priority: "1", test_id: 280195 do
        add_module('New Module')
        expect(f('.context_module')).to have_class('unpublished_module')
        expect(@course.context_modules.count).to eq 1
        mod = @course.context_modules.first
        expect(mod.name).to eq 'New Module'
        publish_module
        mod.reload
        expect(mod).to be_published
        expect(f('#context_modules .publish-icon-published')).to be_displayed
      end
    end

    context "when working with existing module" do
      before :once do
        @course.context_modules.create! name: "New Module"
      end

      before :each do
        user_session(@teacher)
        get "/courses/#{@course.id}"
        wait_for_modules_ui
      end

      it "unpublishes a published module", priority: "1", test_id: 280196 do
        mod = @course.context_modules.first
        expect(mod).to be_published
        unpublish_module
        mod.reload
        expect(mod).to be_unpublished
      end

      it "should edit a module", priority: "1", test_id: 126738 do
        edit_text = 'Module Edited'
        f('.ig-header-admin .al-trigger').click
        f('.edit_module_link').click
        expect(f('#add_context_module_form')).to be_displayed
        edit_form = f('#add_context_module_form')
        edit_form.find_element(:id, 'context_module_name').send_keys(edit_text)
        submit_form(edit_form)
        expect(edit_form).not_to be_displayed
        expect(f('.context_module > .header')).to include_text(edit_text)
      end

      it "should delete a module", priority: "1", test_id: 126736 do
        skip_if_safari(:alert)
        f('.ig-header-admin .al-trigger').click
        f('.delete_module_link').click
        expect(driver.switch_to.alert).not_to be_nil
        driver.switch_to.alert.accept
        refresh_page
        expect(f('#no_context_modules_message')).to be_displayed
        expect(f('.context_module > .header')).not_to be_displayed
      end

      it "should add an assignment to a module", priority: "1", test_id: 126723 do
        add_new_module_item('#assignments_select', 'Assignment', '[ New Assignment ]', 'New Assignment Title')
        expect(fln('New Assignment Title')).to be_displayed
      end

      it "should add a assignment item to a module, publish new assignment refresh page and verify", priority: "2", test_id: 441358 do
        # this test basically verifies that the published icon is accurate after a page refresh
        mod = @course.context_modules.first
        assignment = @course.assignments.create!(title: "assignment 1")
        assignment.unpublish!
        tag = mod.add_item({id: assignment.id, type: 'assignment'})
        refresh_page
        item = f("#context_module_item_#{tag.id}")
        expect(f('span.publish-icon.unpublished.publish-icon-publish > i.icon-unpublish')).to be_displayed
        item.find_element(:css, '.publish-icon').click
        wait_for_ajax_requests
        expect(tag.reload).to be_published
        refresh_page
        driver.mouse.move_to f('i.icon-unpublish')
        expect(f('span.publish-icon.published.publish-icon-published')).to be_displayed
        expect(tag).to be_published
      end

      it "should add a quiz to a module", priority: "1", test_id: 126719 do
        mod = @course.context_modules.first
        quiz = @course.quizzes.create!(title: "New Quiz Title")
        mod.add_item({id: quiz.id, type: 'quiz'})
        refresh_page
        verify_persistence('New Quiz Title')
      end

      it "should add a content page item to a module", priority: "1", test_id: 126708 do
        mod = @course.context_modules.first
        page = @course.wiki_pages.create!(title: "New Page Title")
        mod.add_item({id: page.id, type: 'wiki_page'})
        refresh_page
        verify_persistence('New Page Title')
      end

      it "should add a content page item to a module and publish new page", priority: "2", test_id: 441357 do
        mod = @course.context_modules.first
        page = @course.wiki_pages.create!(title: "PAGE 2")
        page.unpublish!
        tag = mod.add_item({id: page.id, type: 'wiki_page'})
        refresh_page
        item = f("#context_module_item_#{tag.id}")
        expect(f('span.publish-icon.unpublished.publish-icon-publish > i.icon-unpublish')).to be_displayed
        item.find_element(:css, '.publish-icon').click
        wait_for_ajax_requests
        expect(tag.reload).to be_published
      end
    end
  end

  context "as a teacher" do
    before(:once) do
      course_factory(active_course: true)
      @teacher = teacher_in_course(course: @course, name: 'teacher', active_all: true).user
      @course.context_modules.create!(name: "New Module")
    end

    before(:each) do
      user_session(@teacher)
    end

    it "should add a discussion item to a module", priority: "1", test_id: 126711 do
      get "/courses/#{@course.id}/modules"
      add_new_module_item('#discussion_topics_select', 'Discussion', '[ New Topic ]', 'New Discussion Title')
      verify_persistence('New Discussion Title')
    end

    it "should add an external url item to a module", priority: "1", test_id: 126707 do
      get "/courses/#{@course.id}/modules"
      add_new_external_item('External URL', 'www.google.com', 'Google')
      expect(fln('Google')).to be_displayed
    end

    it "should require a url for external url items" 


    it "should add an external tool item to a module from apps", priority: "1", test_id: 126706 do
      get "/courses/#{@course.id}/settings"
      make_full_screen
      f("#tab-tools-link").click
      f(".add_tool_link.lm").click
      f("#configuration_type_selector").click
      f("option[value='url']").click
      ff(".formFields input")[0].send_keys("Khan Academy")
      ff(".formFields input")[1].send_keys("key")
      ff(".formFields input")[2].send_keys("secret")
      ff(".formFields input")[3].send_keys("https://www.eduappcenter.com/configurations/rt6spjamqrgkduhr.xml")
      f("#submitExternalAppBtn").click
      get "/courses/#{@course.id}/modules"
      add_new_external_item('External Tool', 'https://www.edu-apps.org/lti_public_resources/launch?driver=khan_academy&remote_id=y2-uaPiyoxc', 'Counting with small numbers')
      expect(fln('Counting with small numbers')).to be_displayed
      expect(f('span.publish-icon.unpublished.publish-icon-publish > i.icon-unpublish')).to be_displayed
    end

    it "should add an external tool item to a module", priority: "1", test_id: 2624909 do
      get "/courses/#{@course.id}/modules"
      add_new_external_item('External Tool', 'www.instructure.com', 'Instructure')
      expect(fln('Instructure')).to be_displayed
    end
  end
end

