# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/campaigns/edit" do
  include CampaignsHelper

  before do
    login
    assign(:campaign, @campaign = build_stubbed(:campaign, user: current_user))
    assign(:users, [current_user])
  end

  it "cancel from campaign index page: should replace [Edit Campaign] form with campaign partial" 


  it "cancel from campaign landing page: should hide [Edit Campaign] form" 


  it "edit: should hide previously open [Edit Campaign] for and replace it with campaign partial" 


  it "edit: should remove previously open [Edit Campaign] if it's no longer available" 


  it "edit from campaigns index page: should turn off highlight, hide [Create Campaign], and replace current campaign with [Edit Campaign] form" 


  it "edit from campaign landing page: should show [Edit Campaign] form" 

end

