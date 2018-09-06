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

require 'spec_helper'

describe DataFixup::MoveSubAccountGradingPeriodsToCourses do
  let(:group_helper)   { Factories::GradingPeriodGroupHelper.new }
  let(:period_helper)  { Factories::GradingPeriodHelper.new }
  let(:run_data_fixup) { DataFixup::MoveSubAccountGradingPeriodsToCourses.run }

  let(:root_account_groups) { GradingPeriodGroup.where(account_id: @root_account.id) }
  let(:root_account_periods) do
    GradingPeriod.where(grading_period_group_id: root_account_groups.select(:id))
  end
  let(:sub_account_groups) { GradingPeriodGroup.where(account_id: @sub_account.id) }
  let(:sub_account_periods) do
    GradingPeriod.where(grading_period_group_id: sub_account_groups.select(:id))
  end
  let(:sub_sub_account_groups) { GradingPeriodGroup.where(account_id: @sub_account_of_sub_account.id) }
  let(:sub_sub_account_periods) do
    GradingPeriod.where(grading_period_group_id: sub_sub_account_groups.select(:id))
  end

  let(:legacy_group_for_sub_account) do
    -> (sub_account) {
      group = sub_account.grading_period_groups.build(group_helper.valid_attributes)
      group.save(validate: false)
      group
    }
  end

  before(:each) do
    @root_account = Account.create(name: 'new account')
    @sub_account = @root_account.sub_accounts.create!
  end

  describe "accounts" do
    context "root accounts" do
      before(:each) do
        group = group_helper.create_for_account(@root_account)
        period_helper.create_with_weeks_for_group(group, 4, -4)
        run_data_fixup
      end

      it "does not delete grading period groups" 


      it "does not delete grading periods" 

    end

    context "sub accounts" do
      before(:each) do
        group = legacy_group_for_sub_account.call(@sub_account)
        period_helper.create_with_weeks_for_group(group, 4, -4)
        run_data_fixup
      end

      it "soft deletes grading period groups" 


      it "soft deletes grading periods" 

    end
  end

  describe "sub-account courses" do
    before(:each) do
      @sub_account_of_sub_account = @sub_account.sub_accounts.create!
      @course = @sub_account_of_sub_account.courses.create!
    end

    context " with grading periods" do
      before(:each) do
        group = group_helper.legacy_create_for_course(@course)
        period_helper.create_presets_for_group(group, :past, :current, :future)
        @periods_before_fixup = @course.grading_periods.to_a
      end

      context "no accounts (root or sub) have grading periods" do
        it "does not have its grading periods altered in any way" 

      end

      context "root and sub accounts have grading periods" do
        it "does not have its grading periods altered in any way" 

      end

      context "sub accounts have grading periods, root account does not" do
        it "does not have its grading periods altered in any way" 

      end

      context "root account has grading periods, sub accounts do not" do
        it "does not have its grading periods altered in any way" 

      end
    end

    context "without grading periods" do
      let(:root_account_periods_attrs) do
        root_account_periods.to_a.map do |period|
          { title: period.title, start_date: period.start_date, end_date: period.end_date }
        end
      end

      let(:sub_account_periods_attrs) do
        sub_account_periods.to_a.map do |period|
          { title: period.title, start_date: period.start_date, end_date: period.end_date }
        end
      end

      let(:sub_account_of_sub_account_periods_attrs) do
        sub_sub_account_periods.to_a.map do |period|
          { title: period.title, start_date: period.start_date, end_date: period.end_date }
        end
      end

      let(:course_periods_attrs) do
        @course.grading_periods.map do |period|
          { title: period.title, start_date: period.start_date, end_date: period.end_date }
        end
      end

      context "no accounts (root or sub) have grading periods" do
        it "does not have its (non-existent) grading periods altered in any way" 

      end

      context "root account has grading periods, sub accounts do not" do
        it "does not have its (non-existent) grading periods altered in any way" 

      end

      context "root and sub accounts have grading periods" do
        it "receives copies of the 'nearest' sub-account's grading periods" 

      end

      context "sub accounts have grading periods, root account does not" do
        it "receives copies of the 'nearest' sub-account's grading periods" 

      end

      context "nearest sub-account does not have grading periods, next sub-account " \
      "does, and root account does not have grading periods" do
        before(:each) do
          sub_group = legacy_group_for_sub_account.call(@sub_account)
          period_helper.create_presets_for_group(sub_group, :current)
          run_data_fixup
        end

        it "receives copies of the next 'nearest' sub-account's grading periods " 


        it "does not copy the grading_period_group_id over when copying grading periods" 

      end
    end
  end
end

