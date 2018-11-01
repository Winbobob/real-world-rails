# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/opportunities/update" do
  before do
    login

    assign(:opportunity, @opportunity = build_stubbed(:opportunity, user: current_user, assignee: build_stubbed(:user)))
    assign(:users, [current_user])
    assign(:account, @account = build_stubbed(:account))
    assign(:accounts, [@account])
    assign(:stage, Setting.unroll(:opportunity_stage))
    assign(:opportunity_stage_total, Hash.new(1))
  end

  describe "no errors:" do
    describe "on opportunity landing page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/opportunities/123"
      end

      it "should flip [edit_opportunity] form" 


      it "should update sidebar" 

    end

    describe "on opportunities index page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/opportunities"
      end

      it "should replace [Edit Opportunity] with opportunity partial and highlight it" 


      it "should update sidebar" 

    end

    describe "on related asset page -" do
      it "should update account sidebar" 


      it "should update campaign sidebar" 


      it "should update recently viewed items for contact" 


      it "should replace [Edit Opportunity] with opportunity partial and highlight it" 

    end
  end

  describe "validation errors:" do
    before do
      @opportunity.errors.add(:name)
    end

    describe "on opportunity landing page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/opportunities/123"
      end

      it "should redraw the [edit_opportunity] form and shake it" 

    end

    describe "on opportunities index page -" do
      before do
        controller.request.env["HTTP_REFERER"] = "http://localhost/opportunities"
      end

      it "should redraw the [edit_opportunity] form and shake it" 

    end

    describe "on related asset page -" do
      before do
        controller.request.env["HTTP_REFERER"] = @referer = "http://localhost/accounts/123"
      end

      it "should show disabled accounts dropdown when called from accounts landing page" 


      it "should redraw the [edit_opportunity] form and shake it" 

    end
  end
end

