#
# Copyright (C) 2018 - present Instructure, Inc.
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

require_relative '../spec_helper'
require_relative '../support/request_helper'

describe 'Access Different Gradebooks Environments', type: :request do
  before :once do
    course_with_teacher active_all: true
    @teacher_enrollment = @enrollment
    student_in_course active_all: true
    @student_enrollment = @enrollment
    @assignment = @course.assignments.create!(
      title: 'A Title', submission_types: 'online_url', grading_type: 'percent'
    )
  end

  describe 'GET #speed_grader' do
    before :each do
      user_session(@teacher)
    end

    describe 'js_env' do
      describe 'can_comment_on_submission' do
        it 'is false if the course is concluded' 


        it 'is false if the teacher enrollment is concluded' 


        it 'is true otherwise' 

      end

      describe 'show_help_menu_item' do
        it 'is false when the root account does not have a support URL configured' 


        it 'is true when the root account has a support URL configured' 

      end

      it 'includes the "Help" URL' 


      describe 'grading_role' do
        let(:js_env) do
          get speed_grader_course_gradebook_path(course_id: @course.id), params: {assignment_id: @assignment.id }
          js_env_from_response(response)
        end

        context 'for a moderated assignment with no grades published' do
          before(:once) do
            @assignment.update!(
              final_grader: @teacher,
              grader_count: 2,
              grades_published_at: nil,
              moderated_grading: true
            )
          end

          it 'is set to :moderator if the user can moderate the assignment' 


          it 'is set to :provisional_grader if the user cannot moderate the assignment' 

        end

        it 'is set to :grader for a moderated assignment whose grades have been published' 


        it 'is set to :grader for a non-moderated assignment' 

      end
    end
  end

  describe 'GET #grade_summary' do
    context 'when logged in as a student' do
      before :each do
        user_session(@student)
        @course_id = @course.id.to_s
      end

      describe 'js_env' do
        describe 'courses_with_grades' do
          it 'sets grading_period_set_id to null when the course has no grading periods' 


          it 'sets grading_period_set_id when the course has grading periods' 


          it 'sets grading_period_set_id when the course has legacy grading periods' 

        end
      end
    end
  end
end
