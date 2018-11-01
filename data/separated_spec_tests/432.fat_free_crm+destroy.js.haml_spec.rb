# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/accounts/destroy" do
  include AccountsHelper

  before do
    login
    assign(:account, @account = build_stubbed(:account))
    assign(:accounts, [@account].paginate)
    assign(:account_category_total, Hash.new(1))
    render
  end

  it "should blind up destroyed account partial" 


  it "should update accounts pagination" 


  it "should update accounts sidebar" 

end

