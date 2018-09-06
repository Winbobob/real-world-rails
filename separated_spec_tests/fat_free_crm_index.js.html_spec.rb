# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/contacts/index" do
  include ContactsHelper

  before do
    login
  end

  it "should render [contact] template with @contacts collection if there are contacts" 


  it "should render [empty] template if @contacts collection if there are no contacts" 

end

