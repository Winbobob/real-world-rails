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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "users/_logins.html.erb" do
  describe "sis_source_id edit box" do
    before do
      user_with_pseudonym
      @account = Account.default
      @student = @user
      @pseudo = @user.pseudonyms.first
      @pseudo.sis_user_id = "why_is_this_one_user_id_lame"
      @pseudo.integration_id = "and_this_one_even_lamer"
      @pseudo.save
      @pseudo2 = @user.pseudonyms.create!(:unique_id => 'someone@somewhere.com') { |p| p.sis_user_id = 'more' }
      assign(:context, @account)
      assign(:context_account, @account)
      assign(:account, @account)
      assign(:root_account, @account)
      assign(:user, @student)
      assign(:current_enrollments, [])
      assign(:completed_enrollments, [])
      assign(:student_enrollments, [])
      assign(:pending_enrollments, [])
      assign(:enrollments, [])
      assign(:courses, [])
      assign(:page_views, [])
      assign(:group_memberships, [])
      assign(:context_groups, [])
      assign(:contexts, [])
    end

    it "should show to sis admin" 


    it "should not show to non-sis admin" 

  end

  describe "add_pseudonym_link" do
    let(:account) { Account.default }
    let(:sally) { account_admin_user(account: account) }
    let(:bob) { student_in_course(account: account).user }

    it "should display when user has permission to create pseudonym" 


    it "should not display when user lacks permission to create pseudonym" 

  end

  describe "reset_mfa_link" do
    let(:account) { Account.default }
    let(:sally) { account_admin_user(account: account) }
    let(:bob) { student_in_course(account: account).user }

    it "should display when user has permission to reset MFA" 


    it "should not display when user lacks permission to reset MFA" 

  end

  describe "add_holder" do
    let(:account) { Account.default }
    let(:sally) { account_admin_user(account: account) }
    let(:bob) { student_in_course(account: account).user }

    it "should display when user can only reset MFA" 


    it "should display when user can only add pseudonym" 


    it "should not display when user lacks permission to do either" 

  end

  context "authentication providers" do
    it "doesn't show an icon for SAML" 

  end
end

