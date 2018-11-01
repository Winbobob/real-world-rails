# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/campaigns/new" do
  include CampaignsHelper

  before do
    login
    assign(:campaign, Campaign.new(user: current_user))
    assign(:users, [current_user])
  end

  it "should toggle empty message div if it exists" 


  describe "new campaign" do
    it "should render [new] template into :create_campaign div" 


    it "should call JavaScript functions to load Calendar popup" 

  end

  describe "cancel new campaign" do
    it "should hide [create campaign] form" 

  end
end

