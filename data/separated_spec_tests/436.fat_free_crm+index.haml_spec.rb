# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/accounts/index" do
  include AccountsHelper

  before do
    view.lookup_context.prefixes << 'entities'
    assign :per_page, Account.per_page
    assign :sort_by,  Account.sort_by
    assign :ransack_search, Account.ransack
    login
  end

  it "should render account name" 


  it "should render list of accounts if list of accounts is not empty" 


  it "should render a message if there're no accounts" 

end

