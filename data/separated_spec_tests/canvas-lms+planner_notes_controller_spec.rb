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

require_relative '../spec_helper'

describe PlannerNotesController do
  before :once do
    course_with_teacher(active_all: true)
    student_in_course(active_all: true)
    @course_1 = @course
    course_with_student(user: @student, active_all: true)
    @course_2 = @course
    @student_note = planner_note_model(user: @student, todo_date: 1.week.from_now)
    @teacher_note = planner_note_model(user: @teacher, todo_date: 1.week.from_now)
    @course_1_note = planner_note_model(user: @student, todo_date: 1.week.ago, course: @course_1)
    @course_2_note = planner_note_model(user: @student, todo_date: 3.weeks.ago, course: @course_2)
  end

  context "unauthenticated" do
    it "should return unauthorized" 

  end

  context "authenticated" do
    before :once do
      @course_1.root_account.enable_feature!(:student_planner)
      @course_2.root_account.enable_feature!(:student_planner)
    end

    context "as student" do
      before :each do
        user_session(@student)
      end

      describe "GET #index" do
        it "returns http success" 


        it "excludes deleted courses" 


        it "filters by context codes when specified" 


        it "includes own notes if specified" 


        it "filters by start and end dates when specified" 


        it 'should 400 for bad start dates' 


        it 'should 400 for bad end dates' 

      end

      describe "GET #show" do
        it "returns http success for accessing your notes" 


        it "returns http not found for notes not yours" 

      end

      describe "PUT #update" do
        it "returns http success" 


        it "invalidates the planner cache" 


        it "links to a course" 


        it "removes course link" 


        context "linked planner note" do
          before :once do
            assignment = @course_1.assignments.create!(title: 'blah')
            @student_note.course = @course_1
            @student_note.linked_object = assignment
            @student_note.save!
          end

          it "does not remove course link if a learning object link is present" 


          it "does not allow linking to a different course" 


          it "does allow other updates" 

        end
      end

      describe "POST #create" do
        it "returns http success" 


        it "invalidates the planner cache" 


        describe "linked_object" do
          it "links to an assignment" 


          it "links to an announcement" 


          it "links to a discussion topic" 


          it "links to a wiki page" 


          it "links to a quiz" 


          it "returns 404 when the linked object doesn't exist" 


          it "checks :read permission on the linked object" 


          it "returns 400 when attempting to link to an unsupported type" 


          it "returns 400 if the course_id is omitted" 


          it "returns 400 if a non-deleted planner note link to the object already exists" 


          context "sharding" do
            specs_require_sharding

            before :once do
              @shard1.activate do
                @remote_account = Account.create!
                @remote_course = course_with_student(account: @remote_account, user: @student, active_all: true).course
                @remote_assignment = @remote_course.assignments.create!(title: 'Over there')
              end
            end

            it "links to an object in another shard" 

          end
        end
      end

      describe "DELETE #destroy" do
        it "returns http success" 


        it "invalidates the planner cache" 

      end
    end

    context "as teacher" do
      before :each do
        user_session(@teacher)
      end

      describe "GET #index" do
        it "returns http success" 

      end

      describe "GET #show" do
        it "returns http success" 


        it "returns http not found for notes not yours" 

      end

      describe "PUT #update" do
        it "returns http success" 


        it "invalidates the planner cache" 

      end

      describe "POST #create" do
        it "returns http success" 


        it "invalidates the planner cache" 

      end

      describe "DELETE #destroy" do
        it "returns http success" 


        it "invalidates the planner cache" 

      end
    end
  end
end

