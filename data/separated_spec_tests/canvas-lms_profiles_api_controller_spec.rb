#
# Copyright (C) 2014 Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../api_spec_helper')


def call_setting(opts)
  status_assertion = opts[:assert_unauthorized] ? {:expected_status => 401} : {}
  api_call_as_user(opts[:as_user], :get,
    "/api/v1/users/#{opts[:for_user].id}/profile.json",
    { :controller => 'profile', :action => 'settings',
      :format => 'json', :user_id => opts[:for_user].id },{},{}, status_assertion)
end

describe 'ProfileController', type: :request do
  context "setting permissions" do
    context "admin" do
      it "should show all profiles" 

    end

    context "teacher" do
      it "should show profiles for their students" 

      it "should return unauthorized profiles for other students" 

    end

    context "student" do
      it "should show a profile if it is theirs" 

      it "should return unauthorized when attempting to access another students profile" 

    end
  end
end

