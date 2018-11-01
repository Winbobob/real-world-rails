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

require File.expand_path(File.dirname(__FILE__) + '/../common')

describe "admin sub accounts" do
  include_context "in-process server selenium tests"
  let(:default_account_id) { Account.default.id }

  def create_sub_account(name = 'sub account', number_to_create = 1, parent_account = Account.default)
    created_sub_accounts = []
    number_to_create.times do |i|
      sub_account = Account.create(:name => name + " #{i}", :parent_account => parent_account)
      created_sub_accounts.push(sub_account)
    end
    created_sub_accounts.count == 1 ? created_sub_accounts[0] : created_sub_accounts
  end

  def click_account_action_link(account_id, action_link_css)
    f("#account_#{account_id} #{action_link_css}").click
  end

  def create_sub_account_and_go
    sub_account = create_sub_account
    get "/accounts/#{default_account_id}/sub_accounts"
    sub_account
  end

  def edit_account_info(input_css, text_to_input)
    new_account_input = f(input_css)
    new_account_input.send_keys(text_to_input)
    new_account_input.send_keys(:return)
    wait_for_ajaximations
  end

  before (:each) do
    course_with_admin_logged_in
  end

  it "should create a new sub account" 


  it "should delete a sub account" 


  it "should edit a sub account" 


  it "should validate sub account count on main account" 


  it "should be able to nest sub accounts" 


  it "should hide sub accounts and re-expand them" 


  it "should validate course count for a sub account" 


  it "should validate that you can't delete a sub account with courses in it" 

end

