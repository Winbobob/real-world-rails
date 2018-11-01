# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/campaigns/update" do
  before do
    login
    assign(:campaign, @campaign = build_stubbed(:campaign, user: current_user))
    assign(:users, [current_user])
    assign(:status, Setting.campaign_status)
    assign(:campaign_status_total, Hash.new(1))
  end

  describe "no errors:" do
    describe "on landing page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/campaigns/123"
      end

      it "should flip [edit_campaign] form" 


      it "should update sidebar" 

    end

    describe "on index page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/campaigns"
      end

      it "should replace [Edit Campaign] with campaign partial and highlight it" 

    end
  end

  describe "validation errors:" do
    describe "on landing page -" do
      before do
        @campaign.errors.add(:name)
        controller.request.env["HTTP_REFERER"] = "http://localhost/campaigns/123"
      end

      it "should redraw the [edit_campaign] form and shake it" 

    end

    describe "on index page -" do
      before do
        @campaign.errors.add(:name)
        controller.request.env["HTTP_REFERER"] = "http://localhost/campaigns"
      end

      it "should redraw the [edit_campaign] form and shake it" 

    end
  end
end

