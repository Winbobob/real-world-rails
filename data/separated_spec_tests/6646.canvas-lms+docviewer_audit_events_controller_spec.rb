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

require 'spec_helper'

describe DocviewerAuditEventsController do
  before :once do
    @course = Course.create!(name: 'a course')
    @student = student_in_course(name: 'Student', course: @course, enrollment_state: :active).user
    @first_ta = ta_in_course(name: 'First Ta', course: @course, enrollment_state: :active).user
    @second_ta = ta_in_course(name: 'Second Ta', course: @course, enrollment_state: :active).user
    @teacher = teacher_in_course(name: 'teacher', course: @course, enrollment_state: :active).user
    @admin = account_admin_user
    @encoded64_secret = 'c2Vrcml0'
    @secret = Base64.decode64(@encoded64_secret)
    @attachment = @student.attachments.create!(course: @course, content_type: 'text/plain', filename: 'attachment.txt')
    Canvadoc.create!(document_id: "abc123#{@attachment.id}", attachment_id: @attachment.id)
  end

  before :each do
    # Assignment.create! will hit MultiCache, and if a default stub doesn't
    # exist, the stub with args will throw an error.
    allow(Canvas::DynamicSettings).to receive(:find).and_return({})
    allow(Canvas::DynamicSettings).to receive(:find).with(service: 'canvadoc', default_ttl: 5.minutes).and_return(
      {'secret' => @encoded64_secret}
    )
  end

  let(:default_params) do
    {
      docviewer_audit_event: {
        annotation_body: {
          color: '',
          content: '',
          created_at: '',
          modified_at: '',
          page: '',
          type: ''
        },
        event_type: 'highlight_created',
        related_annotation_id: 1
      },
      token: Canvas::Security.create_jwt({}, nil, @secret, :HS512),
      canvas_user_id: @teacher.id,
      document_id: @attachment.canvadoc.document_id,
      submission_id: @submission.id
    }
  end

  describe 'status codes' do
    it 'renders status unauthorized if not passed a correct jwt auth token' 


    it 'explains if not passed a correct jwt auth token' 


    it 'renders status bad_request if param values are missing' 


    it 'renders status not_acceptable for a non-moderated, non-anonymous assignment' 


    it 'explains why it rendered status not_acceptable' 


    it 'renders status unprocessable_entity if passed an invalid event type' 


    context 'for a moderated assignment' do
      it 'renders status ok if assignment has an open slot for moderating' 


      it 'renders status ok if assignment does not have an open slot for moderating but user is final grader' 


      it 'renders status forbidden if no open slot and user is not final grader' 


      it 'explains that user cannot be a moderation grader, if so' 

    end

    context 'for an anonymous assignment' do
      it 'renders status ok' 

    end
  end

  it 'allows students to annotate, if assignment is anonymous or moderated' 


  it 'allows fake students to annotate, if assignment is anonymous or moderated' 


  context "as an admin" do
    before(:once) do
      @assignment = Assignment.create!(
        course: @course,
        name: 'moderated',
        moderated_grading: true,
        grader_count: 2,
        final_grader: @teacher
      )
      @submission = @assignment.submit_homework(@student, submission_type: 'online_upload', attachments: [@attachment])
      @assignment.grade_student(@student, grade: 10, grader: @first_ta, provisional: true)
    end

    subject(:annotate_as_admin) do
      -> { post :create, format: :json, params: default_params.merge(canvas_user_id: account_admin_user.id) }
    end

    it "can annotate even if there are no slots available" 


    it "does not occupy a slot when annotating" 

  end

  it 'updates an existing moderation grader to occupy slot, if it had not already' 


  it 'handles canvadocs on older version submissions' 


  it 'creates a moderation grader' 


  it 'creates a moderation grader even if full, if user is final grader' 


  it 'allows any grader to annotate a moderated assignment if grades have been posted' 


  it 'creates an AnonymousOrModerationEvent' 


  it 'saves a copy of the annotation_body in the payload' 


  it "saves the annotation_id in the payload" 


  it "saves the context in the payload" 


  it 'saves the related_annotation_id in the payload' 


  it 'renders a json representation of the event on successful creation' 


  it "is okay if related_annotation_id is not passed" 


  it "creates an event with 'docviewer_' prepended to the supplied event type" 

end

