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

describe Quizzes::QuizQuestionsController do

  def course_quiz(active=false)
    @quiz = @course.quizzes.create
    @quiz.workflow_state = "available" if active
    @quiz.save!
    @quiz
  end

  def quiz_question
    @question = @quiz.quiz_questions.build
    @question.write_attribute(:question_data, {:answers => [
      {:id => 123456, :answer_text => 'asdf', :weight => 100},
      {:id => 654321, :answer_text => 'jkl;', :weight => 0}
    ]})
    @question.save!
    @question
  end

  def quiz_group
    @quiz.quiz_groups.create
  end

  before :once do
    course_with_teacher(active_all: true)
    course_quiz
  end

  describe "POST 'create'" do
    it "should require authorization" 


    it "should create a quiz question" 

    it "should preserve ids, if provided, on create" 


    it 'bounces data thats too long' 

  end

  describe "PUT 'update'" do
    before(:once) { quiz_question }

    it "should require authorization" 


    it "should update a quiz question" 


    it "should preserve ids, if provided, on update" 


    it 'bounces data thats too long' 


    it "should delete non-html comments if needed" 


    it "should leave assessment question verifiers" 

  end
end

