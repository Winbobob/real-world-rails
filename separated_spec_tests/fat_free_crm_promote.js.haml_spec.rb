# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/leads/promote" do
  before do
    login
    assign(:users, [current_user])
    assign(:account, @account = build_stubbed(:account))
    assign(:accounts, [@account])
    assign(:contact, build_stubbed(:contact))
    assign(:opportunity, build_stubbed(:opportunity))
    assign(:lead_status_total, Hash.new(1))
  end

  describe "no errors :" do
    before do
      assign(:lead, @lead = build_stubbed(:lead, status: "converted", user: current_user, assignee: current_user))
    end

    describe "from lead landing page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/leads/123"
      end

      it "should flip [Convert Lead] form" 


      it "should update sidebar" 

    end

    describe "from lead index page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/leads"
      end

      it "should replace [Convert Lead] with lead partial and highlight it" 


      it "should update sidebar" 

    end

    describe "from related campaign page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/campaigns/123"
        assign(:campaign, build_stubbed(:campaign))
        assign(:stage, Setting.unroll(:opportunity_stage))
        assign(:opportunity, @opportunity = build_stubbed(:opportunity))
      end

      it "should replace [Convert Lead] with lead partial and highlight it" 


      it "should update campaign sidebar" 


      it "should insert new opportunity if any" 

    end
  end

  describe "validation errors:" do
    before do
      assign(:lead, @lead = build_stubbed(:lead, status: "new", user: current_user, assignee: current_user))
    end

    describe "from lead landing page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/leads/123"
      end

      it "should redraw the [Convert Lead] form and shake it" 

    end

    describe "from lead index page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/leads"
      end

      it "should redraw the [Convert Lead] form and shake it" 

    end

    describe "from related asset page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/campaigns/123"
      end

      it "should redraw the [Convert Lead] form and shake it" 

    end

    it "should handle new or existing account and set up calendar field" 

  end
end

