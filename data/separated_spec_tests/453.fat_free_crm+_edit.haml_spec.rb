# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/campaigns/_edit" do
  include CampaignsHelper

  before do
    login
    assign(:campaign, @campaign = build_stubbed(:campaign))
    assign(:users, [current_user])
  end

  it "should render [edit campaign] form" 


  it "should render background info field if settings require so" 


  it "should not render background info field if settings do not require so" 

end

