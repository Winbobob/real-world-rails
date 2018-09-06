#
# Copyright (C) 2017 - present Instructure, Inc.
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

describe PlannerOverridesController do
  include PlannerHelper

  before :once do
    course_with_teacher(active_all: true)
    student_in_course(active_all: true)
    @group = @course.assignment_groups.create(:name => "some group")
    @assignment = course_assignment
    @assignment2 = course_assignment
    @planner_override = PlannerOverride.create!(plannable_id: @assignment.id,
                                                plannable_type: "Assignment",
                                                marked_complete: false,
                                                user_id: @student.id)
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

    describe "GET #items_index" do
      it "returns http success" 


      it "checks the planner cache" 


      it "should show wiki pages with todo dates" 


      it "should show planner notes for the user" 


      it "should show calendar events for the course and user" 


      it "should show appointment groups" 


      it "should show planner overrides created on quizzes" 


      it "should show planner overrides created on discussions" 


      it "should show planner overrides created on wiki pages" 


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

      context "only_favorites" do
        before :once do
          @u = User.create!

          @c1 = course_with_student(:active_all => true, :user => @u).course
          @u.favorites.create!(:context_type => "Course", :context_id => @c1)
          @a1 = course_assignment

          @c2 = course_with_student(:active_all => true, :user => @u).course
          @u.favorites.where(:context_type => "Course", :context_id => @c2).first.destroy
          @a2 = course_assignment
        end

        before :each do
          user_session(@u)
        end

        it "should include all course data by default" 


        it "should only return data from favorite courses if specified" 

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

        it "should ignore shards other than the current account's" 

      end

      context "pagination" do
        PER_PAGE = 5

        def test_page(bookmark = nil)
          opts = { per_page: PER_PAGE }
          opts.merge(page: bookmark) if bookmark.present?

          page =  get :items_index, params: opts
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

        end
      end
    end

    describe "GET #index" do
      it "returns http success" 

    end

    describe "GET #show" do
      it "returns http success" 

    end

    describe "PUT #update" do
      it "returns http success" 


      it "invalidates the planner cache" 

    end

    describe "POST #create" do
      it "returns http success" 


      it "invalidates the planner cache" 


      it "should save announcement overrides with a plannable_type of discussion_topic" 

    end

    describe "DELETE #destroy" do
      it "returns http success" 


      it "invalidates the planner cache" 

    end
  end
end

