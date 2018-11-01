# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/opportunities/_edit" do
  include OpportunitiesHelper

  before do
    login
    assign(:account, @account = build_stubbed(:account))
    assign(:accounts, [@account])
    assign(:stage, Setting.unroll(:opportunity_stage))
  end

  it "should render [edit opportunity] form" 


  it "should pick default assignee (Myself)" 


  it "should show correct assignee" 


  it "should render background info field if settings require so" 


  it "should not render background info field if settings do not require so" 

end
