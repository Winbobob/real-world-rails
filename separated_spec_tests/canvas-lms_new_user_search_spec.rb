#
# Copyright (C) 2015 - present Instructure, Inc.
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

describe "new account user search" do
  include_context "in-process server selenium tests"

  before :once do
    @account = Account.default
    @account.enable_feature!(:course_user_search)
    account_admin_user(:account => @account, :active_all => true)
  end

  before do
    user_session(@user)
  end

  def get_rows
    ff('[data-automation="users list"] tr')
  end

  def wait_for_loading_to_disappear
    expect(f('[data-automation="users list"]')).not_to contain_css('tr:nth-child(2)')
  end

  it "should be able to toggle between 'People' and 'Courses' tabs" 


  it "should not show the people tab without permission" 


  it "should not show the create users button for non-root acocunts" 


  it "should show the create users button user has permission on the root_account" 


  it "should be able to create users" 


  it "should be able to create users with confirmation disabled", priority: "1", test_id: 3399311 do
    name = 'Confirmation Disabled'
    get "/accounts/#{@account.id}/users"

    fj('button:has([name="IconPlusLine"]):contains("People")').click
    modal = f('[aria-label="Add a New User"]')

    set_value(fj('label:contains("Full Name") input', modal), name)

    email = 'someemail@example.com'
    set_value(fj('label:contains("Email") input', modal), email)

    fj('label:contains("Email the user about this account creation")', modal).click

    f('button[type="submit"]', modal).click
    wait_for_ajaximations

    new_pseudonym = Pseudonym.where(:unique_id => email).first
    expect(new_pseudonym.user.name).to eq name
  end

  it "should bring up user page when clicking name", priority: "1", test_id: 3399648 do
    page_user = user_with_pseudonym(:account => @account, :name => "User Page")
    get "/accounts/#{@account.id}/users"

    fj("[data-automation='users list'] tr a:contains('#{page_user.name}')").click

    wait_for_ajax_requests
    expect(f("#content h2")).to include_text page_user.name
  end

  it "should paginate" 


  it "should search by name" 


  it "should search but not find bogus user", priority: "1", test_id: 3399649 do
    bogus = 'jtsdumbthing'
    get "/accounts/#{@account.id}/users"

    f('input[placeholder="Search people..."]').send_keys(bogus)

    expect(f('#content .alert')).to include_text('No users found')
    expect(f('#content')).not_to contain_css('[data-automation="users list"] tr')
  end

  it "should link to the user avatar page" 


  it "should link to the user group page" 


  it "should open the act as page when clicking the masquerade button", priority: "1", test_id: 3453424 do
    mask_user = user_with_pseudonym(:account => @account, :name => "Mask User", :active_user => true)

    get "/accounts/#{@account.id}/users"

    fj("[data-automation='users list'] tr:contains('#{mask_user.name}') [role=button]:has([name='IconMasqueradeLine'])")
      .click
    expect(f('.ActAs__text')).to include_text mask_user.name
  end

  it "should open the conversation page when clicking the send message button", priority: "1", test_id: 3453435 do
    conv_user = user_with_pseudonym(:account => @account, :name => "Conversation User")

    get "/accounts/#{@account.id}/users"

    fj("[data-automation='users list'] tr:contains('#{conv_user.name}') [role=button]:has([name='IconMessageLine'])")
      .click
    expect(f('.message-header-input .ac-token')).to include_text conv_user.name
  end

  it "should open the edit user modal when clicking the edit user button", priority: "1", test_id: 3453436 do
    edit_user = user_with_pseudonym(:account => @account, :name => "Edit User")

    get "/accounts/#{@account.id}/users"

    fj("[data-automation='users list'] tr:contains('#{edit_user.name}') [role=button]:has([name='IconEditLine'])").click

    expect(fj('label:contains("Full Name") input').attribute('value')).to eq("Edit User")
  end

end

