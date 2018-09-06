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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "/courses/_recent_event" do
  it "should render" 


  it "should render without a user" 


  it "shows the context when asked to" 


  it "doesn't show the context when not asked to" 


  context 'assignments' do
    before do
      course_with_student(active_all: true)
      submission_model
      assign(:current_user, @user)
    end

    it 'shows points possible for an ungraded assignment' 


    it 'shows the grade for a graded assignment' 


    it 'shows the due date' 


    it 'shows overridden due date' 

  end

  context "assignment muting" do
    before(:each) do
      course_with_student
      view_context
      @quiz = @course.quizzes.create!
      @quiz.generate_quiz_data
      @quiz.workflow_state = 'available'
      @quiz.published_at = Time.zone.now
      @quiz.save

      @quiz_submission = @quiz.generate_submission(@user)
      Quizzes::SubmissionGrader.new(@quiz_submission).grade_submission

      @submission = @quiz_submission.submission
      allow_any_instance_of(Submission).to receive(:grade).and_return('1234567890')
    end

    it "should show the grade for a non-muted assignment" 


    it "should not show the grade for a muted assignment" 

  end
end

# Sidebar content

