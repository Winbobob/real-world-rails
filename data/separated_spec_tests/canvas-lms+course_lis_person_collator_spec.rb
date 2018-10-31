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
require_dependency "lti/membership_service/course_lis_person_collator"

module Lti::MembershipService
  describe CourseLisPersonCollator do
    context 'course with teacher' do
      before(:each) do
        course_with_teacher
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
    end
  end

  context 'course with user that has many enrollments' do
    before(:each) do
      course_with_teacher
      @course.enroll_user(@teacher, 'TaEnrollment', enrollment_state: 'active')
      @course.enroll_user(@teacher, 'DesignerEnrollment', enrollment_state: 'active')
      @course.enroll_user(@teacher, 'StudentEnrollment', enrollment_state: 'active')
      @course.enroll_user(@teacher, 'TeacherEnrollment', enrollment_state: 'active')
      @course.enroll_user(@teacher, 'ObserverEnrollment', enrollment_state: 'active')
    end

    describe '#membership' do
      it 'properly outputs multiple membership roles for membership' 


      it 'excludes membership roles for non-active enrollments' 

    end
  end

  context 'course with multiple users' do
    before(:each) do
      course_with_teacher
      @course.enroll_user(@teacher, 'TeacherEnrollment', enrollment_state: 'active')
      @ta = user_model
      @course.enroll_user(@ta, 'TaEnrollment', enrollment_state: 'active')
      @designer = user_model
      @course.enroll_user(@designer, 'DesignerEnrollment', enrollment_state: 'active')
      @student = user_model
      @course.enroll_user(@student, 'StudentEnrollment', enrollment_state: 'active')
      @observer = user_model
      @course.enroll_user(@observer, 'ObserverEnrollment', enrollment_state: 'active')
    end

    describe '#membership' do
      it 'outputs the users in a course with their respective roles' 

    end
  end

  context 'pagination' do
    before(:each) do
      course_with_teacher
      @course.enroll_user(@teacher, 'TeacherEnrollment', enrollment_state: 'active')
      @ta = user_model
      @course.enroll_user(@ta, 'TaEnrollment', enrollment_state: 'active')
      @designer = user_model
      @course.enroll_user(@designer, 'DesignerEnrollment', enrollment_state: 'active')
      @student = user_model
      @course.enroll_user(@student, 'StudentEnrollment', enrollment_state: 'active')
      @observer = user_model
      @course.enroll_user(@observer, 'ObserverEnrollment', enrollment_state: 'active')
      allow(Api).to receive(:per_page).and_return(1)
    end

    context 'OAuth 1' do
      subject do
        collator_one.memberships.map(&:member).map(&:user_id) +
        collator_two.memberships.map(&:member).map(&:user_id) +
        collator_three.memberships.map(&:member).map(&:user_id)
      end

      let(:collator_one) { CourseLisPersonCollator.new(@course, @teacher, per_page: 2, page: 1) }
      let(:collator_two) { CourseLisPersonCollator.new(@course, @teacher, per_page: 2, page: 2) }
      let(:collator_three) { CourseLisPersonCollator.new(@course, @teacher, per_page: 2, page: 3) }

      it 'does not render duplicate items when paginating' 


      it 'paginates the entire collection' 

    end

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

