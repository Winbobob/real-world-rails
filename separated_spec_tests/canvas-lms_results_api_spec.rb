#
# Copyright (C) 2014 Instructure, Inc.
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

describe LiveAssessments::ResultsController, type: :request do
  let_once(:assessment_course) { course_factory(active_all: true) }
  let_once(:teacher) { assessment_course.teachers.first }
  let_once(:student) { course_with_student(course: assessment_course).user }
  let_once(:another_student) { course_with_student(course: assessment_course).user }
  let_once(:outcome) do
    outcome = assessment_course.created_learning_outcomes.create!(:description => 'this is a test outcome', :short_description => 'test outcome')
    assessment_course.root_outcome_group.add_outcome(outcome)
    assessment_course.root_outcome_group.save!
    assessment_course.reload
    outcome
  end
  let_once(:assessment) do
    assessment = LiveAssessments::Assessment.create!(context: assessment_course, key: '2014-05-28-Outcome-1', title: 'an assessment')
    outcome.align(assessment, assessment_course, mastery_type: 'none', mastery_score: 0.6)
    assessment
  end

  let(:assessed_at) { Time.now - 1.day }
  def result_hashes
    [student, another_student].map do |s|
      {passed: true, assessed_at: assessed_at, links: {user: s.id}}
    end
  end

  describe 'POST create' do
    def create_results(params, opts={})
      api_call_as_user(opts[:user] || teacher,
                       :post,
                       "/api/v1/courses/#{assessment_course.id}/live_assessments/#{assessment.id}/results",
                       { controller: 'live_assessments/results', action: 'create', format: 'json', course_id: assessment_course.id.to_s, assessment_id: assessment.id.to_s },
                       { results: params }, {}, opts)
    end

    context "as a teacher" do
      it "creates results" 


      it 'generates submissions' 


      it 'requires user to be in the context' 

    end

    context "as a student" do
      it "is unauthorized" 

    end
  end

  describe 'GET index' do
    def index_results(params, opts={})
      api_call_as_user(opts[:user] || teacher,
                       :get,
                       "/api/v1/courses/#{assessment_course.id}/live_assessments/#{assessment.id}/results",
                       { controller: 'live_assessments/results', action: 'index', format: 'json', course_id: assessment_course.id.to_s, assessment_id: assessment.id.to_s },
                       params, {}, opts)
    end

    context 'as a teacher' do
      it 'returns all the results for the assessment' 


      it 'filters the results by user' 

    end

    context 'as a student' do
      it 'is unauthorized' 

    end
  end
end

