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
require File.expand_path(File.dirname(__FILE__) + '/../../../models/quizzes/quiz_statistics/item_analysis/common')

describe Quizzes::QuizReportsController, type: :request do

  describe "GET /courses/:course_id/quizzes/:quiz_id/reports [index]" do
    def api_index(params={}, options={})
      method = options[:raw] ? :raw_api_call : :api_call
      headers = options[:jsonapi] ? { 'Accept' => 'application/vnd.api+json' } : {}
      send method, :get,
        "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/reports", {
          controller: "quizzes/quiz_reports",
          action: "index",
          format: "json",
          course_id: @course.id.to_s,
          quiz_id: @quiz.id.to_s
        }, params, headers
    end

    it 'denies unprivileged access' 


    context 'with privileged access' do
      before :once do
        teacher_in_course(:active_all => true)
        @quiz = @course.quizzes.create({ title: 'Test Quiz' })
      end

      it 'returns all reports, generated or not' 


      describe 'the `includes_all_versions` flag' do
        it 'enables it' 


        it 'defaults to false' 

      end

      context 'JSON-API' do
        it 'returns all reports, generated or not' 

      end
    end
  end

  describe "POST /courses/:course_id/quizzes/:quiz_id/reports" do
    def api_create(params={}, options={})
      method = options[:raw] ? :raw_api_call : :api_call
      headers = options[:jsonapi] ? { 'Accept' => 'application/vnd.api+json' } : {}
      send method, :post,
        "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/reports", {
          controller: "quizzes/quiz_reports",
          action: "create",
          format: "json",
          course_id: @course.id.to_s,
          quiz_id: @quiz.id.to_s
        }, params, headers
    end

    before :once do
      teacher_in_course(:active_all => true)
      @me = @user
      simple_quiz_with_submissions %w{T T T}, %w{T T T}, %w{T F F}, %w{T F T}, :user => @user, :course => @course
      @user = @me
    end

    it "should create a new report" 


    it "should reuse an existing report" 


    context 'JSON-API' do
      it "should create a new report" 

    end

    context 're-generation' do
      JOB_TAG = Quizzes::QuizStatistics.csv_job_tag
      let(:report_type) { 'student_analysis' }

      it "should work when a job had failed previously" 


      it "should return 409 when report is being/already generated" 

    end
  end

  describe "DELETE /courses/:course_id/quizzes/:quiz_id/reports/:id [#abort]" do
    before :once do
      teacher_in_course(:active_all => true)

      simple_quiz_with_submissions %w{T T T}, %w{T T T}, %w{T F F}, %w{T F T}, {
        user: @teacher,
        course: @course
      }
    end

    let(:report) { @quiz.current_statistics_for("student_analysis") }

    def api_abort
      raw_api_call(
        :delete,
        "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/reports/#{report.id}", {
          controller: "quizzes/quiz_reports",
          action: "abort",
          format: "json",
          course_id: @course.id.to_s,
          quiz_id: @quiz.id.to_s,
          id: report.id.to_s
        }, {}, {
          'Accept' => 'application/vnd.api+json'
        }
      )
    end

    it 'denies unprivileged access' 


    it 'works when the report is already generated' 


    it 'works when the report is queued for generation' 


    it 'works when the report failed to generate' 


    it 'does not work when the report is being generated' 

  end

  describe "GET /courses/:course_id/quizzes/:quiz_id/reports/:id [show]" do
    def api_show(params={}, options={})
      method = options[:raw] ? :raw_api_call : :api_call
      headers = options[:jsonapi] ? {'Accept' => 'application/vnd.api+json'} : {}
      send method, :get,
        "/api/v1/courses/#{@course.id}/quizzes/#{@quiz.id}/reports/#{@report.id}", {
          controller: "quizzes/quiz_reports",
          action: "show",
          format: "json",
          course_id: @course.id.to_s,
          quiz_id: @quiz.id.to_s,
          id: @report.id.to_s
        }, params, headers
    end

    it 'denies unprivileged access' 


    context 'with privileged access' do
      before :once do
        teacher_in_course(:active_all => true)
        @quiz = @course.quizzes.create({ title: 'Test Quiz' })
        @report = @quiz.current_statistics_for('student_analysis')
      end

      it 'shows the report' 


      it 'embeds its attachment automatically in JSON format' 


      context 'JSON-API' do
        it 'renders' 


        it 'embeds its attachment with ?include=file' 


        it 'embeds its progress with ?include=progress' 

      end
    end # context 'with privileged access'
  end # API show
end

