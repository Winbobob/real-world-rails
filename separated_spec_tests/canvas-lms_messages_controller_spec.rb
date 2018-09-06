#
# Copyright (C) 2012 - present Instructure, Inc.
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

describe MessagesController do
  describe "create" do
    context "an admin user" do
      before(:once){ site_admin_user }
      before(:each){ user_session(@user) }

      it "should be able to access the page" 


      it "should be able to send messages" 

    end

    context "an unauthorized user" do
      before do
        account_admin_user
        user_session(@user)
      end

      it "should receive a redirect" 

    end
  end
end

