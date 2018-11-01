# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/leads/index" do
  include LeadsHelper

  before do
    view.lookup_context.prefixes << 'entities'
    assign :per_page, Lead.per_page
    assign :sort_by,  Lead.sort_by
    assign :ransack_search, Lead.ransack
    login
  end

  it "should render list of accounts if list of leads is not empty" 


  it "should render a message if there're no leads" 

end

