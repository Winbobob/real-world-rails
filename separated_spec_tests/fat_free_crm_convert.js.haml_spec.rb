# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/leads/convert" do
  include LeadsHelper

  before do
    login

    assign(:lead, @lead = build_stubbed(:lead, user: current_user))
    assign(:users, [current_user])
    assign(:account, @account = build_stubbed(:account))
    assign(:accounts, [@account])
    assign(:opportunity, build_stubbed(:opportunity))
  end

  it "cancel from lead index page: should replace [Convert Lead] form with lead partial" 


  it "cancel from lead landing page: should hide [Convert Lead] form" 


  it "convert: should hide previously open [Convert Lead] and replace it with lead partial" 


  it "convert: should remove previously open [Convert Lead] if it's no longer available" 


  it "convert from leads index page: should turn off highlight, hide [Create Lead] form, and replace current lead with [Convert Lead] form" 


  it "convert from lead landing page: should hide [Edit Lead] and show [Convert Lead] form" 


  it "convert: should handle new or existing account and set up calendar field" 

end

