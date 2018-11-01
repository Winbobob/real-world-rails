# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/leads/update" do
  before do
    login
    assign(:lead, @lead = build_stubbed(:lead, user: current_user, assignee: build_stubbed(:user)))
    assign(:users, [current_user])
    assign(:campaigns, [build_stubbed(:campaign)])
    assign(:lead_status_total, Hash.new(1))
  end

  describe "no errors:" do
    describe "on landing page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/leads/123"
      end

      it "should flip [edit_lead] form" 


      it "should update sidebar" 

    end

    describe "on index page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/leads"
      end

      it "should replace [Edit Lead] with lead partial and highlight it" 


      it "should update sidebar" 

    end

    describe "on related asset page -" do
      before do
        assign(:campaign, build_stubbed(:campaign))
        controller.request.env["HTTP_REFERER"] = "http://localhost/campaigns/123"
      end

      it "should replace [Edit Lead] with lead partial and highlight it" 


      it "should update campaign sidebar" 

    end
  end

  describe "validation errors :" do
    before do
      @lead.errors.add(:first_name)
    end

    describe "on landing page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/leads/123"
      end

      it "should redraw the [edit_lead] form and shake it" 

    end

    describe "on index page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/leads"
      end

      it "should redraw the [edit_lead] form and shake it" 

    end

    describe "on related asset page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/campaigns/123"
      end

      it "should redraw the [edit_lead] form and shake it" 

    end
  end
end

