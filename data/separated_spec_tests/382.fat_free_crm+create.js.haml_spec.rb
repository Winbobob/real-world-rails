# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/opportunities/create" do
  before do
    login
    assign(:stage, Setting.unroll(:opportunity_stage))
  end

  describe "create success" do
    before do
      assign(:opportunity, @opportunity = build_stubbed(:opportunity))
      assign(:opportunities, [@opportunities].paginate)
      assign(:opportunity_stage_total, Hash.new(1))
    end

    it "should hide [Create Opportunity] form and insert opportunity partial" 


    it "should update sidebar filters and recently viewed items when called from opportunities page" 


    it "should update pagination when called from opportunities index" 


    it "should update related account sidebar when called from related account" 


    it "should update related campaign sidebar when called from related campaign" 


    it "should update sidebar when called from related contact" 

  end

  describe "create failure" do
    it "should re-render [create] template in :create_opportunity div" 

  end
end

