#
# Copyright (C) 2018 - present Instructure, Inc.
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

require_relative '../../helpers/gradebook_common'

describe "gradebook - originality reports" do
  include_context "in-process server selenium tests"
  include GradebookCommon

  before(:once) { gradebook_data_setup }
  before(:each) { user_session(@teacher) }

  it "should show originality data" 


  context 'group assignment' do
    let(:course) { @first_assignment.course }
    let!(:group) do
      group = course.groups.create!(name: 'group one')
      group.add_user(@student_1)
      group.add_user(@student_2)
      submission_one.update!(group: group)
      submission_two.update!(group: group)
      group
    end
    let(:submission_one) do
      @first_assignment.submit_homework(@student_1, submission_type: 'online_text_entry', body: 'asdf')
    end
    let(:submission_two) do
      @first_assignment.submit_homework(@student_2, submission_type: 'online_text_entry', body: 'asdf')
    end
    let(:originality_report) { submission_one.originality_reports.create!(originality_score: 1.0) }

    before { originality_report.copy_to_group_submissions! }

    it 'should show originality data for all submissions in a group' 


    it 'shows the correct originality score for the first student' 


    it 'shows the correct originality score for the last student' 

  end
end

