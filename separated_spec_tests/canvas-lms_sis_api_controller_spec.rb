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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SisApiController do
  describe "GET sis_assignments" do
    let(:account) {account_model}
    let(:course) {course_model(account: account, workflow_state: 'available')}
    let(:admin) {account_admin_user(account: account)}

    before do
      bypass_rescue
      user_session(admin)
    end

    it 'responds with 400 when sis_assignments is disabled' 


    context 'with bulk_sis_grade_export enabled' do
      before do
        account.enable_feature!(:bulk_sis_grade_export)
      end

      it 'responds with 200' 


      it 'includes only assignments with post_to_sis enabled' 


      context 'with student overrides' do
        let(:assignment) {assignment_model(course: course, post_to_sis: true, workflow_state: 'published')}

        before do
          @student1 = student_in_course({:course => course, :workflow_state => 'active'}).user
          @student2 = student_in_course({:course => course, :workflow_state => 'active'}).user
          managed_pseudonym(@student2, sis_user_id: 'SIS_ID_2')
          due_at = Time.zone.parse('2017-02-08 22:11:10')
          @override = create_adhoc_override_for_assignment(assignment, [@student1, @student2], due_at: due_at)
        end

        it 'does not include student overrides by default' 


        it 'does includes student override data by including student_overrides' 

      end
    end
  end
end


