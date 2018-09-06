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

require_relative '../../common'
require_relative '../pages/mgp_page'

describe "grading periods account page" do
  include_context "in-process server selenium tests"

  context 'with grading periods' do
    let(:grading_standards_page) { GradingStandards::MultipleGradingPeriods.new }
    let(:backend_group_helper) { Factories::GradingPeriodGroupHelper.new }
    let(:backend_period_helper) { Factories::GradingPeriodHelper.new }

    before do
      admin_logged_in
    end

    it "adds grading period set", test_id: 2528622, priority: "1" 


    it "enable wieghted grading on grading period set", test_id: 3035964, priority: "1" 


    it "enable show total column on grading period set", test_id: 3104470, priority: "1" 


    it "deletes grading period set", test_id: 2528621, priority: "1" 


    it "edits grading period set", test_id: 2528628, priority: "1" 


    it "adds grading period", test_id: 2528648, priority: "1" 


    it "edits grading period", test_id: 2528655, priority: "1" 


    it "deletes grading period", test_id: 2528647, priority: "1" 


    it "defaults close date to end date", test_id: 2887215, priority: "1" 


    context "with populated data" do
      group_name_1 = "Group 1"
      group_name_2 = "Group 2"
      term_name_1 = "First Term"
      term_name_2 = "Second Term"
      period_name_1 = "A Grading Period"
      period_name_2 = "Another Grading Period"

      before(:each) do
        group1 = backend_group_helper.create_for_account_with_term(Account.default, term_name_1, group_name_1)
        group2 = backend_group_helper.create_for_account_with_term(Account.default, term_name_2, group_name_2)
        backend_period_helper.create_for_group(group1, title: period_name_1)
        backend_period_helper.create_for_group(group2, title: period_name_2)

        grading_standards_page.visit(Account.default.id)
      end

      it "term dropdown filters grading period sets", test_id: 2528643, priority: "1" 


      it "search grading periods", test_id: 2528642, priority: "1" 

    end
  end
end


