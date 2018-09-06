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
require_dependency "lti/membership_service/course_group_collator"

module Lti::MembershipService
  describe CourseGroupCollator do
    context 'course with lots of groups' do
      before(:once) do
        course_with_teacher
        @group_category = @course.group_categories.create!(name: 'Membership')

        (0..100).each do |n|
          @course.groups.create!(name: "Group #{n}", group_category: @group_category)
        end
      end

      describe '#initialize' do
        it 'sets sane defaults when no options are set' 


        it 'handles negative values for :page option' 


        it 'handles negative values for :per_page option' 


        it 'handles values for :per_page option that exceed per page max' 


        it 'generates a list of IMS::LTI::Models::Membership objects' 

      end

      describe '#context' do
        it 'returns a course for the context' 

      end

      context 'pagination' do
        describe '#memberships' do
          it 'returns the number of memberships specified by the per_page params' 

        end

        describe '#next_page?' do
          it 'returns true when there is an additional page of results' 


          it 'returns false when there are no more pages' 

        end
      end
    end
  end
end

