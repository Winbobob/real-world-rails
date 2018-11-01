#
# Copyright (C) 2011 - present Instructure, Inc.
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
require_dependency "lti/membership_service/membership_collator_factory"

module Lti::MembershipService
  describe MembershipCollatorFactory do
    before(:each) do
      course_with_teacher
      group_model
    end

    describe '.collator_instance' do
      it 'returns a CourseLisPersonCollator instance by default when the context is a Course' 


      it 'returns a CourseGroupCollator instance when group role is supplied and context is a Course' 


      it 'returns a GroupLisPersonCollator instance by default when the context is a Group' 

    end
  end
end

