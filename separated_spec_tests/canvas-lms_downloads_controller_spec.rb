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

require 'spec_helper'

describe Submissions::DownloadsController do
  describe 'GET :show' do
    before do
      course_with_student_and_submitted_homework
      @context = @course
      user_session(@student)
    end

    context 'with user id not present in course' do
      before do
        @attachment = @submission.attachment = attachment_model(context: @context)
        @submission.save
        course_with_student(active_all: true)
        user_session(@student)
      end

      it 'should set flash error' 


      it "should redirect to context assignment url" 

    end

    context "when attachment belongs to submission" do
      before do
        @attachment = @submission.attachment = attachment_model(context: @context)
        @submission.save
      end

      it "sets attachment the submission belongs to by default" 


      it "renders as json" 

    end

    it "sets attachment from submission history if present" 


    it "sets attachment from attachments collection when attachment_id is not present" 


    context "and params[:comment_id]" do
      before do
        # our factory system is broken
        @original_context = @context
        @original_student = @student
        course_with_student(active_all:true)
        submission_comment_model
        @attachment = attachment_model(context: @assignment)
        @submission_comment.attachments = [@attachment]
        @submission_comment.save
      end

      it "sets attachment from comment_id & download_id" 

    end

    it "should redirect download requests with the download_frd parameter" 

  end
end

