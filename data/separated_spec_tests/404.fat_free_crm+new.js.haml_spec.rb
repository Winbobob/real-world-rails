# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/contacts/new" do
  include ContactsHelper

  before do
    login
    @account = build_stubbed(:account)
    assign(:contact, Contact.new(user: current_user))
    assign(:users, [current_user])
    assign(:account, @account)
    assign(:accounts, [@account])
  end

  it "should toggle empty message div if it exists" 


  describe "new contact" do
    it "should render [new] template into :create_contact div" 

  end

  describe "cancel new contact" do
    it "should hide [create contact] form" 

  end
end

