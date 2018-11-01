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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PlannerHelper do
  context "on a submission" do
    before(:once) do
      student_in_course(active_all: true)
      @assignment = @course.assignments.create!(:name => "pls submit", :submission_types => ["online_text_entry"], :points_possible => 42)
      @assignment.publish

      @discussion_assignment = @course.assignments.create!(title: 'graded discussion assignment', due_at: 1.day.from_now, points_possible: 10)
      @discussion = @course.discussion_topics.create!(assignment: @discussion_assignment, title: 'graded discussion')
      @discussion.publish

      @quiz = generate_quiz(@course)
      @quiz2 = generate_quiz(@course)

      @assignment_po = planner_override_model(user: @student, plannable: @assignment, marked_complete: false)
      @discussion_po = planner_override_model(user: @student, plannable: @discussion, marked_complete: false)
      @quiz_po = planner_override_model(user: @student, plannable: @quiz, marked_complete: false)
      @quiz2_po = planner_override_model(user: @student, plannable: @quiz2, marked_complete: false)
    end

    describe "#completes_planner_item_for_submission" do
      it "completes an assignment override" 


      it "completes a discussion override" 


      it "completes a quiz override" 


      it "completes an autograded quiz override" 

    end

    describe "#complete_planner_item_for_quiz_submission" do
      it "completes an ungraded survey override" 


      it "creates completed override when ungraded survey is submitted" 

    end
  end
end

