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
#

require_relative '../api_spec_helper'

describe ObserverPairingCodesApiController, type: :request do
  include Api

  describe '#create' do
    before :once do
      @student = student_in_course(active_all: true).user
      @path = "/api/v1/users/#{@student.id}/observer_pairing_codes"
      @params = {user_id: @student.to_param,
        controller: 'observer_pairing_codes_api', action: 'create', format: 'json'}
    end

    it 'students can create pairing codes for themselves' 


    it 'errors if user_id passed in isnt a student' 


    it 'teacher cannot generate code by default' 


    it 'works for teachers in courses that are not published yet' 


    it 'does not work for deleted courses' 


    it 'admin can generate code' 


    it 'errors if current_user isnt the student or a teacher/admin' 


    describe 'sub_accounts' do
      before :once do
        @sub_account = Account.create! root_account: Account.default
        @student = course_with_student(account: @sub_account, active_all: true).user
        @sub_admin = account_admin_user(account: @sub_account)
        @path = "/api/v1/users/#{@student.id}/observer_pairing_codes"
        @params = {user_id: @student.to_param,
          controller: 'observer_pairing_codes_api', action: 'create', format: 'json'}
      end

      it 'sub_account admin can generate code' 


      it "sub_account admin cant generate code for students in other sub accounts" 

    end
  end
end

