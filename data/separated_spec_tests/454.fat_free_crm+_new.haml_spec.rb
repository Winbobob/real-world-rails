# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/campaigns/_new" do
  include CampaignsHelper

  before do
    login
    assign(:campaign, Campaign.new)
    assign(:users, [current_user])
  end

  it "should render [create campaign] form" 


  it "should render background info field if settings require so" 


  it "should not render background info field if settings do not require so" 

end

