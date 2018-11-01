# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'spec_helper'

describe "/opportunities/index" do
  include OpportunitiesHelper

  before do
    login
    assign(:stage, Setting.unroll(:opportunity_stage))
  end

  it "should render [opportunity] template with @opportunities collection if there are opportunities" 


  it "should render [empty] template if @opportunities collection if there are no opportunities" 

end

