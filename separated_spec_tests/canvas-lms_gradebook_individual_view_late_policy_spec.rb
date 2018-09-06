#
# Copyright (C) 2017 - present Instructure, Inc.
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

require_relative '../pages/gradezilla_individual_view_page'
require_relative '../../helpers/gradezilla_common'

describe 'Late Policies:' do
  include_context "in-process server selenium tests"
  include GradezillaCommon

  include_context "late_policy_course_setup"

  before(:once) do
    # create course with students, assignments, submissions and grades
    init_course_with_students(1)
    create_course_late_policy
    create_assignments
    make_submissions
    grade_assignments
  end

  context "grade detail tray other" do
    before(:each) do
      user_session(@teacher)
      GradezillaIndividualViewPage.visit(@course.id)
    end

    it 'missing submission has missing pill' 


    it 'late submission has late pill' 


    it "late submission has late penalty" 


    it "late submission has final grade" 

  end
end

