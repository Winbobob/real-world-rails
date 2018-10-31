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

require File.expand_path(File.dirname(__FILE__) + '/../../../spec_helper.rb')

describe SIS::CSV::GroupMembershipImporter do

  before { account_model }

  before do
    group_model(:context => @account, :sis_source_id => "G001")
    @user1 = user_with_pseudonym(:username => 'u1@example.com')
    @user1.pseudonym.update_attribute(:sis_user_id, 'U001')
    @user1.pseudonym.update_attribute(:account, @account)
    @user2 = user_with_pseudonym(:username => 'u2@example.com')
    @user2.pseudonym.update_attribute(:sis_user_id, 'U002')
    @user2.pseudonym.update_attribute(:account, @account)
    @user3 = user_with_pseudonym(:username => 'u3@example.com')
    @user3.pseudonym.update_attribute(:sis_user_id, 'U003')
    @user3.pseudonym.update_attribute(:account, @account)
  end

  it "should skip bad content" 


  it "should add users to groups" 


  it "should add users to groups that the user cannot access" 


end

