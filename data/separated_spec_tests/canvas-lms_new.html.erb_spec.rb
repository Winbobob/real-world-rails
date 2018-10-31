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

describe "/quizzes/quizzes/new" do
  def course_quiz(active=false)
    @quiz = @course.quizzes.create
    @quiz.workflow_state = "available" if active
    @quiz.save!
    @quiz
  end

  def quiz_question
    @quiz.quiz_questions.create
  end

  it "should render" 


  context "with course and quiz" do
    before :each do
      course_with_teacher(:active_all => true)
      @quiz = course_quiz
      assign(:quiz, @quiz)
      assign(:js_env, {quiz_max_combination_count: 200})
      view_context
    end
    it "should not display 'NOTE:' message when questions within limit" 


    it "should explain why 'Show Question Details' is disabled" 


    it 'has a published inditactor when the quiz is published' 


    it 'has a not_published indicator when the quiz is not published' 

  end

end


