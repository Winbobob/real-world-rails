# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/accounts/edit" do
  include AccountsHelper

  before do
    login
    assign(:account, @account = build_stubbed(:account, user: current_user))
    assign(:users, [current_user])
  end

  it "cancel from accounts index page: should replace [Edit Account] form with account partial" 


  it "cancel from account landing page: should hide [Edit Account] form" 


  it "edit: should hide previously open [Edit Account] for and replace it with account partial" 


  it "edit: should remove previously open [Edit Account] if it's no longer available" 


  it "edit from accounts index page: should turn off highlight, hide [Create Account] form, and replace current account with [edit account] form" 


  it "edit from account landing page: should show [edit account] form" 

end

