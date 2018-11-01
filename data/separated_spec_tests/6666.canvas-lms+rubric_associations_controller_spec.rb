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

describe RubricAssociationsController do
  describe "POST 'create'" do
    it "should require authorization" 

    it "should assign variables" 

    it "should create without manager_rubrics permission" 


    describe 'AnonymousOrModerationEvent creation for auditable assignments' do
      let(:course) { Course.create! }
      let(:teacher) { course.enroll_teacher(User.create!, active_all: true).user }
      let(:assignment) { course.assignments.create!(anonymous_grading: true) }
      let(:rubric) { Rubric.create!(title: 'hi', context: course) }

      let(:association_params) do
        {association_id: assignment.id, association_type: 'Assignment', rubric_id: rubric.id}
      end
      let(:request_params) do
        {course_id: course.id, assignment_id: assignment.id, rubric_association: association_params}
      end

      let(:last_created_event) { AnonymousOrModerationEvent.where(event_type: 'rubric_created').last }

      before(:each) do
        user_session(teacher)
      end

      it 'records a rubric_created event for the assignment' 


      it 'includes the ID of the added rubric in the payload' 


      it 'includes the updating user on the event' 


      it 'includes the associated assignment on the event' 

    end
  end

  describe "PUT 'update'" do
    it "should require authorization" 

    it "should assign variables" 

    it "should update the rubric if updateable" 

    it "should not update the rubric if not updateable (should make a new one instead)" 

    it "should update the association" 


    describe 'AnonymousOrModerationEvent creation for auditable assignments' do
      let(:course) { Course.create! }
      let(:teacher) { course.enroll_teacher(User.create!, active_all: true).user }
      let(:assignment) { course.assignments.create!(anonymous_grading: true) }
      let(:rubric) { Rubric.create!(title: 'hi', context: course) }

      let(:association_params) do
        {association_id: assignment.id, association_type: 'Assignment', rubric_id: rubric.id}
      end
      let(:request_params) do
        {course_id: course.id, assignment_id: assignment.id, rubric_association: association_params}
      end

      let(:old_rubric) { Rubric.create!(title: 'zzz', context: course) }
      let(:last_updated_event) { AnonymousOrModerationEvent.where(event_type: 'rubric_updated').last }

      before(:each) do
        RubricAssociation.generate(
          teacher,
          old_rubric,
          course,
          association_object: assignment,
          purpose: 'grading'
        )

        user_session(teacher)
      end

      it 'records a rubric_updated event for the assignment' 


      it 'includes the ID of the removed rubric in the payload' 


      it 'includes the ID of the added rubric in the payload' 


      it 'includes the updating user on the event' 


      it 'includes the associated assignment on the event' 

    end
  end

  describe "DELETE 'destroy'" do
    it "should require authorization" 

    it "should delete the rubric if deletable" 

    it "should_not delete the rubric if still created at the context level instead of the assignment level" 

    it "should delete only the association if the rubric is not deletable" 


    it "should remove aligments links" 


    context 'when associated with an auditable assignment' do
      let(:course) { Course.create! }
      let(:assignment) { course.assignments.create!(anonymous_grading: true) }
      let(:teacher) { course.enroll_teacher(User.create!, active_all: true).user }
      let(:rubric) { Rubric.create!(title: 'aaa', context: course) }
      let!(:rubric_association) do
        RubricAssociation.generate(teacher, rubric, course, purpose: 'grading', association_object: assignment)
      end

      before(:each) do
        user_session(teacher)
      end

      it 'creates an AnonymousOrModerationEvent capturing the deletion' 


      it 'includes the removed rubric in the event payload' 

    end
  end
end

