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

require_relative '../spec_helper'

RSpec.describe AnonymousSubmissionsController do
  it_behaves_like 'a submission update action', :anonymous_submissions

  describe "GET show" do
    before do
      course_with_student_and_submitted_homework
      @course.account.enable_service(:avatars)
      @context = @course
      @assignment.update!(anonymous_grading: true)
      @submission.update!(score: 10)
      @assignment.unmute!
    end

    let(:body) { JSON.parse(response.body)['submission'] }

    it "renders show template" 


    it "renders json with scores for teachers" 


    it "renders json with scores for students" 


    it "mark read if reading one's own submission" 


    it "don't mark read if reading someone else's submission" 


    it "renders json with scores for teachers on muted assignments" 


    it "renders json without scores for students on muted assignments" 


    it "should show rubric assessments to peer reviewers" 

  end
end

