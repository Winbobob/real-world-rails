# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/leads/new" do
  include LeadsHelper

  before do
    login
    @campaign = build_stubbed(:campaign)
    assign(:lead, Lead.new(user: current_user))
    assign(:users, [current_user])
    assign(:campaign, @campaign)
    assign(:campaigns, [@campaign])
  end

  it "should toggle empty message div if it exists" 


  describe "new lead" do
    it "should render [new] template into :create_lead div" 

  end

  describe "cancel new lead" do
    it "should hide [create_lead] form" 

  end
end

