# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/leads/destroy" do
  before do
    login
    assign(:lead, @lead = build_stubbed(:lead))
    assign(:lead_status_total, Hash.new(1))
  end

  it "should blind up destroyed lead partial" 


  it "should update leads sidebar when called from leads index" 


  it "should update pagination when called from leads index" 


  it "should update related asset sidebar when called from related asset" 

end

