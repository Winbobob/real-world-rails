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
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContextModulesController do
  describe "GET 'index'" do
    before :once do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
    end

    it "should require authorization" 


    it "should redirect 'disabled', if disabled by the teacher" 


    it "should assign variables" 


    it "should touch modules if necessary" 


    context "unpublished modules" do
      before :once do
        @m1 = @course.context_modules.create(:name => "unpublished oi")
        @m1.workflow_state = 'unpublished'
        @m1.save!
        @m2 = @course.context_modules.create!(:name => "published hey")
      end

      it "should show all modules for teachers" 


      it "should not show unpublished for students" 

    end
  end

  describe "PUT 'update'" do
    before :once do
      course_with_teacher(:active_all => true)
      @m1 = @course.context_modules.create(:name => "unpublished")
      @m1.workflow_state = 'unpublished'
      @m1.save!
      @m2 = @course.context_modules.create!(:name => "published")
    end

    before :each do
      user_session(@teacher)
    end

    it "should publish modules" 


    it "should unpublish modules" 


    it "should update the name" 

  end

  describe "GET 'module_redirect'" do
    it "should skip leading and trailing sub-headers" 

  end

  describe "GET 'item_redirect'" do
    before :once do
      course_with_teacher(active_all: true)
      student_in_course(active_all: true)
    end

    it "should require authorization" 


    it "should still redirect for unpublished modules if teacher" 


    it "should still redirect for unpublished modules if teacher and course is concluded" 


    it "should not redirect for unpublished modules if student" 


    context 'ContextExternalTool' do
      it "should find a matching tool" 


      it "generate lti params" 


      it "should fail if there is no matching tool" 

    end

    it "should redirect to an assignment page" 


    it "should redirect to a discussion page" 


    it "should redirect to a wiki page" 


    it "should redirect to a quiz page" 


    it "should mark an external url item read" 


    it "should not mark a locked external url item read" 


    it "should not mark an unpublished external url item read" 


  end

  describe "POST 'reorder'" do
    it "should work" 


    it "should fire the module_updated live event for any module with changed positions" 

  end

  describe "POST 'reorder_items'" do
    def make_content_tag(assignment, course, mod)
      ct = ContentTag.new
      ct.content_id = assignment.id
      ct.content_type = 'Assignment'
      ct.context_id = course.id
      ct.context_type = 'Course'
      ct.title = "Assignment #{assignment.id}"
      ct.tag_type = "context_module"
      ct.context_module_id = mod.id
      ct.context_code = "course_#{course.id}"
      ct.save!
      ct
    end

    it "should reorder items" 


    it "should reorder unpublished items" 


    it "should only touch module once on reorder" 

  end

  describe "POST 'add_item'" do
    before :once do
      course_with_teacher(:active_all => true)
      @module = @course.context_modules.create!
    end

    it "should set position" 


    it "shouldn't duplicate an existing position" 

  end

  describe "PUT 'update_item'" do
    before :once do
      course_with_teacher(:active_all => true)
      @module = @course.context_modules.create!
      @assignment = @course.assignments.create! :title => 'An Assignment'
      @assignment_item = @module.add_item :type => 'assignment', :id => @assignment.id
      @external_url_item = @module.add_item :type => 'external_url', :title => 'Example URL', :url => 'http://example.org'
      @external_tool_item = @module.add_item :type => 'context_external_tool', :title => 'Example Tool', :url => 'http://example.com/tool'
    end

    before :each do
      user_session(@teacher)
    end

    it "should update the tag title" 


    it "should update the asset title" 


    it "should update indent" 


    it "should update the url for an external url item" 


    it "should update the url for an external tool item" 


    it "should ignore the url for a non-applicable type" 

  end

  describe "GET item_details" do
    before :once do
      course_with_teacher(:active_all => true)
      student_in_course(:active_all => true)
      @m1 = @course.context_modules.create!(:name => "first module")
      @m1.publish
      @m2 = @course.context_modules.create(:name => "middle foo")
      @m2.workflow_state = 'unpublished'
      @m2.save!
      @m3 = @course.context_modules.create!(:name => "last module")
      @m3.publish

      @topic = @course.discussion_topics.create!
      @topicTag = @m1.add_item :type => 'discussion_topic', :id => @topic.id
    end

    it "should show unpublished modules for teachers" 


    it "should skip unpublished modules for students" 


    it "should parse namespaced quiz as id" 

  end

  describe "GET progressions" do
    context "unauthenticated user in public course" do
      before(:once) do
        course_factory(:is_public => true, :active_all => true)
        @user = nil
        @mod1 = @course.context_modules.create!(:name => 'unlocked')
        @mod2 = @course.context_modules.create!(:name => 'locked', :unlock_at => 1.week.from_now)
      end

      it "returns 'locked' progressions for modules locked by date" 

    end

    before :once do
      course_with_teacher(:active_all => true)
      student_in_course(:active_all => true)
      @module = @course.context_modules.create!(:name => "first module")
      @module.publish
      @wiki = @course.wiki_pages.create!(:title => "wiki", :body => 'hi')

      @tag = @module.add_item(:id => @wiki.id, :type => 'wiki_page')
      @module.completion_requirements = {@tag.id => {:type => 'must_view'}}
    end

    before :each do
      @progression = @module.update_for(@student, :read, @tag)
    end

    it "should return all student progressions to teacher" 


    it "should return a single student progression" 


    context "with large_roster" do
      before :once do
        @course.large_roster = true
        @course.save!
      end

      it "should return a single student progression" 


      it "should not return any student progressions to teacher" 

    end
  end

  describe "GET assignment_info" do
    it "should return updated due dates/points possible" 


    it "should return too_many_overrides if applicable for assignments" 


    it "should return too_many_overrides if applicable for graded topics" 


    it "should not cache 'past_due'" 


    it "should return multiple due date info for survey quizzes" 


    it "should return too_many_overrides if applicable for survey quizzes" 


    it "should return past_due if survey quiz is past due" 


    it "should not return past_due if survey quiz is completed" 


    it "should return a todo date for an ungraded page with a todo_date" 


    it "should return external urls properly" 

  end

  describe "GET show" do
    before :once do
      course_with_teacher(active_all: true)
    end

    it "should redirect to the module on the index page" 


    it "should unauthorized for students and unpublished modules" 

  end

  describe "GET 'choose_mastery_path'" do
    before :each do
      allow(ConditionalRelease::Service).to receive(:enabled_in_context?).and_return(true)
    end

    before :once do
      course_with_student(:active_all => true)
      @mod = @course.context_modules.create!
      ag = @course.assignment_groups.create!
      @assg = ag.assignments.create!(:context => @course)
      @item = @mod.add_item :type => 'assignment', :id => @assg.id
    end

    before :each do
      user_session @student
    end

    it "should return 404 if no rule matches item assignment" 


    it "should return 404 if matching rule is unlocked but has one selected assignment set" 


    it "should redirect to context modules page with warning if matching rule is locked" 


    it "should show choose page if matches a rule that is unlocked and has more than two assignment sets" 


    it "should show choose page if matching rule is unlocked and has one unselected assignment set" 



    it "should show choose page if matches a rule that is unlocked and has more than two assignment sets even if multiple rules are present" 

  end

  describe "GET item_redirect_mastery_paths" do
    before :each do
      course_with_teacher_logged_in active_all: true
      @mod = @course.context_modules.create!
    end

    it "should redirect to assignment edit mastery paths page" 


    it "should redirect to quiz edit mastery paths page" 


    it "should redirect to discussion edit mastery paths page" 


    it "should 404 if module item is not a graded type" 

  end
end

