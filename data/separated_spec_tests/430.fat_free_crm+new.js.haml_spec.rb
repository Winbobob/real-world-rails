# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/accounts/new" do
  include AccountsHelper

  before do
    login
    assign(:account, Account.new(user: current_user))
    assign(:users, [current_user])
  end

  it "should toggle empty message div if it exists" 


  describe "new account" do
    it "should render [new] template into :create_account div" 

  end

  describe "cancel new account" do
    it "should hide [create account] form()" 

  end
end

