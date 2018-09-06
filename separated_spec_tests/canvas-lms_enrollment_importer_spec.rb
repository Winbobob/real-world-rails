#
# Copyright (C) 2013 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')
require_dependency "sis/enrollment_importer"

module SIS
  describe EnrollmentImporter do
    let(:user_id) { "5235536377654" }
    let(:course_id) { "82433211" }
    let(:section_id) { "299981672" }

    let(:enrollment) do
      SIS::Models::Enrollment.new(
        course_id: course_id,
        section_id: section_id,
        user_id: user_id,
        role: 'student',
        status: 'active',
        start_date: Time.zone.today,
        end_date: Time.zone.today
      )
    end

    context 'gives a meaningful error message when a user does not exist for an enrollment' do
      let(:messages) { [] }

      before do
        EnrollmentImporter.new(Account.default, {batch: Account.default.sis_batches.create!}).process(messages) do |importer|
          importer.add_enrollment(enrollment)
        end
      end

      it { expect(messages.first.message).to include("User not found for enrollment") }
      it { expect(messages.first.message).to include("User ID: #{user_id}") }
      it { expect(messages.first.message).to include("Course ID: #{course_id}") }
      it { expect(messages.first.message).to include("Section ID: #{section_id}") }
    end

    context 'with a valid user ID but invalid course and section IDs' do
      before(:once) do
        @messages = []
        @student = user_with_pseudonym
        @student.save!
        @pseudonym = @student.pseudonyms.last
        @pseudonym.sis_user_id = @student.id
        @pseudonym.save!
        Account.default.pseudonyms << @pseudonym
        EnrollmentImporter.new(Account.default, {batch: Account.default.sis_batches.create!}).process(@messages) do |importer|
          an_enrollment = SIS::Models::Enrollment.new(
            course_id: 1,
            section_id: 2,
            user_id: @student.pseudonyms.last.user_id,
            role: 'student',
            status: 'active',
            start_date: Time.zone.today,
            end_date: Time.zone.today
          )
          importer.add_enrollment(an_enrollment)
        end
      end

      it 'alerts user of nonexistent course/section for user enrollment' 


      it 'provides a course ID for the offending row' 


      it 'provides a section ID for the offending row' 


      it 'provides a user ID for the offending row' 

    end

    it 'should skip touching courses' 


  end
end

