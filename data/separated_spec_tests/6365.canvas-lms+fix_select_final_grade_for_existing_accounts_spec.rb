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

describe DataFixup::FixSelectFinalGradeForExistingAccounts do
  before :once do
    @account = Account.create!
  end

  before :each do
    RoleOverride.destroy_all
  end

  context 'TaEnrollment role' do
    it 'creates a disabled select_final_grade role override for accounts without a moderate grades one' 


    it 'does not create duplicate select_final_grade role override if already existing' 


    it 'does not create a select_final_grade role override when moderate_grades is enabled' 


    it 'creates a select_final_grade role override when moderate_grades is disabled' 


    it 'gives final say to existing select_final_grade override over existing moderate_grades override' 

  end

  context 'custom ta roles' do
    before :once do
      @new_role = custom_ta_role('CustomTaEnrollment')
    end

    before :each do
      RoleOverride.destroy_all
    end

    it 'creates a disabled select_final_grade role override for accounts without a moderate grades one' 


    it 'does not create duplicate select_final_grade role override if already existing' 


    it 'does not create a select_final_grade role override when moderate_grades is enabled' 


    it 'creates a select_final_grade role override when moderate_grades is disabled' 


    it 'gives final say to existing select_final_grade override over existing moderate_grades override' 

  end

  context 'other roles' do
    before :once do
      @teacher_role = teacher_role
    end

    before :each do
      RoleOverride.destroy_all
    end

    it 'does not create a disabled select_final_grade role override for accounts without a moderate grades one' 


    it 'does not create duplicate select_final_grade role override if already existing' 


    it 'does not create a select_final_grade role override when moderate_grades is enabled' 


    it 'creates a select_final_grade role override when moderate_grades is disabled' 


    it 'gives final say to existing select_final_grade override over existing moderate_grades override' 


    it 'copies over the locked attribute when mirroring overrides' 

  end

  context 'SiteAdmin' do
    before :once do
      @site_admin = Account.site_admin
    end

    before :each do
      RoleOverride.destroy_all
    end

    it 'does not create a select_final_grade role override for site admin' 

  end
end

