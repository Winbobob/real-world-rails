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

describe Submissions::PreviewsController do
  describe 'GET :show' do
    before do
      course_with_student_and_submitted_homework
      @context = @course
      user_session(@student)
    end

    it "should render show_preview" 


    context "when assignment is a quiz" do
      before do
        quiz_with_submission
      end

      it "should redirect to course_quiz_url" 


      context "and user is a teacher" do
        before do
          user_session(@teacher)
          submission = @quiz.assignment.submissions.where(user_id: @student).first
          submission.quiz_submission.with_versioning(true) do
            submission.quiz_submission.update_attribute(:finished_at, 1.hour.ago)
          end
        end

        it "should redirect to course_quiz_history_url" 


        it "should favor params[:version] when set" 

      end
    end
  end
end

