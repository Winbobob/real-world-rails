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

require_relative '../../common'
require_relative '../pages/gradebook_page'
require_relative '../setup/gradebook_setup'

describe "gradebook with grading periods" do
  include_context "in-process server selenium tests"
  include GradebookSetup

  context 'with close and end dates' do
    now = Time.zone.now

    before(:once) do
      term_name = "First Term"
      create_grading_periods(term_name, now)
      add_teacher_and_student
      associate_course_to_term(term_name)
    end

    context 'as a teacher' do
      before(:each) do
        user_session(@teacher)
      end

      it 'assignment in ended grading period should be gradable', test_id: 2947119, priority: "1" 

    end

    context 'as an admin' do
      before(:each) do
        account_admin_user(account: Account.site_admin)
        user_session(@admin)
      end

      it 'assignment in closed grading period should be gradable', test_id: 2947126, priority: "1" 

    end

    it 'assignment in closed gp should not be gradable', test_id: 2947118, priority: "1" 

  end
end

