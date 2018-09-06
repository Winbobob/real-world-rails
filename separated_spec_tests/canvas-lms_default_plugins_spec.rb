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

require File.expand_path(File.dirname(__FILE__) + '/common')

describe "default plugins" do
  include_context "in-process server selenium tests"

  before(:each) do
    user_logged_in
    Account.site_admin.account_users.create!(user: @user)
  end

  it "should allow configuring twitter plugin" 


  it "should allow configuring etherpad plugin" 


  it "should allow configuring linked in plugin" 


  def multiple_accounts_select
    if !f("#plugin_setting_disabled").displayed?
      f("#accounts_select option:nth-child(2)").click
      expect(f("#plugin_setting_disabled")).to be_displayed
    end
    if !f(".save_button").enabled?
      f(".copy_settings_button").click
    end
  end
end


