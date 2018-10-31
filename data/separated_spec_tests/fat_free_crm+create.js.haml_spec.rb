# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/campaigns/create" do
  before do
    login
  end

  describe "create success" do
    before do
      assign(:campaign, @campaign = build_stubbed(:campaign))
      assign(:campaigns, [@campaign].paginate)
      assign(:campaign_status_total, Hash.new(1))
      render
    end

    it "should hide [Create Campaign] form and insert campaign partial" 


    it "should update pagination" 


    it "should update Campaigns sidebar filters" 

  end

  describe "create failure" do
    it "should re-render [create] template in :create_campaign div" 

  end
end

