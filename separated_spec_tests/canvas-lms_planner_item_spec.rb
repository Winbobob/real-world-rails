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

require_relative '../../../spec_helper'

describe Api::V1::PlannerItem do
  class PlannerItemHarness
    include Api::V1::PlannerItem

    def api_v1_users_todo_ignore_url(*args); end
    def assignment_json(*args); end
    def speed_grader_course_gradebook_url(*args); end
    def quiz_json(*args); end
    def course_quiz_url(*args); end
    def course_assignment_url(*args); end
    def wiki_page_json(*args); end
    def discussion_topic_api_json(*args); end
    def named_context_url(*args); end
    def calendar_event_json(*args); end
  end

  before :once do
    course_factory active_all: true
    @course.root_account.enable_feature!(:student_planner)

    teacher_in_course active_all: true
    student_in_course course: @course, active_all: true
    for_course = { course: @course }

    assignment_quiz [], for_course
    group_assignment_discussion for_course
    assignment_model for_course.merge(submission_types: 'online_text_entry')
    @assignment.workflow_state = "published"
    @assignment.save!

    @teacher_override = planner_override_model(plannable: @assignment, user: @teacher)
    @student_override = planner_override_model(plannable: @assignment, user: @student, marked_complete: true)
  end

  let(:api) { PlannerItemHarness.new }
  let(:session) { double }

  describe '.planner_item_json' do
    it 'should return with a plannable_date for the respective item' 


    context 'planner overrides' do
      it 'should return the planner override id' 


      it 'should have a nil planner_override value' 

    end

    describe '#submission_statuses_for' do
      it 'should return the submission statuses for the learning object' 


      it 'should indicate that an assignment is submitted' 


      it 'should indicate that an assignment is missing' 


      it 'should indicate that an assignment is excused' 


      it 'should indicate that a graded assignment is graded' 


      it 'should indicate that an assignment is late' 


      it 'should indicate that an assignment needs grading' 


      it 'should indicate that a graded assignment with comment has feedback and is graded' 


      it 'should indicate that a not-yet-graded assignment has feedback' 

    end
  end

  describe '#new_activity' do
    before :once do
      discussion_topic_model
    end

    it 'should return true for assignments with new grades' 


    it 'should return true for assignments with new feedback' 


    it 'should return true for unread discussions' 


    it 'should return false for a read discussion' 


    it 'should return false for discussions with replies that has been marked read' 


    it 'should return true for discussions with new replies' 


    it 'should return false for items without new activity' 


    it 'should return false for items that cannot have new activity' 

  end
end

