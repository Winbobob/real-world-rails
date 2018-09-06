#
# Copyright (C) 2012 - present Instructure, Inc.
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
require_dependency "lti/membership_service_controller"

module Lti
  describe MembershipServiceController do
    context 'lti tool access', type: :request do
      before(:each) do
        course_with_teacher
        @course.offer!
        @tool = external_tool_model(context: @course)
        @tool.allow_membership_service_access = true
        @tool.save!
      end

      it 'returns the members' 


      it 'returns unauthorized if the tool is not found' 


      it 'returns unauthorized if the tool does not have access to the api' 


      it 'returns unauthorized if the membership service access feature flag is disabled' 

    end

    context 'user not enrolled in course' do
      before(:each) do
        course_model
        user_model
        pseudonym(@user)
        @user.save!
        token = @user.access_tokens.create!(purpose: 'test').full_token
        @request.headers['Authorization'] = "Bearer #{token}"
      end

      describe '#course_index' do
        it 'returns 401 if user is not part of course' 

      end
    end

    context 'course with single enrollment' do
      before(:each) do
        course_with_teacher
        @course.offer!
      end

      describe "#course_index" do
        context 'without access token' do
          it 'requires a user' 

        end

        context 'with access token' do
          before(:each) do
            pseudonym(@teacher)
            @teacher.save!
            token = @teacher.access_tokens.create!(purpose: 'test').full_token
            @request.headers['Authorization'] = "Bearer #{token}"
          end

          it 'outputs the expected data in the expected format at the top level' 


          it 'outputs the expected data in the expected format at the container level' 


          it 'outputs the expected data in the expected format at the context level' 


          it 'outputs the expected data in the expected format at the membership level' 


          context 'course with a group' do
            before(:each) do
              @group_category = @course.group_categories.create!(name: 'Membership')
              @group = @course.groups.create!(name: "Group", group_category: @group_category)
            end

            it 'outputs the expected data in the expected format at the membership level' 

          end
        end
      end
    end

    context 'course with multiple enrollments' do
      before(:each) do
        course_with_teacher
        @course.enroll_user(@teacher, 'TeacherEnrollment', enrollment_state: 'active')
        @ta = user_model
        @course.enroll_user(@ta, 'TaEnrollment', enrollment_state: 'active')
        @student = user_model
        @course.enroll_user(@student, 'StudentEnrollment', enrollment_state: 'active')

        pseudonym(@teacher)
        @teacher.save!
        token = @teacher.access_tokens.create!(purpose: 'test').full_token
        @request.headers['Authorization'] = "Bearer #{token}"
      end

      describe '#as_json' do
        it 'provides the right next_page url when no page/per_page/role params are given' 


        it 'provides the right next_page url when page/per_page/role params are given' 


        it 'returns nil for the next page url when the last page in the collection was requested' 

      end
    end

    context 'user not in course group' do
      before(:each) do
        course_with_teacher
        @course.offer!
        user_model
        @course.enroll_user(@user, 'StudentEnrollment', enrollment_state: 'active')
        @group_category = @course.group_categories.create!(name: 'Membership')
        @group = @course.groups.create!(name: 'Group 1', group_category: @group_category)
        pseudonym(@user)
        @user.save!
        token = @user.access_tokens.create!(purpose: 'test').full_token
        @request.headers['Authorization'] = "Bearer #{token}"
      end

      describe '#group_index' do
        it 'returns 401 if user is not part of group' 

      end
    end

    context 'user not in account group' do
      before(:each) do
        user_model
        group_model
        pseudonym(@user)
        @user.save!
        token = @user.access_tokens.create!(purpose: 'test').full_token
        @request.headers['Authorization'] = "Bearer #{token}"
      end

      describe '#group_index' do
        it 'returns 401 if user is not part of group' 

      end
    end

    context 'group with single student' do
      before(:each) do
        course_with_teacher
        @course.offer!
        @student = user_model
        @course.enroll_user(@student, 'StudentEnrollment', enrollment_state: 'active')
        @group_category = @course.group_categories.create!(name: 'Membership')
        @group = @course.groups.create!(name: 'Group 1', group_category: @group_category)
        @group.add_user(@student)
      end

      describe "#group_index" do
        context 'without access token' do
          it 'requires a user' 

        end

        context 'with access token' do
          before(:each) do
            pseudonym(@student)
            @student.save!
            token = @student.access_tokens.create!(purpose: 'test').full_token
            @request.headers['Authorization'] = "Bearer #{token}"
          end

          it 'outputs the expected data in the expected format at the top level' 


          it 'outputs the expected data in the expected format at the container level' 


          it 'outputs the expected data in the expected format at the context level' 


          it 'outputs the expected data in the expected format at the membership level' 

        end
      end
    end

    context 'group with multiple students' do
      before(:each) do
        course_with_teacher
        @course.offer!
        @student1 = user_model
        @course.enroll_user(@student1, 'StudentEnrollment', enrollment_state: 'active')
        @student2 = user_model
        @course.enroll_user(@student2, 'StudentEnrollment', enrollment_state: 'active')
        @student3 = user_model
        @course.enroll_user(@student3, 'StudentEnrollment', enrollment_state: 'active')

        @group_category = @course.group_categories.create!(name: 'Membership')
        @group = @course.groups.create!(name: 'Group 1', group_category: @group_category)
        @group.add_user(@student1)
        @group.add_user(@student2)
        @group.add_user(@student3)

        pseudonym(@student1)
        @student1.save!
        token = @student1.access_tokens.create!(purpose: 'test').full_token
        @request.headers['Authorization'] = "Bearer #{token}"
      end

      describe '#as_json' do
        it 'provides the right next_page url when no page/per_page/role params are given' 


        it 'provides the right next_page url when page/per_page/role params are given' 


        it 'returns nil for the next page url when the last page in the collection was requested' 

      end
    end
  end
end

