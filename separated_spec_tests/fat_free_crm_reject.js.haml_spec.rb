# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/leads/reject" do
  before do
    login
    assign(:lead, @lead = build_stubbed(:lead, status: "new"))
    assign(:lead_status_total, Hash.new(1))
  end

  it "should refresh current lead partial" 


  it "should update sidebar filters when called from index page" 


  it "should update sidebar summary when called from landing page" 


  it "should update campaign sidebar if called from campaign landing page" 

end

