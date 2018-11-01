# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/accounts/create" do
  include AccountsHelper

  before do
    login
  end

  # Note: [Create Account] is only called from Accounts index. Unlike other
  # core object Account partial is not embedded.
  describe "create success" do
    before do
      assign(:account, @account = build_stubbed(:account))
      assign(:accounts, [@account].paginate)
      assign(:account_category_total, Hash.new(1))
      render
    end

    it "should hide [Create Account] form and insert account partial" 


    it "should update pagination" 


    it "should refresh accounts sidebar" 

  end

  describe "create failure" do
    it "should re-render [create] template in :create_account div" 

  end
end

