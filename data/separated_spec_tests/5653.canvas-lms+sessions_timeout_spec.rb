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

require File.expand_path('spec/selenium/common')

describe "Sessions Timeout" do
  include_context "in-process server selenium tests"

  describe "Validations" do
    context "when you are logged in as an admin" do
      before do
        user_logged_in
        Account.site_admin.account_users.create!(user: @user)
      end

      it "requires session expiration to be at least 20 minutes" 

    end
  end

  it "logs the user out after the session is expired" 

end

