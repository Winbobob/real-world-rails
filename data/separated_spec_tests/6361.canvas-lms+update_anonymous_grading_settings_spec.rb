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

require 'spec_helper'

describe DataFixup::UpdateAnonymousGradingSettings do
  before(:once) do
    account_model
    course_factory(account: @account, active_all: true)
    assignment_model(course: @course, workflow_state: 'published', anonymous_grading: false)
  end

  def run_for_course(course: @course)
    DataFixup::UpdateAnonymousGradingSettings.run_for_courses_in_range(course.id, course.id)
  end

  def run_for_account(account: @account)
    DataFixup::UpdateAnonymousGradingSettings.run_for_accounts_in_range(account.id, account.id)
  end

  def destroy_allowed_and_off_flags
    DataFixup::UpdateAnonymousGradingSettings.destroy_allowed_and_off_flags
  end

  def set_anonymous_grading_flag(course_or_account:, state: 'on')
    # Manually build the old flag for testing because this patchset also
    # removes the definition of the flag.
    anonymous_grading_flag = course_or_account.feature_flags.where(feature: :anonymous_grading).first_or_initialize
    anonymous_grading_flag.state = state
    anonymous_grading_flag.save!(validate: false)
  end

  describe 'UpdateAnonymousGradingSettings::run_for_accounts_in_range' do
    context 'for an account with anonymous_grading enabled' do
      before(:each) do
        set_anonymous_grading_flag(course_or_account: @account)
      end

      it 'removes the flag on the account' 


      it 'enables the anonymous_marking flag on the account' 


      it 'enables anonymous grading for assignments in courses belonging to the account' 


      it 'enables anonymous grading for assignments in courses in sub-accounts' 

    end

    it 'does nothing for an account with anonymous_grading set to allowed' 


    it 'does nothing for an account with anonymous_grading disabled' 

  end

  describe 'UpdateAnonymousGradingSettings::run_for_courses_in_range' do
    context 'for a course with anonymous_grading enabled' do
      before(:each) do
        set_anonymous_grading_flag(course_or_account: @course, state: 'on')
      end

      it 'removes the flag on the course' 


      it 'enables the anonymous_marking flag on the course' 


      it 'enables anonymous grading for assignments in the course' 

    end

    it 'does nothing for a course with anonymous_grading disabled' 

  end

  describe 'UpdateAnonymousGradingSettings::destroy_allowed_and_off_flags' do
    it 'removes the anonymous_grading feature flag for an account with the flag set to allowed' 


    it 'removes the anonymous_grading feature flag for an account with the flag set to off' 


    it 'ignores the anonymous_grading feature flag for an account with the flag set to on' 

  end
end

