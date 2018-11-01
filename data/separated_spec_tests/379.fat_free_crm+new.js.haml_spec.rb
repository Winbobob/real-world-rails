# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/opportunities/new" do
  include OpportunitiesHelper

  before do
    login
    @account = build_stubbed(:account)
    assign(:opportunity, Opportunity.new(user: current_user))
    assign(:users, [current_user])
    assign(:account, @account)
    assign(:accounts, [@account])
    assign(:stage, Setting.unroll(:opportunity_stage))
  end

  it "should toggle empty message div if it exists" 


  describe "new opportunity" do
    it "should render [new] template into :create_opportunity div" 


    it "should call JavaScript functions to load Calendar popup" 

  end

  describe "cancel new opportunity" do
    it "should hide [create campaign] form" 

  end
end

