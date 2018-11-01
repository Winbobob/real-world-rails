# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/leads/create" do
  before do
    controller.controller_path = 'leads'
    login
    assign(:campaigns, [build_stubbed(:campaign)])
  end

  describe "create success" do
    before do
      assign(:lead, @lead = build_stubbed(:lead))
      assign(:leads, [@lead].paginate)
      assign(:lead_status_total, Hash.new(1))
    end

    it "should hide [Create Lead] form and insert lead partial" 


    it "should update sidebar when called from leads index" 


    it "should update pagination when called from leads index" 


    it "should update related asset sidebar from related asset" 

  end

  describe "create failure" do
    it "should re-render [create] template in :create_lead div" 

  end
end

