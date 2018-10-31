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

require_relative '../common'
require_relative 'pages/new_user_search_page'
require_relative 'pages/new_course_search_page'
require_relative 'pages/new_user_edit_modal_page.rb'
require_relative 'pages/edit_existing_user_modal_page.rb'
require_relative 'pages/masquerade_page.rb'
require_relative '../conversations/conversations_new_message_modal_page.rb'

describe "new account user search" do
  include_context "in-process server selenium tests"
  include NewUserSearchPage
  include NewCourseSearchPage
  include NewUserEditModalPage
  include MasqueradePage
  include ConversationsNewMessageModalPage
  include EditExistingUserModalPage

  before :once do
    @account = Account.default
    account_admin_user(:account => @account, :active_all => true)
  end

  before do
    user_session(@user)
  end

  def wait_for_loading_to_disappear
    expect(f('[data-automation="users list"]')).not_to contain_css('tr:nth-child(2)')
  end

  describe "with default page visit" do
    before do
      @user.update_attribute(:name, "Test User")
      visit_users(@account)
    end

    it "should bring up user page when clicking name", priority: "1", test_id: 3399648 do
      click_user_link(@user.sortable_name)
      expect(f("#content h2")).to include_text @user.name
    end

    it "should open the edit user modal when clicking the edit user icon" 


    it "should open the act as page when clicking the masquerade button", priority: "1", test_id: 3453424 do
      click_masquerade_button(@user.name)
      expect(act_as_label).to include_text @user.name
    end

    it "should open the conversation page when clicking the send message button", priority: "1", test_id: 3453435 do
      click_message_button(@user.name)
      expect(message_recipient_input).to include_text @user.name
    end

    it "should search but not find bogus user", priority: "1", test_id: 3399649 do
      enter_search('jtsdumbthing')
      expect(f('#content h2')).to include_text('No users found')
      expect(results_body).not_to contain_css(results_row)
    end

    it "should link to the user group page" 


    it "should link to the user avatar page" 


    it "should search by name" 

  end

  describe "with no default visit" do
    before do
      @sub_account = Account.create!(name: "sub", parent_account: @account)
    end

    it "should not show the people tab without permission" 


    it "should show the create users button user has permission on the root_account" 


    it "should not show the create users button for non-root accounts" 


    it "should paginate" 


    it "should be able to toggle between 'People' and 'Courses' tabs" 


    it "should be able to create users" 


    it "should be able to create users with confirmation disabled", priority: "1", test_id: 3399311 do
      name = 'Confirmation Disabled'
      email = 'someemail@example.com'
      visit_users(@account)

      click_add_people

      set_value(full_name_input, name)
      set_value(email_input, email)

      click_email_creation_check
      click_modal_submit

      new_pseudonym = Pseudonym.where(:unique_id => email).first
      expect(new_pseudonym.user.name).to eq name
    end
  end
end

