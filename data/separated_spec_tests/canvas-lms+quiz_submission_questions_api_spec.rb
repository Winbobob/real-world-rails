#
# Copyright (C) 2013 Instructure, Inc.
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
require 'quiz_spec_helper'

describe Quizzes::QuizSubmissionQuestionsController, :type => :request do

  module Helpers
    def create_question(type, factory_options = {}, quiz=@quiz)
      factory = method(:"#{type}_question_data")

      # can't test for #arity directly since it might be an optional parameter
      data = factory.parameters.include?([ :opt, :options ]) ?
        factory.call(factory_options) :
        factory.call

      data = data.except('id', 'assessment_question_id')

      qq = quiz.quiz_questions.create!({ question_data: data })
      qq.assessment_question.question_data = data
      qq.assessment_question.save!

      qq
    end

    def create_question_set
      @qq1 = create_question 'multiple_choice'
      @qq2 = create_question 'true_false'
      create_answers
    end

    def create_answers(opts={correct: true})
      @quiz_submission.submission_data = {
        "question_#{@qq1.id}" => opts[:correct] ? "1658" : "2405",
        "question_#{@qq2.id}" => opts[:correct] ? "8950" : "8403"
      }
    end

    def api_index(data = {}, options = {})
      url = "/api/v1/quiz_submissions/#{@quiz_submission.id}/questions"
      params = { :controller => 'quizzes/quiz_submission_questions',
                 :action => 'index',
                 :format => 'json',
                 :quiz_submission_id => @quiz_submission.id.to_s,
                 :quiz_submission_attempt => options[:quiz_submission_attempt]}
      if options[:raw]
        raw_api_call(:get, url, params, data)
      else
        api_call(:get, url, params, data)
      end

    end

    def api_show(data = {}, options = {})
      url = "/api/v1/quiz_submissions/#{@quiz_submission.id}/questions/#{@question[:id]}"
      params = { :controller => 'quizzes/quiz_submission_questions',
                 :action => 'show',
                 :format => 'json',
                 :quiz_submission_id => @quiz_submission.id.to_s,
                 :id => @question[:id].to_s }
      if options[:raw]
        raw_api_call(:get, url, params, data)
      else
        api_call(:get, url, params, data)
      end
    end

    def api_answer(data = {}, options = {})
      url = "/api/v1/quiz_submissions/#{@quiz_submission.id}/questions"
      params = { :controller => 'quizzes/quiz_submission_questions',
                 :action => 'answer',
                 :format => 'json',
                 :quiz_submission_id => @quiz_submission.id.to_s }
      data = {
        validation_token: @quiz_submission.validation_token,
        attempt: @quiz_submission.attempt
      }.merge(data)

      if options[:raw]
        raw_api_call(:post, url, params, data)
      else
        api_call(:post, url, params, data)
      end
    end

    def api_flag(data = {}, options = {})
      url = "/api/v1/quiz_submissions/#{@quiz_submission.id}/questions/#{@question[:id]}/flag"
      params = { :controller => 'quizzes/quiz_submission_questions',
                 :action => 'flag',
                 :format => 'json',
                 :quiz_submission_id => @quiz_submission.id.to_s,
                 :id => @question[:id].to_s }
      data = {
        validation_token: @quiz_submission.validation_token,
        attempt: @quiz_submission.attempt
      }.merge(data)

      if options[:raw]
        raw_api_call(:put, url, params, data)
      else
        api_call(:put, url, params, data)
      end
    end

    def api_unflag(data = {}, options = {})
      url = "/api/v1/quiz_submissions/#{@quiz_submission.id}/questions/#{@question[:id]}/unflag"
      params = { :controller => 'quizzes/quiz_submission_questions',
                 :action => 'unflag',
                 :format => 'json',
                 :quiz_submission_id => @quiz_submission.id.to_s,
                 :id => @question[:id].to_s }
      data = {
        validation_token: @quiz_submission.validation_token,
        attempt: @quiz_submission.attempt
      }.merge(data)

      if options[:raw]
        raw_api_call(:put, url, params, data)
      else
        api_call(:put, url, params, data)
      end
    end
  end

  include Helpers


  describe 'GET /quiz_submissions/:quiz_submission_id/questions [index]' do
    before :once do
      course_with_student(:active_all => true)
      @quiz = @course.quizzes.create!({
          title: 'test quiz',
          show_correct_answers: true,
          show_correct_answers_last_attempt: true,
          allowed_attempts: 2
        })
      @quiz_submission = @quiz.generate_submission(@student)
    end

    it 'should be authorized for student' 


    it 'should return an empty list' 


    describe "with data" do
      before :once do
        create_question_set
      end

      it 'should list all items' 


      it "should return questions for a previous version of the quiz" 


      it "should return unauthorized when results are hidden in quiz settings" 

    end

    it "should be authorized when results are hidden in quiz settings and isn't complete" 


    it "should deny student access when quiz is OQAAT" 


    it "should allow teacher access even if quiz is OQAAT" 


    it "should deny access to another student" 

  end

  describe 'GET /quiz_submissions/:quiz_submission_id/questions/:id [show]' do
    before :once do
      course_with_student(:active_all => true)
      @quiz = quiz_model(course: @course)
      @quiz_submission = @quiz.generate_submission(@student)

      create_question_set
      @question = @qq1
    end

    it 'should be unauthorized' 


    it 'should grant access to its student' 


    it 'should deny access by other students' 


    context 'Output' do
      it 'should include the quiz question id' 


      it 'should include the flagged status' 

    end

    context 'Links' do
      it 'should include its linked quiz_question' 

    end

    context 'JSON-API compliance' do
      it 'should conform to the JSON-API spec when returning the object' 


      it 'should conform to the JSON-API spec when returning linked objects' 

    end
  end

  describe 'POST /quiz_submissions/:quiz_submission_id/questions [answer]' do
    context 'access policy' do
      it 'should grant access to the teacher' 


      it 'should grant access to its student' 

    end

    context 'as a student' do
      before :once do
        course_with_student(:active_all => true)
        @quiz = quiz_model(course: @course)
      end

      def generate_submission
        @quiz.generate_quiz_data
        @quiz_submission = @quiz.generate_submission(@student)
      end

      it "shouldn't give any answers information" 


      context 'answering questions' do
        it 'should answer a MultipleChoice question' 


        it 'should answer a TrueFalse question' 


        it 'should answer a ShortAnswer question' 


        it 'should answer a FillInMultipleBlanks question' 


        it 'should answer a MultipleAnswers question and allow deseleciton' 


        it 'should answer an Essay question' 


        it 'should answer a MultipleDropdowns question' 


        it 'should answer a Matching question' 


        it 'should answer a Numerical question' 


        it 'should answer a Calculated question' 

      end

      it 'should update an answer' 


      it 'should answer according to the state of the question saved in the quiz session' 


      it 'should present errors' 


      # This is duplicated from QuizSubmissionsApiController spec and will be
      # moved into a Controller Filter spec once CNVS-10071 is in.
      #
      # [Transient:CNVS-10071]
      it 'should respect the quiz LDB requirement' 


      it 'should support answering multiple questions at the same time' 

    end
  end

  describe 'PUT /quiz_submissions/:quiz_submission_id/questions/:id/flag [flag]' do
    before :each do
      course_with_student_logged_in(:active_all => true)
      @quiz = quiz_model(course: @course)
      @quiz_submission = @quiz.generate_submission(@student)
    end

    it 'should flag the question' 


    it "should prevent unauthorized flagging" 

  end

  describe 'PUT /quiz_submissions/:quiz_submission_id/questions/:id/unflag [unflag]' do
    before :each do
      course_with_student_logged_in(:active_all => true)
      @quiz = quiz_model(course: @course)
      @quiz_submission = @quiz.generate_submission(@student)
    end

    it 'should unflag the question' 


    it "should prevent unauthorized unflagging" 

  end
end

