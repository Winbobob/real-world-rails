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
require_relative '../spec_helper'

describe GradingPeriodsController do
  let(:now) { Time.zone.now.change(usec: 0) }

  let(:group_helper)  { Factories::GradingPeriodGroupHelper.new }
  let(:period_helper) { Factories::GradingPeriodHelper.new }

  let(:root_account) { Account.default }
  let(:sub_account)  { root_account.sub_accounts.create! }

  let(:course) { sub_account.courses.create! }

  def create_course_grading_period(course, opts = {})
    group = group_helper.legacy_create_for_course(course)
    period = period_helper.create_for_group(group, opts)
    course.enrollment_term.update_attribute(:grading_period_group_id, group)
    period
  end

  def create_account_grading_period(account, opts = {})
    group = group_helper.create_for_account(account)
    period = period_helper.create_for_group(group, opts)
    course.enrollment_term.update_attribute(:grading_period_group_id, group)
    period
  end

  def login_admin
    user = User.create!
    root_account.account_users.create!(user: user)
    user_session(user)
  end

  def login_sub_account
    user_session(account_admin_user(account: sub_account))
  end

  def expect_grading_period_id_match(json, period)
    expect(json['grading_periods'].count).to eql(1)
    returned_period = json['grading_periods'].first
    expect(returned_period['id']).to eql(period.id.to_s)
  end

  before do
    account_admin_user(account: root_account)
    user_session(@admin)
    request.accept = 'application/json'
  end

  describe 'GET index' do
    it "paginates" 


    describe 'with root account admins' do
      it 'disallows creating grading periods' 

    end

    describe 'with sub account admins' do
      it 'disallows creating grading periods' 

    end

    describe 'with course context' do
      it "can get any course associated grading periods with read_only set to false" 


      it 'is ordered by start_date' 


      it "can get any account associated grading periods with read_only set to true" 


      it "gets course associated grading periods if both are available" 


      it "sets read_only to false if no grading periods are given" 

    end

    describe 'with account context' do
      it "can get any account associated grading periods with read_only set to false" 


      it 'is ordered by start_date' 


      it "cannot get any course associated grading periods" 


      it "sets read_only to false if no grading periods are given" 

    end
  end

  describe 'GET show' do
    it 'can show course associated grading periods' 


    it 'can show account associated grading periods' 


    it 'returns the expected attributes' 

  end

  describe "PUT update" do
    before(:each) do
      login_admin
    end

    it "can update any course associated grading periods" 


    it "cannot update any account associated grading periods" 

  end

  describe "DELETE destroy" do
    before(:each) do
      login_admin
    end

    describe "with course context" do
      it "can destroy any course associated grading periods" 


      it "cannot destroy any account associated grading periods" 

    end

    describe "with account context" do
      it "can destroy any account associated grading periods" 


      it "cannot destroy any course associated grading periods" 

    end
  end

  describe "PATCH batch_update" do
    describe "with account context" do
      describe "with account associated grading periods" do
        let(:period_1_params) do
          {
            title: 'First Grading Period',
            start_date: 2.days.ago(now).to_s,
            end_date: 2.days.from_now(now).to_s
          }
        end
        let(:period_2_params) do
          {
            title: 'Second Grading Period',
            start_date: 2.days.from_now(now).to_s,
            end_date: 4.days.from_now(now).to_s
          }
        end
        let(:group) { group_helper.create_for_account(root_account) }
        let(:period_1) { group.grading_periods.create!(period_1_params) }
        let(:period_2) { group.grading_periods.create!(period_2_params) }

        it "ignores unrelated grading period sets" 


        it "compares the in memory periods' dates for overlapping" 


        it "does not paginate" 


        describe "with root account admins" do
          before do
            login_admin
          end

          it "can create a single grading period" 


          it "can create multiple grading periods" 


          it "can update a single grading period" 


          it "can update multiple grading periods" 


          it "can create and update multiple grading periods" 

        end
      end

      describe "with course associated grading periods" do
        let(:period_1_params) do
          {
            title: 'Original Title',
            start_date: 2.days.ago(now).to_s,
            end_date: 2.days.from_now(now).to_s
          }
        end
        let(:group) { group_helper.legacy_create_for_course(course) }
        let(:period_1) { group.grading_periods.create!(period_1_params) }

        before(:each) do
          login_admin
        end

        it "cannot update any grading periods" 


        it "responds with 404 not found upon failure" 

      end
    end

    describe "with course context" do
      describe "with course associated grading periods" do
        let(:period_1_params) do
          {
            title: 'First Grading Period',
            start_date: 2.days.ago(now).to_s,
            end_date: 2.days.from_now(now).to_s
          }
        end
        let(:period_2_params) do
          {
            title: 'Second Grading Period',
            start_date: 2.days.from_now(now).to_s,
            end_date: 4.days.from_now(now).to_s
          }
        end
        let(:group) { group_helper.legacy_create_for_course(course) }
        let(:period_1) { group.grading_periods.create!(period_1_params) }
        let(:period_2) { group.grading_periods.create!(period_2_params) }

        it "compares the in memory periods' dates for overlapping" 


        it "responds with json upon success" 


        it "responds with json upon failure" 


        describe "with root account admins" do
          before do
            login_admin
          end

          it "cannot create a single grading period" 


          it "cannot create multiple grading periods" 


          it "can update a single grading period" 


          it "can update multiple grading periods" 


          it "cannot create and update multiple grading periods" 

        end

        describe "with sub account admins" do
          before do
            login_sub_account
          end

          it "cannot create a single grading period" 


          it "cannot create multiple grading periods" 


          it "can update a single grading period" 


          it "can update multiple grading periods" 


          it "cannot create and update multiple grading periods" 

        end
      end

      describe "with account associated grading periods" do
        let(:period_1_params) do
          {
            title: 'Original Title',
            start_date: 2.days.ago(now).to_s,
            end_date: 2.days.from_now(now).to_s
          }
        end
        let(:group) { group_helper.create_for_account(root_account) }
        let(:period_1) { group.grading_periods.create!(period_1_params) }

        before(:each) do
          login_admin
          course.enrollment_term.update_attribute(:grading_period_group_id, group)
        end

        it "cannot update any grading periods" 


        it "responds with json upon failure" 

      end
    end
  end
end

