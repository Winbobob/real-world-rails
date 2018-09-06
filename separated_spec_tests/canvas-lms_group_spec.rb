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
#

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')
require_relative '../../../../lib/api/v1/group'

describe Api::V1::Group do
  include Api::V1::Group
  include Api::V1::User

  describe "group_json" do
    before :once do
      context = course_model
      @group = Group.create(:name => "group1", :context => context)
      @group.add_user(@user)
      @user.enrollments.first.deactivate
    end

    it "basic test including users" 


    it "filter inactive users but do include users" 


    it "dont include users if not asked for" 

  end

  describe "group_membership_json" do
    before :once do
      context = course_model
      @group = Group.create(:name => "group1", :context => context)
      @group.add_user(@user)
      @user.enrollments.first.deactivate
    end

    it "basic test" 

  end
end

