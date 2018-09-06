#
# Copyright (C) 2014 - present Instructure, Inc.
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

require_relative "../common"

describe "canvas_quizzes" do
  include_context "in-process server selenium tests"

  before do
    quiz_with_graded_submission([
      {:question_data => {:name => 'question 1', :points_possible => 1, 'question_type' => 'true_false_question'}},
      {:question_data => {:name => 'question 2', :points_possible => 1, 'question_type' => 'true_false_question'}}
    ])

    course_with_teacher_logged_in(:active_all => true, :course => @course)
  end

  describe 'statistics app' do
    it 'should mount' 

  end

  describe 'events app' do
    it 'should mount' 

  end

end

