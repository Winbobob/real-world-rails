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

    def submission_json(*args); end
    def named_context_url(*args); "named_context_url"; end
    def course_assignment_submission_url(*args); 'course_assignment_submission_url'; end
    def calendar_url_for(*args); end
  end

  before :once do
    course_factory active_all: true
    @course.root_account.enable_feature!(:student_planner)

    teacher_in_course active_all: true
    @reviewer = student_in_course(course: @course, active_all: true).user
    @student = student_in_course(course: @course, active_all: true).user
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


    it 'should return with a context_name and context_image for the respective item' 


    context 'planner overrides' do
      it 'should return the planner override id' 


      it 'should have a nil planner_override value' 

    end

    context 'peer reviews' do
      it 'should include submissions needing peer review' 

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


      it 'should include comment data for assignments with feedback' 


      it 'should include old comment data for assignments with old feedback' 


      it 'should include comment data from before the assignment is due' 


      it 'should discard comments by the user herself' 


      it 'should select the most recent comment' 


      it 'should include is_media if comment has a media_comment_id' 


      it 'should not include an author_name or author_avatar_url if comment is anonymous' 

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

  describe "#html_url" do
    it "links to an assignment's submission if appropriate" 


    it "links to a graded discussion topic's submission if appropriate" 

  end
end

