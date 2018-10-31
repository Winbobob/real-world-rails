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

require File.expand_path(File.dirname(__FILE__) + "/common")
require File.expand_path(File.dirname(__FILE__) + '/helpers/context_modules_common')

describe "context modules" do
  include_context "in-process server selenium tests"
  include ContextModulesCommon

  before :once do
    @course = course_model.tap(&:offer!)
    @teacher = teacher_in_course(course: @course, name: 'teacher', active_all: true).user
    @student = student_in_course(course: @course, name: 'student', active_all: true).user
  end

  context "as a student, with multiple modules", priority: "1" do
    before :once do
      @locked_icon = 'icon-lock'
      @completed_icon = 'icon-check'
      @in_progress_icon = 'icon-minimize'
      @open_item_icon = 'icon-mark-as-read'
      @no_icon = 'no-icon'

      #initial module setup
      @module_1 = create_context_module('Module One')
      @assignment_1 = @course.assignments.create!(:title => "assignment 1")
      @tag_1 = @module_1.add_item({:id => @assignment_1.id, :type => 'assignment'})
      @module_1.completion_requirements = {@tag_1.id => {:type => 'must_view'}}

      @module_2 = create_context_module('Module Two')
      @assignment_2 = @course.assignments.create!(:title => "assignment 2")
      @tag_2 = @module_2.add_item({:id => @assignment_2.id, :type => 'assignment'})
      @module_2.completion_requirements = {@tag_2.id => {:type => 'must_view'}}
      @module_2.prerequisites = "module_#{@module_1.id}"

      @module_3 = create_context_module('Module Three')
      @quiz_1 = @course.quizzes.create!(:title => "some quiz")
      @quiz_1.publish!
      @tag_3 = @module_3.add_item({:id => @quiz_1.id, :type => 'quiz'})
      @module_3.completion_requirements = {@tag_3.id => {:type => 'must_view'}}
      @module_3.prerequisites = "module_#{@module_2.id}"

      @module_1.save!
      @module_2.save!
      @module_3.save!
    end

    before :each do
      user_session(@student)
    end

    it "should validate that course modules show up correctly" 


    it "should not lock modules for observers" 


    it "should show overridden due dates for assignments" 


    it "moves a student through context modules in sequential order", priority: "2", test_id: 126742 do
      go_to_modules
      validate_context_module_status_icon(@module_1.id, @no_icon)
      validate_context_module_status_icon(@module_2.id, @locked_icon)

      #sequential normal validation
      navigate_to_module_item(0, @assignment_1.title)
      validate_context_module_status_icon(@module_1.id, @completed_icon)
      validate_context_module_status_icon(@module_2.id, @no_icon)
    end

    it "should not cache a changed module requirement" 


    it "should show progression in large_roster courses" 


    it "should validate that a student can't get to a locked context module" 


    it "should validate that a student can't get to locked external items", priority: "1", test_id: 2624906 do
      external_tool = @course.context_external_tools.create!(:url => "http://example.com/ims/lti",
          :consumer_key => "asdf", :shared_secret => "hjkl", :name => "external tool")

      @module_2.reload
      tag_1 = @module_2.add_item(:id => external_tool.id, :type => "external_tool", :url => external_tool.url)
      tag_2 = @module_2.add_item(:type => 'external_url', :url => 'http://example.com/lolcats',
                                  :title => 'pls view', :indent => 1)

      tag_1.publish!
      tag_2.publish!

      get "/courses/#{@course.id}/modules/items/#{tag_1.id}"
      expect(f('#content')).to include_text("hasn't been unlocked yet")
      expect(f('#module_prerequisites_list')).to be_displayed

      get "/courses/#{@course.id}/modules/items/#{tag_2.id}"
      expect(f('#content')).to include_text("hasn't been unlocked yet")
      expect(f('#module_prerequisites_list')).to be_displayed
    end

    it "should validate that a student can't get to an unpublished context module item" 


    it "should validate that a student can't see an unpublished context module item", priority: "1", test_id: 126745 do
      @assignment_2.workflow_state = 'unpublished'
      @assignment_2.save!

      module1_unpublished_tag = @module_1.add_item({:id => @assignment_2.id, :type => 'assignment'})
      @module_1.completion_requirements = {@tag_1.id => {:type => 'must_view'}, module1_unpublished_tag.id => {:type => 'must_view'}}
      @module_1.save!
      expect(@module_1.completion_requirements.map{|h| h[:id]}).to include(@tag_1.id)
      expect(@module_1.completion_requirements.map{|h| h[:id]}).to include(module1_unpublished_tag.id) # unpublished requirements SHOULD remain

      module2_published_tag = @module_2.add_item({:id => @quiz_1.id, :type => 'quiz'})
      @module_2.save!

      go_to_modules

      context_modules = ff('.context_module')
      expect(context_modules[0].find_element(:css, '.context_module_items')).not_to include_text(@assignment_2.name)
      expect(context_modules[1].find_element(:css, '.context_module_items')).not_to include_text(@assignment_2.name)

      # Should go to the next module
      get "/courses/#{@course.id}/assignments/#{@assignment_1.id}"
      nxt = f('.module-sequence-footer-button--next a')
      expect(nxt).to have_attribute("href", "/courses/#{@course.id}/modules/items/#{module2_published_tag.id}")

      # Should redirect to the published item
      get "/courses/#{@course.id}/modules/#{@module_2.id}/items/first"
      expect(driver.current_url).to match %r{/courses/#{@course.id}/quizzes/#{@quiz_1.id}}
    end

    it "should validate that a students cannot see unassigned differentiated assignments" 


    it "should lock module until a given date", priority: "1", test_id: 126741 do
      mod_lock = @course.context_modules.create! name: 'a_locked_mod', unlock_at: 1.day.from_now
      go_to_modules
      expect(fj("#context_module_content_#{mod_lock.id} .unlock_details")).to include_text 'Will unlock'
    end

    it "does not show the description of a discussion locked by module", priority: "1", test_id: 1426125 do
      module1 = @course.context_modules.create! name: 'a_locked_mod', unlock_at: 1.day.from_now
      discussion = @course.discussion_topics.create!(title: 'discussion', message: 'discussion description')
      module1.add_item type: 'discussion_topic', id: discussion.id
      get "/courses/#{@course.id}/discussion_topics/#{discussion.id}?module_item_id=#{ContentTag.last.id}"
      expect(f('.entry-content')).not_to contain_css('.discussion-section .message')
    end

    it "should allow a student view student to progress through module content" 


    context "next and previous buttons", priority: "2" do
      before :each do
        user_session(@teacher)
      end

      before :once do
        module_setup
      end

      it "should show previous and next buttons for quizzes" 


      it "should show previous and next buttons for assignments" 


      it "should show previous and next buttons for wiki pages" 


      it "should show previous and next buttons for discussions" 


      it "should show previous and next buttons for external tools", priority: "2", test_id: 2624907 do
        get "/courses/#{@course.id}/modules/items/#{@external_tool_tag.id}"
        verify_next_and_previous_buttons_display
      end

      it "should show previous and next buttons for external urls" 

    end

    describe "sequence footer" do
      it "should show the right nav when an item is in modules multiple times" 


      it "should show the nav when going straight to the item if there's only one tag" 


      # TODO: reimplement per CNVS-29600, but make sure we're testing at the right level
      it "should show module navigation for group assignment discussions"
    end

    context 'mark as done' do
      it "On the modules page: the user sees an incomplete module with a 'mark as done' requirement. The user clicks on the module item, marks it as done, and back on the modules page can now see that the module is completed" 


      it "should still show the mark done button when navigating directly" 


      it "should doesn't show the mark done button on locked pages" 

    end

    it "shows Mark as Done button for assignments with external tool submission", priority: "2", test_id: 3340306 do
      allow(BasicLTI::Sourcedid).to receive(:encryption_secret) {'encryption-secret-5T14NjaTbcYjc4'}
      allow(BasicLTI::Sourcedid).to receive(:signing_secret) {'signing-secret-vp04BNqApwdwUYPUI'}
      tool = @course.context_external_tools.create!(name: "a",
                                                    url: "example.com",
                                                    consumer_key: '12345',
                                                    shared_secret: 'secret')
      @assignment = @course.assignments.create!
      @assignment.tool_settings_tool = tool
      @assignment.submission_types = "external_tool"
      @assignment.external_tool_tag_attributes = {url: tool.url}
      @assignment.save!

      @mark_done_module = create_context_module('Mark Done Module')
      @tag = @mark_done_module.add_item({id: @assignment.id, type: 'assignment'})
      @mark_done_module.completion_requirements = {@tag.id => {type: 'must_mark_done'}}
      @mark_done_module.save!

      get "/courses/#{@course.id}/assignments/#{@assignment.id}"
      expect(f('#content')).to contain_css('#mark-as-done-checkbox')
    end

    describe "module header icons" do
      it "should show a pill message that says 'Complete All Items'", priority: "1", test_id: 250296 do
        go_to_modules
        vaildate_correct_pill_message(@module_1.id, 'Complete All Items')
      end

      it "should show a pill message that says 'Complete One Item'", priority: "1", test_id: 250295 do
        make_module_1_complete_one
        go_to_modules

        vaildate_correct_pill_message(@module_1.id, 'Complete One Item')
      end

      it "shows a completed icon and unlocks next when module is complete for 'Complete All Items' requirement", priority: "1", test_id: 248902 do
        create_additional_assignment_for_module_1
        # navigate to module items to satisfy must_view_requirement
        get "/courses/#{@course.id}/assignments/#{@assignment_1.id}?module_item_id=#{@tag_1.id}"
        get "/courses/#{@course.id}/assignments/#{@assignment_4.id}?module_item_id=#{@tag_4.id}"
        go_to_modules
        validate_context_module_status_icon(@module_1.id, @completed_icon)
        validate_context_module_status_icon(@module_2.id, @no_icon)
      end

      it "should show a completed icon when module is complete for 'Complete One Item' requirement", priority: "1", test_id: 250542 do
        create_additional_assignment_for_module_1
        make_module_1_complete_one
        go_to_modules

        navigate_to_module_item(0, @assignment_1.title)
        vaildate_correct_pill_message(@module_1.id, 'Complete One Item')
        validate_context_module_status_icon(@module_1.id, @completed_icon)
      end

      it "unlocks the next module when module is complete with 'Complete 1 requirement'", priority: "1", test_id: 255037 do
        create_additional_assignment_for_module_1
        make_module_1_complete_one
        go_to_modules
        navigate_to_module_item(0, @assignment_1.title)
        validate_context_module_status_icon(@module_2.id, @no_icon)
      end

      it "should show a locked icon when module is locked", priority:"1", test_id: 250541 do
        go_to_modules
        validate_context_module_status_icon(@module_2.id, @locked_icon)
      end

      it "should show a tooltip for locked icon when module is locked", priority:"1", test_id: 255918 do
        go_to_modules
        driver.mouse.move_to(f("#context_module_#{@module_2.id} .completion_status .icon-lock"), 0, 0)
        expect(fj('.ui-tooltip:visible')).to include_text('Locked')
      end

      it "should show a warning in-progress icon when module has been started", priority: "1", test_id: 250543 do
        create_additional_assignment_for_module_1
        go_to_modules

        navigate_to_module_item(0, @assignment_1.title)
        validate_context_module_status_icon(@module_1.id, @in_progress_icon)
      end

      it "should not show an icon when module has not been started", priority: "1", test_id: 250540 do
        go_to_modules
        validate_context_module_status_icon(@module_1.id, @no_icon)
      end
    end

    describe "module item icons" do

      it "should show a completed icon when module item is completed", priority: "1", test_id: 250546 do
        go_to_modules
        navigate_to_module_item(0, @assignment_1.title)
        validate_context_module_item_icon(@tag_1.id, @completed_icon)
      end

      it "shows a tooltip when hovering over a completed icon", priority: "1", test_id: 255915 do
        go_to_modules
        navigate_to_module_item(0, @assignment_1.title)
        driver.mouse.move_to(f('.ig-header-admin .completion_status .icon-check'), 0, 0)
        expect(fj('.ui-tooltip:visible')).to include_text('Completed')
      end

      it "should show an incomplete circle icon when module item is requirement but not complete", priority: "1", test_id: 250544 do
        go_to_modules
        validate_context_module_item_icon(@tag_1.id, @open_item_icon)
      end

      it "should not show an icon when module item is not a requirement", priority: "1", test_id: 250545 do
        add_non_requirement
        go_to_modules
        validate_context_module_item_icon(@tag_4.id, @no_icon)
      end

      it "should show incomplete for differentiated assignments" 


      context "when adding min score assignment" do
        before :once do
          add_min_score_assignment
        end

        it "should show a warning icon when module item is a min score requirement that didn't meet score requirment", priority: "1", test_id: 250547 do
          grade_assignment(50)
          go_to_modules
          validate_context_module_item_icon(@tag_4.id, @in_progress_icon)
        end

        it "shows tool tip text when hovering over the warning icon for a min score requirement", priority: "1", test_id: 255916 do
          grade_assignment(50)
          go_to_modules
          driver.mouse.move_to(f('.ig-header-admin .completion_status .icon-minimize'), 0, 0)
          expect(fj('.ui-tooltip:visible')).to include_text('Started')
        end

        it "shows tooltip warning for a min score assignemnt", priority: "1", test_id: 255917 do
          grade_assignment(50)
          go_to_modules
          driver.mouse.move_to(f('.ig-row .module-item-status-icon .icon-minimize'), 0, 0)
          expect(fj('.ui-tooltip:visible')).to include_text('You scored a 50. Must score at least a 90.0.')
        end

        it "should show an info icon when module item is a min score requirement that has not yet been graded" 


        it "should show a completed icon when module item is a min score requirement that met the score requirement" 


        it "should show a warning icon when module item is past due and not submitted" 


        it "should show a completed icon when module item is past due but submitted" 

      end
    end
  end

  context "module visibility as a student" do
    before :once do
      @module = @course.context_modules.create!(name: "module")
    end

    before :each do
      user_session(@student)
    end

    it "should fetch locked module prerequisites" 


    it "should validate that a student can see published and not see unpublished context module", priority: "1", test_id: 126744 do
      @module_1 = @course.context_modules.create!(name: "module_1")
      @module_1.workflow_state = 'unpublished'
      @module_1.save!
      go_to_modules
      # for a11y there is a hidden header now that gets read as part of the text hence the regex matching
      expect(f("#context_modules").text).to match(/module\s*module/)
      expect(f("#context_modules")).not_to include_text "module_1"
    end

    it "should unlock module after a given date", priority: "1", test_id: 126746 do
      @module.unlock_at = 1.day.ago
      @module.save!
      go_to_modules
      expect(fj("#context_module_content_#{@module.id} .unlock_details")).not_to include_text 'Will unlock'
    end

    it "should mark locked but visible assignments/quizzes/discussions as read" 


    it "does not show past due when due date changed for already submitted quizzes", priority: "2", test_id: 1041397 do
      quiz = @course.quizzes.create!(title: "test quiz")
      quiz.publish!
      tag = @module.add_item({type: 'quiz', id: quiz.id})
      submission = quiz.generate_submission(@student)
      submission.workflow_state = 'complete'
      submission.save!
      quiz.due_at = Time.zone.now - 2.days
      quiz.save!
      go_to_modules
      # validate that there is no warning icon for past due
      validate_context_module_item_icon(tag.id, 'no-icon')
    end

    it "should not lock a page module item on first load" 

  end
end

