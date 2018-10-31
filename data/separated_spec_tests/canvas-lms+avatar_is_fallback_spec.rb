#
# Copyright (C) 2011 - present Instructure, Inc.
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

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
  context "avatar_is_fallback" do
    before :once do
      user_factory
    end

    before :each do
      user_session @user
    end

    it 'is absent when avatars are turned off' 


    context "with avatars enabled" do
      before :once do
        Account.default.tap do |a|
          a.enable_service(:avatars)
          a.save!
        end
      end

      it 'is true when there is no real avatar image' 


      it 'is false when there is a real avatar image' 

    end
  end
end

