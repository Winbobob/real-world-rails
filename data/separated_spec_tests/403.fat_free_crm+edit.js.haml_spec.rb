# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/contacts/edit" do
  include ContactsHelper

  before do
    login
    assign(:contact, @contact = build_stubbed(:contact, user: current_user))
    assign(:users, [current_user])
    assign(:account, @account = build_stubbed(:account))
    assign(:accounts, [@account])
  end

  it "cancel from contact index page: should replace [Edit Contact] form with contact partial" 


  it "cancel from contact landing page: should hide [Edit Contact] form" 


  it "edit: should hide previously open [Edit Contact] for and replace it with contact partial" 


  it "edit: should hide and remove previously open [Edit Contact] if it's no longer available" 


  it "edit from contacts index page: should turn off highlight, hide [Create Contact] form, and replace current contact with [Edit Contact] form" 


  it "edit from contact landing page: should show [Edit Contact] form" 


  it "should show handle new or existing account for the contact" 

end

