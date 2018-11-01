# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/accounts/index" do
  include AccountsHelper

  before do
    login
  end

  it "should render [account] template with @accounts collection if there are accounts" 


  it "should render [empty] template if @accounts collection if there are no accounts" 

end

