# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/opportunities/index" do
  include OpportunitiesHelper

  before do
    login
    view.lookup_context.prefixes << 'entities'
    assign :stage, Setting.unroll(:opportunity_stage)
    assign :per_page, Opportunity.per_page
    assign :sort_by,  Opportunity.sort_by
    assign :ransack_search, Opportunity.ransack
  end

  it "should render list of accounts if list of opportunities is not empty" 


  it "should render a message if there're no opportunities" 

end

