# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/opportunities/destroy" do
  before do
    login
    assign(:opportunity, @opportunity = build_stubbed(:opportunity))
    assign(:stage, Setting.unroll(:opportunity_stage))
    assign(:opportunity_stage_total, Hash.new(1))
  end

  it "should blind up destroyed opportunity partial" 


  it "should update opportunities sidebar when called from opportunities index" 


  it "should update pagination when called from opportunities index" 


  it "should update related account sidebar when called from related account" 


  it "should update related campaign sidebar when called from related campaign" 


  it "should update recently viewed items when called from related contact" 

end

