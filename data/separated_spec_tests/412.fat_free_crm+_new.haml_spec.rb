# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/_new" do
  include ContactsHelper

  before do
    login
    @account = build_stubbed(:account)
    assign(:contact, Contact.new)
    assign(:users, [current_user])
    assign(:account, @account)
    assign(:accounts, [@account])
  end

  it "should render [create contact] form" 


  it "should pick default assignee (Myself)" 


  it "should render background info field if settings require so" 


  it "should not render background info field if settings do not require so" 

end

