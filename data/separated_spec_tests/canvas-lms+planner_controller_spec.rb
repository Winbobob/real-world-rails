#
# Copyright (C) 2018 - present Instructure, Inc.
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

require_relative '../sharding_spec_helper'

describe PlannerController do
  before :once do
    course_with_teacher(active_all: true)
    student_in_course(active_all: true)
    @group = @course.assignment_groups.create(:name => "some group")
    @assignment = course_assignment
    @assignment2 = course_assignment
  end

  def course_assignment
    assignment = @course.assignments.create(
      :title => "some assignment #{@course.assignments.count}",
      :assignment_group => @group,
      :due_at => Time.zone.now + 1.week
    )
    assignment
  end

  context "unauthenticated" do
    it "should return unauthorized" 

  end

  context "as student" do
    before :each do
      user_session(@student)
      @course.root_account.enable_feature!(:student_planner)
    end

    describe "GET #index" do
      it "returns http success" 


      it "checks the planner cache" 


      it "should show wiki pages with todo dates" 


      it "should show planner notes for the user" 


      it "should show calendar events for the course and user" 


      it "shows the appropriate section-specific event for the user" 


      it "should show appointment group reservations" 


      it "should only show section specific announcements to students who can view them" 



      it "should show planner overrides created on quizzes" 


      it "should show planner overrides created on discussions" 


      it "should show planner overrides created on wiki pages" 


      it "should show peer review tasks for the user" 


      it "should show peer reviews for assignments with no 'everyone' date and no peer review date" 


      it "should mark peer reviews as done when they are completed, if they have been marked as incomplete by an override" 


      context "include_concluded" do
        before :once do
          @u = User.create!

          @c1 = course_with_student(:active_all => true, :user => @u).course
          @a1 = course_assignment
          @pn1 = planner_note_model(:todo_date => 1.day.from_now, :course => @c1)

          @e2 = course_with_student(:active_all => true, :user => @u)
          @c2 = @e2.course
          @a2 = course_assignment
          @pn2 = planner_note_model(:todo_date => 1.day.from_now, :course => @c2)
          @e2.conclude
        end

        before :each do
          user_session(@u)
        end

        it "should not include objects from concluded courses by default" 


        it "should include objects from concluded courses if specified" 

      end

      context "with context codes" do
        before :once do
          @course1 = course_with_student(active_all: true).course
          @course2 = course_with_student(active_all: true, user: @student).course
          group_category(context: @course1)
          @group = @group_category.groups.create!(context: @course1)
          @group.add_user(@student, 'accepted')
          @assignment1 = assignment_model(course: @course1, due_at: 1.day.from_now)
          @assignment2 = assignment_model(course: @course2, due_at: 1.day.from_now)
          @group_assignment = @course1.assignments.create!(group_category: @group_category, due_at: 1.day.from_now)
          @course_topic = discussion_topic_model(context: @course1, todo_date: 1.day.from_now)
          @group_topic = discussion_topic_model(context: @group, todo_date: 1.day.from_now)
          @course_page = wiki_page_model(course: @course1, todo_date: 1.day.from_now)
          @group_page = wiki_page_model(todo_date: 1.day.from_now, course: @group)
          @assignment3 = assignment_model(course: @course1, due_at: Time.zone.now, only_visible_to_overrides: true)
          create_adhoc_override_for_assignment(@assignment3, @student, {due_at: 2.days.ago})
          @quiz = @course1.quizzes.create!(quiz_type: 'practice_quiz', due_at: 1.day.from_now).publish!
          create_adhoc_override_for_assignment(@quiz, @student, {due_at: 2.days.ago})
          @user_note = planner_note_model(user: @student, todo_date: 1.day.ago)
          @course1_note = planner_note_model(user: @student, todo_date: 1.day.from_now, course: @course1)
          @course2_note = planner_note_model(user: @student, todo_date: 1.day.from_now, course: @course2)
          @course1_event = @course1.calendar_events.create!(title: "Course 1 event", start_at: 1.minute.from_now, end_at: 1.hour.from_now)
          @course2_event = @course2.calendar_events.create!(title: "Course 2 event", start_at: 1.minute.from_now, end_at: 1.hour.from_now)
          @group_event = @group.calendar_events.create!(title: "Group event", start_at: 1.minute.from_now, end_at: 1.hour.from_now)
          @user_event = @user.calendar_events.create!(title: "User event", start_at: 1.minute.from_now, end_at: 1.hour.from_now)
          @deleted_page = wiki_page_model(course: @course1, todo_date: 1.day.from_now); @deleted_page.destroy
          @deleted_topic = discussion_topic_model(context: @group, todo_date: 1.day.from_now); @deleted_topic.destroy
        end

        before :each do
          user_session(@student)
        end

        it "should include all data by default" 


        it "should only return data from contexted courses if specified" 


        it "should only return data from contexted users if specified" 


        it "should return items from all context_codes specified" 


        it "should not return any data if context_codes are specified but none are valid for the user" 


        it "filters ungraded_todo_items" 


        it "filters all_ungraded_todo_items for teachers, including unpublished items" 


        it "filters out unpublished todo items for students" 

      end

      context "date sorting" do
        it "should return results in order by date" 


        it "should behave consistently with different object types on the same datetime" 


        it "should use the right bookmarker in different time zones" 


        it "should return results in reverse order by date if requested" 


        it "should not try to compare missing dates" 


        it "should order with unread items as well" 


        context "with assignment overrides" do
          before :once do
            course_with_teacher(active_all: true)
            student_in_course(active_all: true)
            @planner_note1 = planner_note_model(user: @student, todo_date: 1.day.ago)
            @planner_note2 = planner_note_model(user: @student, todo_date: 1.day.from_now)
          end

          before :each do
            user_session(@student)
          end

          it "should order assignments with no overrides correctly" 


          it "should order assignments with overridden due dates correctly" 


          it "should order ungraded quizzes with overridden due dates correctly" 


          it "should order graded discussions with overridden due dates correctly" 


          it "should order mastery path wiki_pages by todo date if applied" 

        end
      end

      context "cross-sharding" do
        specs_require_sharding

        before :once do
          @original_course = @course
          @shard1.activate do
            @another_account = Account.create!
            @another_course = @another_account.courses.create!(:workflow_state => 'available')
         end
        end

        it "should ignore shards other than the current account's" 


        it "returns all_ungraded_todo_items across shards" 

      end

      context "pagination" do
        PER_PAGE = 5

        def test_page(bookmark = nil)
          opts = { per_page: PER_PAGE }
          opts.merge(page: bookmark) if bookmark.present?

          page =  get :index, params: opts
          links = Api.parse_pagination_links(page.headers['Link'])
          response_json = json_parse(page.body)
          expect(response_json.length).to eq PER_PAGE
          ids = response_json.map { |i| i["plannable_id"] }
          expected_ids = []
          PER_PAGE.times {|i| expected_ids << @assignments[i].id}
          expect(ids).to eq expected_ids

          links.detect { |l| l[:rel] == "next" }["page"]
        end

        before :once do
          @assignments = []
          20.downto(0) do |i|
            asg = course_assignment
            asg.due_at = i.days.ago
            asg.save!
            @assignments << asg
          end
        end

        it "should adhere to per_page" 


        it "should paginate results in correct order" 


        it "should include link headers in cached response" 

      end

      context "re-viewing the index with caching" do
        before do
          enable_cache
          @start_date = 2.weeks.ago.iso8601
          @end_date = 2.weeks.from_now.iso8601
        end

        it "should show new activity when a new discussion topic has been created" 


        it "should not show new activity after an unread discussion has been viewed" 


        it "should show new activity when a new discussion entry has been created" 


        it "should not show new activity after an unread discussion entry has been viewed" 


        it "should show new activity when a new submission comment has been created" 


        it "should not show new activity when a new submission comment has been viewed" 

      end

      context "new activity filter" do
        it "should return newly created & unseen items" 


        it "should return newly graded items" 


        it "should return items with new submission comments" 


        it "should mark submitted stuff within start and end dates" 


        it "shouldn't return things from other courses" 


        context "date range" do
          it "should not return items before the specified start_date" 


          it "should not return items after the specified end_date" 


          it "should return items within the start_date and end_date" 

        end

        context "discussion topic read/unread states" do
          before :once do
            discussion_topic_model context: @course
            @topic.todo_date = Time.zone.now
            @topic.save!
          end

          it "should return new discussion topics" 


          it "should not return read discussion topics" 


          it "should return discussion topics with unread replies" 


          it "should return graded discussions with unread replies" 


          it 'should calculate unread count correctly' 

        end
      end
    end
  end
end

