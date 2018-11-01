#
# Copyright (C) 2015 - present Instructure, Inc.
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

require_relative '../../spec_helper'

describe Submissions::SubmissionForShow do
  subject { Submissions::SubmissionForShow.new(assignment_id: assignment.id, context: course, id: student.id) }

  let(:course) do
    course_with_student
    @course
  end

  let(:student) do
    course
    @student
  end

  let(:assignment) { course.assignments.create! }
  let(:submission) do
    Timecop.freeze(2.hours.ago) do
      assignment.submit_homework(student, { body: 'hello' })
    end
  end

  describe '#assignment' do
    it 'returns assignment found with provided assignment_id' 

  end

  describe '#user' do
    it 'returns user found with provided id' 

  end

  describe '#submission' do
    it 'instantiates a new submission when one is not present' 


    context 'when submission exists' do
      before :once do
        submission_model({
          assignment: assignment,
          body: 'here my assignment',
          submission_type: 'online_text_entry',
          user: student
        })
        submission.submitted_at = 3.hours.ago
        submission.save!
      end

      it 'returns existing submission when present' 


      context 'when version & preview params are provided' do
        subject do
          Submissions::SubmissionForShow.new(
            assignment_id: assignment.id,
            context: course,
            id: student.id,
            preview: true,
            version: 0
          )
        end

        it 'returns version from submission history' 


        context 'when assignment is a quiz' do
          it 'ignores version params' 

        end
      end
    end
  end
end

