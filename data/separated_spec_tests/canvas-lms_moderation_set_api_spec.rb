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
  before :once do
    course_with_teacher active_all: true
    sec1 = @course.course_sections.create!(:name => "section 1")
    sec2 = @course.course_sections.create!(:name => "section 2")
    @assignment = @course.assignments.create! name: "asdf"
    @assignment.update_attribute :moderated_grading, true
    @student1, @student2, @student3 = n_students_in_course(3, course: @course)
    @course.enroll_student(@student1, :section => sec1, :allow_multiple_enrollments => true)
    @course.enroll_student(@student2, :section => sec1, :allow_multiple_enrollments => true)
    @course.enroll_student(@student3, :section => sec1, :allow_multiple_enrollments => true)
    @course.enroll_student(@student3, :section => sec2, :allow_multiple_enrollments => true)
    @user = @teacher
    @assignment.moderated_grading_selections.create! student: @student1
  end

  before :each do
    user_session @teacher
  end

  describe '#index' do
    it 'returns moderated_grading_selections' 


    it 'requires moderate_grades permissions' 

  end

  describe 'POST create' do
    context 'when no student_ids are passed in' do
      before(:each) do
        @parsed_json = api_call :post,
          "/api/v1/courses/#{@course.id}/assignments/#{@assignment.id}/moderated_students",
          {controller: 'moderation_set', action: 'create',
            format: 'json', course_id: @course.id, assignment_id: @assignment.id}, {}, {}
      end

      it 'responds with a bad request' 


      it 'responds with an empty list' 

    end

    it "creates student selections" 


    it "doesn't make duplicate selections" 


    it "creates a single selection for students in multiple sections" 


    it 'requires moderate_grades permissions' 

  end
end

