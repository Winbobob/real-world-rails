
# Copyright (C) 2012 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../api_spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../locked_spec')

describe Quizzes::QuizGroupsController, type: :request do

  before :once do
    teacher_in_course(:active_all => true)
    @quiz = @course.quizzes.create! :title => 'title'
    @bank = @course.assessment_question_banks.create! :title => 'Test Bank'
  end

  describe "POST /api/v1/courses/:course_id/quizzes/:quiz_id/groups (create)" do

    def api_create_quiz_group(quiz_group_params, opts={})
      api_call(:post, "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/groups",
              {:controller=>"quizzes/quiz_groups", :action => "create", :format => "json", :course_id => "#{@course.id}", :quiz_id => "#{@quiz.id}"},
              {:quiz_groups => [quiz_group_params]},
              {'Accept' => 'application/vnd.api+json'}, opts)
    end

    let (:new_quiz_group) { @quiz.reload; @quiz.quiz_groups.first }

    it "creates a question group for a quiz" 


    it "pulls questions from an assessment bank for a group" 


    it "doesn't assign assessment bank if bank doesn't exist" 


    it "doesn't allow setting fields not in the whitelist" 


    it "renders a validation error when the name is too long" 


    it "renders a validation error when pick_count isn't a number" 


    it "renders a validation error when question_points isn't a number" 

  end

  describe "PUT /api/v1/courses/:course_id/quizzes/:quiz_id/groups/:id (update)" do

    def api_update_quiz_group(quiz_group_params, opts={})

      api_call(:put, "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/groups/#{@group.id}",
              {:controller=>"quizzes/quiz_groups", :action => "update", :format => "json", :course_id => "#{@course.id}", :quiz_id => "#{@quiz.id}", :id => "#{@group.id}"},
              {:quiz_groups => [quiz_group_params]},
              {'Accept' => 'application/vnd.api+json'}, opts)
    end

    before :once do
      @group = @quiz.quiz_groups.create :name => 'Test Group'
    end

    it "updates group attributes" 


    it "won't allow update of assessment bank for a group" 


    it "doesn't allow setting fields not in the whitelist" 


    it "renders a validation error when the name is too long" 


    it "renders a validation error when pick_count isn't a number" 


    it "renders a validation error when question_points isn't a number" 

  end

  describe "DELETE /courses/:course_id/quizzes/:quiz_id/groups/:id (destroy)" do
    before do
      @group = @quiz.quiz_groups.create :name => 'Test Group'
    end

    it "deletes a quiz group" 

  end

  describe "POST /courses/:course_id/quizzes/:quiz_id/groups/:id/reorder" do
    before do
      @question1 = @quiz.quiz_questions.create!(:question_data => {'name' => 'test question 1', 'answers' => [{'id' => 1}, {'id' => 2}], :position => 1})
      @question2 = @quiz.quiz_questions.create!(:question_data => {'name' => 'test question 2', 'answers' => [{'id' => 3}, {'id' => 4}], :position => 2})
      @question3 = @quiz.quiz_questions.create!(:question_data => {'name' => 'test question 3', 'answers' => [{'id' => 5}, {'id' => 6}], :position => 3})

      @group = @quiz.quiz_groups.create :name => 'Test Group'
      @group.quiz_questions = [@question1, @question2, @question3]
    end

    it "reorders a quiz group's questions" 

  end

  describe "GET /courses/:course_id/quizzes/:quiz_id/groups/:id" do
    let(:group) { @quiz.quiz_groups.create :name => 'Test Group' }
    let(:path) { "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/groups/#{group.id}" }
    let(:params) do
      {
          :controller => "quizzes/quiz_groups",
          :action => "show",
          :format => "json",
          :course_id => "#{@course.id}",
          :quiz_id => "#{@quiz.id}",
          :id => "#{group.id}"
      }
    end

    it "returns a specific QuizGroup object" 


    it "should be unauthorized for unenrolled users" 

  end
end

