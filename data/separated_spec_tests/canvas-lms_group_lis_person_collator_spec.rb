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
require_dependency "lti/membership_service/group_lis_person_collator"

module Lti::MembershipService
  describe GroupLisPersonCollator do
    context 'group with many students' do
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

        @group.leader = @student1
        @group.save!
      end

      describe '#context' do
        it 'returns the correct context' 

      end

      describe '#membership' do
        it 'outputs the membership in a group' 

      end

      context 'pagination' do
        describe '#memberships' do
          it 'returns the number of memberships specified by the per_page params' 


          it 'returns the right page of memberships based on the page param' 

        end

        describe '#next_page?' do
          it 'returns true when there is an additional page of results' 


          it 'returns false when there are no more pages' 

        end
      end
    end
  end
end

