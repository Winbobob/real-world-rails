#
# Copyright (C) 2016 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper')
require_dependency "lti/membership_service/page_presenter"

module Lti::MembershipService
  describe PagePresenter do

    let(:base_url) { 'https://localhost:3000' }
    let(:presenter) { PagePresenter.new(@course, @teacher, base_url) }
    let(:hash) { presenter.as_json }
    let(:group_presenter) { PagePresenter.new(@group, @student, base_url) }
    let(:group_hash) { group_presenter.as_json }

    context 'course with single enrollment' do
      before(:each) do
        course_with_teacher
      end

      describe '#as_json' do
        it 'outputs the expected data in the expected format at the top level' 


        it 'outputs the expected data in the expected format at the container level' 


        it 'outputs the expected data in the expected format at the context level' 


        it 'outputs the expected data in the expected format at the membership level' 

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

      describe '#as_json' do
        it 'outputs the expected data in the expected format at the top level' 


        it 'outputs the expected data in the expected format at the container level' 


        it 'outputs the expected data in the expected format at the context level' 


        it 'outputs the expected data in the expected format at the membership level' 

      end
    end

    context 'course with multiple enrollments' do
      before(:each) do
        course_with_teacher(:active_course => true)
        @course.enroll_user(@teacher, 'TeacherEnrollment', enrollment_state: 'active')
        @ta = user_model
        @course.enroll_user(@ta, 'TaEnrollment', enrollment_state: 'active')
        @student = user_model
        @course.enroll_user(@student, 'StudentEnrollment', enrollment_state: 'active')
      end

      describe '#as_json' do
        it 'provides the right next_page url when no page/per_page/role params are given' 


        it 'provides the right next_page url when page/per_page/role params are given' 


        it 'returns nil for the next page url when the last page in the collection was requested' 

      end
    end
  end
end

