#
# Copyright (C) 2014 - present Instructure, Inc.
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

require_relative '../../common'
require_relative '../../helpers/gradebook_common'

describe GradeSummaryPresenter do
  include_context 'in-process server selenium tests'
  include_context 'reusable_gradebook_course'

  describe 'deleted submissions', priority: "2" do
    it 'should navigate to grade summary page' 

  end

  describe "grade summary page" do
    before(:each) do
      enroll_teacher_and_students
    end

    let(:observed_courses) do
      2.times.map { course_factory(active_course: true, active_all: true) }
    end
    let(:active_element) { driver.execute_script('return document.activeElement') }

    it 'shows the courses dropdown when logged in as observer' 


    it 'maintains focus on show what-if/revert to original buttons', priority: 2, test_id: 229660 do
      student_submission.student_entered_score = 8
      student_submission.save!

      user_session(student)
      get "/courses/#{test_course.id}/grades"

      f('#student-grades-whatif button').click
      expect(active_element).to have_attribute('id', 'revert-all-to-actual-score')

      f('#revert-all-to-actual-score').click
      expect(active_element).to have_class('btn revert_all_scores_link')
    end
  end
end

