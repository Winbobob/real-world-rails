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

describe LiveAssessments::AssessmentsController, type: :request do
  let_once(:assessment_course) { course_factory(active_all: true) }
  let_once(:teacher) { assessment_course.teachers.first }
  let_once(:student) { course_with_student(course: assessment_course).user }
  let_once(:outcome) do
    outcome = assessment_course.created_learning_outcomes.create!(:description => 'this is a test outcome', :short_description => 'test outcome')
    assessment_course.root_outcome_group.add_outcome(outcome)
    assessment_course.root_outcome_group.save!
    assessment_course.reload
    outcome
  end
  let_once(:unrelated_outcome) {course_with_teacher.course.created_learning_outcomes.create!(description: 'this outcome is in a different course', short_description: 'unrelated outcome')}
  let(:assessment_hash) {{key: '2014-05-28-Outcome-52', title: 'a test assessment'}}

  describe 'POST create' do
    def create_assessments(params, opts={})
      api_call_as_user(opts[:user] || teacher,
                       :post,
                       "/api/v1/courses/#{assessment_course.id}/live_assessments",
                       { controller: 'live_assessments/assessments', action: 'create', format: 'json', course_id: assessment_course.id.to_s },
                       { assessments: params }, {}, opts)
    end

    context "as a teacher" do
      it "creates an assessment" 


      it "aligns an assessment when given an outcome" 


      it "won't align an unrelated outcome" 


      it 'returns an existing assessment with the same key' 

    end

    context "as a student" do
      it "is unauthorized" 

    end
  end

  describe 'GET index' do
    def index_assessments(opts={})
      api_call_as_user(opts[:user] || teacher,
                       :get,
                       "/api/v1/courses/#{assessment_course.id}/live_assessments",
                       { controller: 'live_assessments/assessments', action: 'index', format: 'json', course_id: assessment_course.id.to_s },
                       {}, {}, opts)
    end

    context 'as a teacher' do
      it 'returns all the assessments for the context' 

    end

    context 'as a student' do
      it 'is unauthorized' 

    end
  end
end

