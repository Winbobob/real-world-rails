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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../views_helper')

describe "/quizzes/quizzes/history" do
  before do
    course_with_student
    view_context
    assign(:user, @user)
  end

  context 'beta quiz navigation' do
    before do
      quiz = assign(:quiz, @course.quizzes.create!)
      sub = assign(:submission, quiz.generate_submission(@user))
      assign(:current_submission, sub)
      assign(:version_instances, sub.submitted_attempts)
    end

    it 'displays when configured' 


    it "doesn't display when not enabled" 

  end

  context 'question group warning' do
    before do
      @student.preferences[:enable_speedgrader_grade_by_question] = true
      @student.save!
    end

    it 'displays when quiz has question groups' 


    it 'does not display when quiz has only questions' 

  end

  context 'with anonymous grading' do
    before do
      allow(@course).to receive(:feature_enabled?).and_call_original
      allow(@course).to receive(:feature_enabled?).with(:anonymous_grading).and_return(true)
    end

    it "doesn't display the user name" 

  end
end

