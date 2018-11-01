# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/opportunities/edit" do
  include OpportunitiesHelper

  before do
    login

    assign(:opportunity, @opportunity = build_stubbed(:opportunity, user: current_user))
    assign(:users, [current_user])
    assign(:account, @account = build_stubbed(:account))
    assign(:accounts, [@account])
    assign(:stage, Setting.unroll(:opportunity_stage))
  end

  it "cancel from opportunity index page: should replace [Edit Opportunity] form with opportunity partial" 


  it "cancel from opportunity landing page: should hide [Edit Opportunity] form" 


  it "edit: should hide previously open [Edit Opportunity] for and replace it with opportunity partial" 


  it "edit: remove previously open [Edit Opportunity] if it's no longer available" 


  it "edit from opportunities index page: should turn off highlight, hide [Create Opportunity] form, and replace current opportunity with [Edit Opportunity] form" 


  it "edit from opportunity landing page: should show [Edit Opportunity] form" 


  it "edit: should handle new or existing account for the opportunity" 

end

