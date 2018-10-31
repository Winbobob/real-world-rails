#
# Copyright (C) 2015 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Submissions::AttachmentForSubmissionDownload do
  before :once do
    course_with_student(active_all: true)
    assignment_model(course: @course)
    submission_model({
      assignment: @assignment,
      body: 'here my assignment',
      submission_type: 'online_text_entry',
      user: @student
    })
    @submission.submitted_at = 3.hours.ago
    @submission.save
    @options = {}
  end

  subject do
    Submissions::AttachmentForSubmissionDownload.new(@submission, @options)
  end

  describe '#attachment' do
    it 'raises ActiveRecord::RecordNotFound when download_id is not present' 


    context 'when attachment belongs to a submission' do
      before do
        @attachment = @submission.attachment = attachment_model(context: @course)
        @submission.save
        @options = { download: @attachment.id }
      end

      it 'returns the attachment that belongs to the submission' 

    end

    context 'when submission has prior attachment' do
      before :once do
        @attachment = @submission.attachment = attachment_model(context: @course)
        @submission.submitted_at = 3.hours.ago
        @submission.save
      end

      it 'returns prior attachment' 

    end

    context 'when download id is found in attachments collection ids' do
      before :once do
        @attachment = attachment_model(context: @course)
        AttachmentAssociation.create!(context: @submission, attachment: @attachment)
        @options = { download: @attachment.id }
      end

      it 'returns attachment from attachments collection' 

    end

    context 'when comment id & download id are present' do
      before :once do
        @original_course = @course
        @original_student = @student
        course_with_student(active_all:true)
        submission_comment_model
        @attachment = attachment_model(context: @assignment)
        @submission_comment.attachments = [@attachment]
        @submission_comment.save
        @options = { comment_id: @submission_comment.id, download: @attachment.id }
      end

      it 'returns submission comment attachment' 

    end

    context 'when download id is in versioned_attachments' do
      before :once do
        @attachment = attachment_model(context: @assignment)
        @submission.attachment_ids = "#{@attachment.id}"
        @submission.save
        @options = { download: @attachment.id }
      end

      it 'returns attachment from versioned_attachments' 

    end
  end
end

