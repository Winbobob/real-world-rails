# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/leads/edit" do
  include LeadsHelper

  before do
    login
    assign(:lead, @lead = build_stubbed(:lead, status: "new", user: current_user))
    assign(:users, [current_user])
    assign(:campaigns, [build_stubbed(:campaign)])
  end

  it "cancel from lead index page: should replace [Edit Lead] form with lead partial" 


  it "cancel from lead landing page: should hide [Edit Lead] form" 


  it "edit: should hide previously open [Edit Lead] and replace it with lead partial" 


  it "edit: should remove previously open [Edit Lead] if it's no longer available" 


  it "edit from leads index page: should turn off highlight, hide [Create Lead] form, and replace current lead with [Edit Lead] form" 


  it "edit from lead landing page: should hide [Convert Lead] and show [Edit Lead] form" 


  it "edit from lead landing page: should not attempt to hide [Convert Lead] if the lead is already converted" 

end

