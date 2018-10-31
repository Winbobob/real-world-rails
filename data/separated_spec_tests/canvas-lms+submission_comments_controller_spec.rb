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

require_relative '../spec_helper'

RSpec.describe SubmissionCommentsController do
  describe "GET 'index'" do
    before :once do
      course = Account.default.courses.create!
      @teacher = course_with_teacher(course: course, active_all: true).user
      @student = course_with_student(course: course, active_all: true).user
      @assignment = course.assignments.create!
      @submission = @assignment.submissions.find_by!(user: @student)
      @submission.submission_comments.create!(author: @teacher, comment: 'a comment')
    end

    context 'given a teacher session' do
      before { user_session(@teacher) }

      context 'given a standard request' do
        before do
          get :index, params: { submission_id: @submission.id }, format: :pdf
        end

        specify { expect(response).to have_http_status :ok }
        specify { expect(response).to render_template(:index) }
        specify { expect(response.headers.fetch('Content-Type')).to match(/\Aapplication\/pdf/) }
      end

      context 'given a request where no submission is present' do
        before do
          @submission.all_submission_comments.destroy_all
          @submission.destroy
          get :index, params: { submission_id: @submission.id }, format: :pdf
        end

        specify { expect(response).to have_http_status :not_found }
        specify { expect(response).to render_template('shared/errors/404_message') }
        specify { expect(response.headers.fetch('Content-Type')).to match(/\Atext\/html/) }
      end

      context 'given a request where no submission comments are present' do
        before do
          @submission.all_submission_comments.destroy_all
          get :index, params: { submission_id: @submission.id }, format: :pdf
        end

        specify { expect(response).to have_http_status :ok }
        specify { expect(response).to render_template(:index) }
        specify { expect(response.headers.fetch('Content-Type')).to match(/\Aapplication\/pdf/) }
      end

      context 'given an anonymized assignment' do
        before do
          @assignment.update!(anonymous_grading: true)
          get :index, params: { submission_id: @submission.id }, format: :pdf
        end

        specify { expect(response).to have_http_status :unauthorized }
        specify { expect(response).to render_template('shared/unauthorized') }
        specify { expect(response.headers.fetch('Content-Type')).to match(/\Atext\/html/) }
      end
    end

    context 'given a student session' do
      before do
        user_session(@student)
        get :index, params: { submission_id: @submission.id }, format: :pdf
      end

      specify { expect(response).to have_http_status :unauthorized }
      specify { expect(response).to render_template('shared/unauthorized') }
      specify { expect(response.headers.fetch('Content-Type')).to match(/\Atext\/html/) }
    end
  end

  describe "DELETE 'destroy'" do
    it "should delete the comment" 


    describe 'audit event logging' do
      let(:course) { Course.create! }
      let(:student) { course.enroll_student(User.create!, enrollment_state: 'active').user }
      let(:teacher) { course.enroll_teacher(User.create!, enrollment_state: 'active').user }
      let(:assignment) { course.assignments.create!(title: 'hi', anonymous_grading: true) }
      let(:submission) { assignment.submission_for_student(student) }

      let!(:comment) do
        submission.submission_comments.create!(
          author: student,
          comment: 'initial comment'
        )
      end

      let!(:draft_comment) do
        submission.submission_comments.create!(
          author: student,
          draft: true,
          comment: 'this is a draft'
        )
      end

      let(:audit_events) do
        AnonymousOrModerationEvent.where(
          assignment: assignment,
          submission: submission,
        ).reload
      end
      let(:last_event) { audit_events.last }

      context 'when an assignment is auditable' do
        before(:each) do
          user_session(teacher)
        end

        it 'creates an event when a published comment is destroyed' 


        it 'records the user_id of the destroyer' 


        it 'sets the event_type of the event to "submission_comment_deleted"' 


        it 'includes the ID of the destroyed comment in the payload' 

      end

      it 'does not create an event if the assignment is not auditable' 


      it 'does not create an event if the comment is a draft' 

    end
  end

  describe "PATCH 'update'" do
    before(:once) do
      course_with_teacher(active_all: true)
      @the_teacher = @teacher
      submission_comment_model(author: @teacher, draft_comment: true)

      @test_params = {
        id: @submission_comment.id,
        format: :json,
        submission_comment: {
          draft: false
        }
      }
    end

    before(:each) do
      user_session(@the_teacher)
    end

    it "allows updating the comment" 


    it "sets the edited_at if the comment is updated" 


    it "returns strings for numeric values when passed the json+canvas-string-ids header" 


    it "does not set the edited_at if the comment is not updated" 


    it "allows updating the status field" 


    describe 'audit event logging' do
      let(:course) { Course.create! }
      let(:student) { course.enroll_student(User.create!, enrollment_state: 'active').user }
      let(:assignment) { course.assignments.create!(title: 'hi', anonymous_grading: true) }
      let(:submission) { assignment.submission_for_student(student) }

      let!(:comment) do
        submission.submission_comments.create!(
          author: student,
          comment: 'initial comment'
        )
      end

      let!(:draft_comment) do
        submission.submission_comments.create!(
          author: student,
          draft: true,
          comment: 'this is a draft'
        )
      end

      let(:audit_events) do
        AnonymousOrModerationEvent.where(
          assignment: assignment,
          submission: submission
        ).reload
      end
      let(:last_event) { audit_events.last }

      before(:each) do
        user_session(student)
      end

      context 'when an assignment is auditable' do
        it 'creates an event when a non-draft comment is edited' 


        it 'sets the user_id of the event to the editing user' 


        it 'sets the event_type of the event to "submission_comment_updated"' 


        it 'includes the ID of the updated comment in the payload' 


        it 'does not create an event when a comment is saved as a draft' 


        context 'when publishing an existing draft' do
          it 'sets the event_type to "submission_comment_created"' 


          it 'records changed values as if saving a new comment' 

        end

        it 'captures changes to the comment field' 

      end

      it 'does not create an event when the assignment is not auditable' 

    end
  end
end

