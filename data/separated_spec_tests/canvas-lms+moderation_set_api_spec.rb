#
# Copyright (C) 2011 - 2012 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the
# Free Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public
# License for more details.
#
# You should have received a copy of the GNU Affero General Public
# License along with this program. If not, see
# <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')

describe 'Moderated Grades API', type: :request do
  shared_examples 'assignment moderation permissions' do
    it 'is unauthorized when the user is neither the final grader nor an admin' 


    it 'is authorized when the user is the final grader' 


    it 'is authorized when the user is an admin with the "select final grade" permission' 


    it 'is unauthorized when the user is an admin without the "select final grade" permission' 

  end

  before :once do
    course_with_teacher active_all: true
    sec1 = @course.course_sections.create!(:name => "section 1")
    sec2 = @course.course_sections.create!(:name => "section 2")
    @assignment = @course.assignments.create! name: "asdf"
    @assignment.update_attribute :moderated_grading, true
    @assignment.update_attribute :grader_count, 1
    @student1, @student2, @student3 = n_students_in_course(3, course: @course)
    @course.enroll_student(@student1, :section => sec1, :allow_multiple_enrollments => true)
    @course.enroll_student(@student2, :section => sec1, :allow_multiple_enrollments => true)
    @course.enroll_student(@student3, :section => sec1, :allow_multiple_enrollments => true)
    @course.enroll_student(@student3, :section => sec2, :allow_multiple_enrollments => true)
    @user = @teacher
  end

  describe '#index' do
    let(:index_params) do
      {
        controller: 'moderation_set',
        action: 'index',
        format: 'json',
        course_id: @course.id,
        assignment_id: @assignment.id
      }
    end

    let(:index_url) { "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/moderated_students" }

    it 'returns moderated_grading_selections' 


    it_behaves_like 'assignment moderation permissions' do
      let(:api_body_params) { {} }
      let(:api_method) { :get }
      let(:api_params) { index_params }
      let(:api_url) { index_url }
    end
  end

  describe 'POST create' do
    let(:create_params) do
      {
        controller: 'moderation_set',
        action: 'create',
        format: 'json',
        course_id: @course.id,
        assignment_id: @assignment.id
      }
    end

    let(:create_url) { "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/moderated_students" }

    context 'when no student_ids are passed in' do
      before(:each) do
        @assignment.update!(final_grader: @teacher)
        user_session @teacher
        @parsed_json = api_call(:post, create_url, create_params, {}, {})
      end

      it 'responds with a bad request' 


      it 'responds with an empty list' 

    end

    it "creates student selections" 


    it "doesn't make duplicate selections" 


    it "creates a single selection for students in multiple sections" 


    it_behaves_like 'assignment moderation permissions' do
      let(:api_body_params) { { student_ids: [@student1.id, @student2.id] } }
      let(:api_method) { :post }
      let(:api_params) { create_params }
      let(:api_url) { create_url }
    end
  end
end

